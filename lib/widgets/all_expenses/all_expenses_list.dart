
import 'package:first/models/database_provider.dart';
import 'package:first/widgets/expense_screen/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllExpensesList extends StatelessWidget {
  const AllExpensesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String color = 'Colors.pink';
    return Consumer<DatabaseProvider>(
        builder: (_, db, __){
          //get the expenses
          var list = db.expenses;
          return list.isNotEmpty ?  ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()
              ),
              itemCount: list.length,
              itemBuilder: (_, i) => ExpenseCard(list[i]),
          ) : const Center(child: Text('No Expenses Added'));
        });
  }
}