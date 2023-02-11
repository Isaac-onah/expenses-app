import 'dart:io';

import 'package:first/constants/icons.dart';
import 'package:first/models/expense.dart';
import 'package:first/widgets/expense_screen/confirmbos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final Expense exp;
  const ExpenseCard(this.exp,{super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(exp.id),
      confirmDismiss: (_) async{
        showDialog(
            context: context,
            builder: (_) => ConfirmBox(exp: exp,)
            );
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
                color:Colors.deepPurpleAccent,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                      child: Column(
                        children: [
                          Icon(icons[exp.category], size: 28,color: Colors.white,),
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
                            child: Text(exp.title, style:GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600) ),),
                          ),
                          Text(DateFormat('MMM dd, yyyy').format(exp.date), style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Color(0xFFA5ABB1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500) ),),
                        ],
                      ),
                      Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(NumberFormat.currency(locale: Platform.localeName, name: '₦').format(exp.amount),style:const TextStyle(
                                  color: Color(0xFFA5ABB1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500) ,),
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


