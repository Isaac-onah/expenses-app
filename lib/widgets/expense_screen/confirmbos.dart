





import 'package:first/models/database_provider.dart';
import 'package:first/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmBox extends StatelessWidget {
  const ConfirmBox({Key? key, required this.exp}) : super(key: key);
  final Expense exp;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DatabaseProvider>(context, listen: false);
    return AlertDialog(
      title: Text('Delete ${exp.title}'),
      content: Row(
        children: [
          TextButton(onPressed: (){
            Navigator.of(context).pop(false);
          }, child: const Text('Don\'t delete')),
          const SizedBox(
            width: 5.0,
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop(true);
            provider.deleteExpense(exp.id, exp.category, exp.amount);
          }, child: const Text('Delete'))
        ],
      ),
    );
  }
}