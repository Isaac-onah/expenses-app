import 'package:flutter/material.dart';
import 'package:first/widgets/all_expenses/all_expenses_fetcher.dart';
import 'package:first/widgets/expense_screen/expense_chart.dart';
import 'package:first/widgets/expense_screen/expense_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AllExpensesFetcher extends StatefulWidget {
  const AllExpensesFetcher({Key? key}) : super(key: key);

  @override
  State<AllExpensesFetcher> createState() => _AllExpensesFetcherState();
}

class _AllExpensesFetcherState extends State<AllExpensesFetcher> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
