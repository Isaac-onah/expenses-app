import 'package:first/models/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __){
        var exList = db.expenses;
        return ListView.builder(
          itemCount: exList.length,
            itemBuilder: (_, i) => ListTile(title: Text(exList[i].title),));
      },
    );
  }
}