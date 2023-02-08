import 'package:first/models/database_provider.dart';
import 'package:first/widgets/category_screen/category_list.dart';
import 'package:first/widgets/category_screen/total_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryFetcher extends StatefulWidget {
  const CategoryFetcher({Key? key}) : super(key: key);

  @override
  State<CategoryFetcher> createState() => _CategoryFetcherState();
}

class _CategoryFetcherState extends State<CategoryFetcher> {
  late Future _categoryList;

  Future _getCategoryList() async {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);

    return await provider.fetchCategories();
  }

  @override
  void initState() {
    super.initState();
    //fetch the list and set it to _categoryList
    _categoryList = _getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _categoryList,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Column(
                children: const [
                  SizedBox(
                    height: 250.0,
                    child: TotalChart(),
                  ),
                  Expanded(child: CategoryList()),
                ],
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
