import 'package:first/models/database_provider.dart';
import 'package:first/screens/all_expenses.dart';
import 'package:first/widgets/category_screen/category_list.dart';
import 'package:first/widgets/category_screen/total_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Padding(
                        padding: EdgeInsets.only(top:25,bottom: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello!",
                              style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              "Isaac Onah",
                              style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 27.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "What do you want to do today?",
                              style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 200.0,
                        child: TotalChart(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Expenses', style: TextStyle(fontWeight: FontWeight.bold),),
                          TextButton(onPressed: (){Navigator.of(context).pushNamed(AllExpense.name);}, child: Text('View ALL'))
                        ],
                      ),
                      Expanded(child: CategoryList()),
                    ],
                  ),
                ),
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
