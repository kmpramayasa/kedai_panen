import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layout/helpers/database_helper.dart';
import 'package:layout/models/orders_model.dart';
import 'package:intl/intl.dart';
import 'package:layout/screens/transaction_detail_screen.dart';
import 'package:sqflite/sqflite.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {

  Future<List<Orders>> _orderList;
  final DateFormat dateFormatter = DateFormat("dd MM yyyy");

  @override
  void initState() {
    super.initState();
    _updateOrderList();
  }

  _updateOrderList(){
    setState(() {
      _orderList = DatabaseHelper.instance.getOrderList();
    });
  }

  _deleteOrderList(int id){
    DatabaseHelper.instance.deleteOrder(id);
    _updateOrderList();
  }

  Widget _buildOrders(Orders order){
    return Card(             
      margin: EdgeInsets.only(bottom: 24.0),
      color: Color(0xFF389048),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 12.0),
                      child: Image(
                        image: AssetImage("../../assets/products/" + order.image),
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          order.product,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold
                          ),  
                        ),
                        Text(
                          order.weight.toString() + order.unit,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0,
                            color: Color(0xFFAFD9BA),
                          ),
                        ),
                        Text(
                          order.qty.toString() + "Barang",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0,
                            color: Color(0xFFDEDEDE),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
                Row(                                            
                  children: <Widget>[
                    Icon(FontAwesomeIcons.calendarAlt, color: Color(0xFFAFD9BA), size: 12.0,),
                    SizedBox(width: 8.0),
                    Text(
                      dateFormatter.format(order.date), 
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFFAFD9BA)
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 10.0,),
            Divider(color: Color(0xFFB2C2B9)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Total Belanja:",
                      style: TextStyle(
                        color: Color(0xFFAFD9BA),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      "Rp. " + order.total.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                Container(
                  height: 20.0,
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red[600],
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: FlatButton(
                    child: Text(
                      "Batalkan Pesanan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0
                      ),
                    ),
                    onPressed: () => _deleteOrderList(order.id),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daftar Pesanan",
            style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w300),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0), bottomLeft: Radius.circular(16.0))),
        backgroundColor: Color(0xFF389048),
        elevation: 0,
      ),
      body: Container(

        margin: EdgeInsets.only(top: 24.0),
        padding: EdgeInsets.symmetric(horizontal: 36.0),
        child: FutureBuilder(
          future: _orderList,
          builder: (context, snapshot){

            // Kondisi ketika tidak terdapat data order
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }

            return ListView.builder(              
            // shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index){    

              return GestureDetector(
                onTap: () => Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => TransactionDetailScreen(orders: snapshot.data)
                  )
                ),
                child: _buildOrders(snapshot.data(index)),
                );
              }
            );
          }        
        )            
      ),  
    );
  }
}