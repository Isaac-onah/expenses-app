import 'package:first/models/database_provider.dart';
import 'package:first/widgets/all_expenses/all_expenses_list.dart';
import 'package:first/widgets/all_expenses/expense_search.dart';
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
  late Future _allExpensesList;

  Future _getAllExpenses() async{
    final provider = Provider.of<DatabaseProvider>(context, listen: false);
    return await provider.fetchAllExpenses();
  }

  @override
  void initState(){
    super.initState();
    _allExpensesList = _getAllExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _allExpensesList,
        builder: (_, snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        if(snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()),);
        }else{
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children:[
                ExpenseSearch(),
                Expanded(child: AllExpensesList()),
              ],
            ),
          );
        }
      }else{
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

