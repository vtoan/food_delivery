import 'package:flutter/material.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/repositories/favoriteRepo.dart';
import 'package:food_delivery/widgets/counter.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen(this.product, Key key) : super(key: key);
  @override
  _DetailsScreen createState() => _DetailsScreen(product);
}

class _DetailsScreen extends State<DetailsScreen> {
  final Product product;
  bool _isFavorite = false;

  _DetailsScreen(this.product);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FavoriteRepo.checkFavorite(product.id).then((value) => setState(() {
          _isFavorite = value;
        }));
  }

  void onFavorite() {
    FavoriteRepo.setFavorite(product.id).then((value) => setState(() {
          _isFavorite = !_isFavorite;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.chevron_left,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.shopping_basket,
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, 'order')),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Hero(
                        tag: '${product.id}',
                        child: Image.asset(
                          "${product.img}",
                          width: MediaQuery.of(context).size.width * .7,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${product.title}",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        IconButton(
                          icon: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: () => onFavorite(),
                        ),
                      ],
                    ),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      "${product.description}",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "\$ ${product.price}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Counter(product: product),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
