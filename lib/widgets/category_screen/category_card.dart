import 'dart:io';

import 'package:first/models/ex_category.dart';
import 'package:first/screens/expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CategoryCard extends StatelessWidget {
  final ExpenseCategory category;
  final Color colors;
  const CategoryCard(this.category, this.colors, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(ExpenseScreen.name, arguments: category.title);
      },
      child: Container(
        margin:
        EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 10,
                spreadRadius: 3,
                offset: Offset(3, 4))
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10,),
              Container(
                color: colors,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                      child: Column(
                        children: [
                          Icon(category.icon, size: 28,color: Colors.white,),
                        ],
                      ),
                    ),

                  ],
                )   ,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(category.title, style: const TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Text('entries: ${category.entries}'),
                        ],
                      ),
                      Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(NumberFormat.currency(locale: Platform.localeName, name: '₦').format(category.totalAmount)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
