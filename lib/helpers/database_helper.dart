import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/orders_model.dart';

class DatabaseHelper{
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _database;

  DatabaseHelper._instance();

  String orderTable = 'orders_table';
  String colId = 'id';
  String colProduct = 'product';
  String colPrice = 'price';
  String colQty = 'qty';
  String colTotal = 'total';
  String colDate = 'date';
  String colNotes = 'notes';

  //Orders Table
  //  |  id  |  product |  price | qty | total | date  | notes |
  //  

Future<Database> get database async{
    if(_database == null){
      _database = await _initDb();
    }
    return _database;
  }

  Future<Database> _initDb() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'kedai_panen.db';
    final todoDatabase = await openDatabase(path, version: 1, onCreate: _createDb);

    return todoDatabase;
  }

  void _createDb(Database db, int version) async {
    db.execute(
      'CREATE TABLE $orderTable($colId INTEGER PRIMARY KET AUTOINCREMENT, $colProduct TEXT, $colPrice INTEGER, $colQty INTEGER, $colTotal INTEGER, $colDate TEXT, $colNotes TEXT)'
    );
  }

  Future<List<Map<String, dynamic>>> getOrderMapList() async{
    Database db = await this.database;
    final List<Map<String, dynamic>> result = await db.query(orderTable);
    return result;
  }

  Future<List<Orders>> getOrderList() async{
    final List<Map<String, dynamic>> orderMapList = await getOrderMapList();
    final List<Orders> orderList = [];
    orderMapList.forEach((orderMap) {
      orderList.add(Orders.fromMap(orderMap));
    });

    return orderList;
  }

  //Insert Order Function
  Future<int> insertOrder(Orders orders) async{
    Database db = await this.database;
    int result = await db.insert(
      orderTable, 
      orders.toMap()
    );
    return result;
  }

  //Update Order Function
  Future<int> updateOrder(Orders orders) async{
    Database db = await this.database;
    int result = await db.update(
      orderTable, 
      orders.toMap(), 
      where: '$colId=?', 
      whereArgs: [orders.id]
    );
    return result;
  }

  //Delete Order Function
  Future<int> deleteOrder(int id) async{
    Database db = await this.database;
    int result = await db.delete(
      orderTable, 
      where: 'id=?',
      whereArgs: [id]
    );
    return result;
  }
}