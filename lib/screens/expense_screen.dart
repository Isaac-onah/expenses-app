import 'package:first/widgets/expense_screen/expense_fetcher.dart';
import 'package:flutter/material.dart';


class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({Key? key}) : super(key: key);
  static const name = '/expense_screen';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Center(
        child: ExpenseFetcher(category),
      ),
    );
  }
}

