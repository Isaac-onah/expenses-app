import 'package:first/models/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';


class ExpenseChart extends StatefulWidget {
  final String category;
  const ExpenseChart(this.category,{super.key});

  @override
  State<ExpenseChart> createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (_, db, __) {
      var maxY = db.calculateEntriesAmount(widget.category)['totalAmount'];
      return BarChart(
        BarChartData(
          minY: 0,
          maxY:maxY,
          barGroups:[],
        ),

      );
    });
  }
}
