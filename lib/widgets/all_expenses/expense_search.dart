
import 'package:first/models/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSearch extends StatefulWidget {
  const ExpenseSearch({Key? key}) : super(key: key);

  @override
  State<ExpenseSearch> createState() => _ExpenseSearchState();
}

class _ExpenseSearchState extends State<ExpenseSearch> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return TextField(
      onChanged: (value){
        provider.searchText = value;

      },
      decoration: const InputDecoration(
          labelText: 'search Expenses'
      ),
    );
  }
}