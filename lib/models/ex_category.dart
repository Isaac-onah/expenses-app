
import 'package:first/constants/icons.dart';
import 'package:flutter/material.dart';

class ExpenseCategory{
  final String title;
  int entries =0; //how many expenses are in this category. it will change overtime
  double totalAmount = 0.0; //total amount of expenses in this category
  final IconData icon; //we will define some constant icons

  //constructor
  ExpenseCategory({
    required this.title,
    required this.entries,
    required this.totalAmount,
    required this.icon,
});

  //we need a method to convert this 'model' to a 'map'
//so that we can insert it into a database

Map<String, dynamic> toMap() =>
    {
      'title': title,
      'entries': entries,
      'totalAmount': totalAmount.toString(),
      //our database wont be able to store double values so we convert to a string
      //not gonna store icons in database. that is too much work.
    };


//when we retrive the data from the database it will be a 'map'
//for our app to understand the data, we need to convert it back to expenses category

factory ExpenseCategory.fromString(Map<String, dynamic> value)=>ExpenseCategory(
    title: value['title'],
    entries: value['entries'],
    totalAmount: double.parse(value['totalAmount']),
    //it will search the 'icons' map and find the value related to the title.
    icon: icons[value['title']]!);

}