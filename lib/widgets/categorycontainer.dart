import 'package:flutter/material.dart';
import 'package:food_delivery/models/category.dart';
import 'package:food_delivery/repositories/categoryRepo.dart';

// ignore: must_be_immutable
class CategoryContainer extends StatefulWidget {
  Function? onChanged;

  CategoryContainer({var key, this.onChanged}) : super(key: key);

  @override
  _CategoryContainer createState() => _CategoryContainer(callback: onChanged);
}

class _CategoryContainer extends State<CategoryContainer> {
  int _active = 0;
  Function? callback;
  late Future<List<Category>> _categories = CategoryRepo.getList();

  _CategoryContainer({this.callback});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
        future: _categories,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            if (data == null) return Text("No data");
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _active = i;
                    });
                    callback!(data[i].id);
                  },
                  child: Container(
                    constraints: BoxConstraints(minWidth: 121),
                    margin:
                        EdgeInsets.only(right: i == data.length - 1 ? 0 : 15.0),
                    decoration: BoxDecoration(
                      color: _active == i ? Colors.red[400] : Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ImageIcon(
                          AssetImage(data[i].icon),
                          color: _active == i ? Colors.white : Colors.black,
                        ),
                        Text("${data[i].title}",
                            style: Theme.of(context).textTheme.button?.apply(
                                color: _active == i ? Colors.white : Colors.black
                            )
                            ),

                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Text("${snapshot.error}");
          }
        });
  }
}
