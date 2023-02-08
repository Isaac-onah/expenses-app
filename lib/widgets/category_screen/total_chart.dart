import 'package:first/models/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:first/models/database_provider.dart';

class TotalChart extends StatefulWidget {
  const TotalChart({super.key});

  @override
  State<TotalChart> createState() => _TotalChartState();
}

class _TotalChartState extends State<TotalChart> {
  @override
  Widget build(BuildContext context) {
    // return Consumer<DatabaseProvider>(
    //     builder: (_, db, __) {
    //       var list = db.categories;
    //       return Row(
    //         children: const[
    //           Expanded(flex: 60, child: Text('Chart')),
    //           Expanded(
    //               flex: 40,
    //               child: PieChart(
    //                 PieChartData(
    //                     sections: list.map((e) => null).toList();
    //                 ),
    //               ))
    //         ],
    //       );
    //     }
    // );
    return const Text("data");
  }
}
