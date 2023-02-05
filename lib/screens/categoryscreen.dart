import 'package:first/widgets/category_screen/category_fetcher.dart';
import 'package:first/widgets/expense_form.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  static const name = '/category_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryFetcher(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context,isScrollControlled: true, builder: (__)=> const ExpenseForm());
        },
      ),
    );
  }
}

