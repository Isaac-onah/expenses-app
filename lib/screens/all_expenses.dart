import 'package:first/models/database_provider.dart';
import 'package:first/widgets/all_expenses/all_expenses_fetcher.dart';
import 'package:first/widgets/expense_screen/expense_chart.dart';
import 'package:first/widgets/expense_screen/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class AllExpense extends StatefulWidget {
  const AllExpense({Key? key}) : super(key: key);
  static const name = '/all_expenses';

  @override
  State<AllExpense> createState() => _AllExpenseState();
}

class _AllExpenseState extends State<AllExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('loose'),),
      body: AllExpensesFetcher(),
    );
  }
}
