import 'package:first/constants/icons.dart';
import 'package:first/models/ex_category.dart';
import 'package:first/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider with ChangeNotifier {
  //in-app memoery for holding the Expense categories temporarily
  List<ExpenseCategory> _categories = [];

  List<ExpenseCategory> get categories => _categories;

  //in-app memoery for holding the Expense  temporarily
  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  Database? _database;

  Future<Database> get database async {
    //database directory
    final dbDirectory = await getDatabasesPath();
    //database name
    const dbName = 'expense_tc.db';
    //full path
    final path = join(dbDirectory, dbName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    return _database!;
  }

  //_createDb function
  static const cTable = 'categoryTable';
  static const eTable = 'expenseTable';

  Future<void> _createDb(Database db, int version) async {
    //this method runs only once. when the database is being created
    //so create the tables here and if you want to insert some initial values
    //insert it in ths function.

    await db.transaction((txn) async {
      //category table
      await txn.execute('''CREATE TABLE $cTable(
          title TEXT, 
          entries INTEGER, 
          totalAmount TEXT
          )''');
      //expense table
      await txn.execute('''CREATE TABLE $eTable(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT, 
          amount TEXT, 
          date TEXT,
          category TEXT
          )''');

      //insert the initial categories
      //this will add all the categories to categories table and initialize
      for (int i = 0; i < icons.length; i++) {
        await txn.insert(cTable, {
          'title': icons.keys.toList()[i],
          'entries': 0,
          'totalAmount': (0.0).toString(),
        });
      }
    });
  }

  //method for fetching categories
  Future<List<ExpenseCategory>> fetchCategories() async {
    //get the database
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.query(cTable).then((data) {
        //'data' is our fetched value
        //convert it form 'map<String, object>' to 'map<String, dynamic>'
        final converted = List<Map<String, dynamic>>.from(data);
        //create a 'ExpenseCategory' from every 'map' in this 'converted'
        List<ExpenseCategory> nList = List.generate(converted.length,
            (index) => ExpenseCategory.fromString(converted[index]));
        //set the value of 'categories' to 'nlist'
        _categories = nList;
        //return the '_categoriea'
        return _categories;
      });
    });
  }

//method to update entries
  Future<void> updateCategory(
      String category, int nEntries, double ntotalAmount) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .update(
              cTable, //category table
              {
                'entries': nEntries, //new value of 'entries'
                'totalAmount': ntotalAmount //new value of 'totalAmount'
              },
              where: 'title == ?', //in table where the title ==
              whereArgs: [category] //this category
              )
          .then((_) {
        // after updating in database, update it in our in-app memory too.
        var file =
            _categories.firstWhere((element) => element.title == category);
        file.entries = nEntries;
        file.totalAmount = ntotalAmount;
        notifyListeners();
      });
    });
  }

  //method to add an expense to database
  Future<void> addExpense(Expense exp) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn
          .insert(eTable, exp.toMap(),
              conflictAlgorithm: ConflictAlgorithm.replace)
          .then((generatedId) {
        //after inserting in a database, we store it in-app memory with new expense with generated id

        final file = Expense(
            id: generatedId,
            title: exp.title,
            amount: exp.amount,
            date: exp.date,
            category: exp.category);
        //add it to '_expenses

        _expenses.add(file);
        //notify the listeners about the change in value of  '_expenses'
        notifyListeners();
        //after we inserts the expense, we need to update the 'entries' and 'total amount' of the related 'category'
        var data = calculateEntriesAmount(exp.category);
        updateCategory(exp.category, data['entries'], data['totalAmount']);
      });
    });
  }

  //calculate amount of entries
  Map<String, dynamic> calculateEntriesAmount(String category){
    double total = 0.0;
    var list = _expenses.where((element) => element.category == category);
    for(final i in list){
      total += i.amount;
    }
    return {'entries': list.length, 'totalAmount':total};
  }
}
