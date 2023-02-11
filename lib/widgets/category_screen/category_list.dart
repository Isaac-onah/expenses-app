import 'package:first/models/database_provider.dart';
import 'package:first/widgets/category_screen/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __){
      //get the categories
      var list = db.categories;
      return ListView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
        ),
          itemCount: list.length,
          itemBuilder: (_, i)=>CategoryCard(list[i],Colors.primaries[i]));
    });
  }
}
