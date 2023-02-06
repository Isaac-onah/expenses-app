import 'dart:io';

import 'package:first/constants/icons.dart';
import 'package:first/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final Expense exp;
  const ExpenseCard(this.exp, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(padding: const EdgeInsets.all(8.0), child: Icon(icons[exp.category]),),
      title: Text(exp.title),
      subtitle: Text(DateFormat('MMM dd, yyyy').format(exp.date)),
      trailing: Text(NumberFormat.currency(locale: Platform.localeName, name: '₦').format(exp.amount)),
    );
  }
}
