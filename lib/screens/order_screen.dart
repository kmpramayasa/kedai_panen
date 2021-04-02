import 'package:flutter/material.dart';
import '../models/products_model.dart';
import '../models/orders_model.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key key, this.productList})
  : super(key: key);

  final Products productList;

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ringkasan Order"),
        backgroundColor: Color(0xFFB2C2B9),  
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 36.0),
        color: Colors.white,

        child: ListView(
          children: <Widget>[

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Info Barang",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF525252),
                    ),                    
                  ),

                  Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage("../../assets/products/" + widget.productList.image),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "${widget.productList.name}",
                            style: TextStyle(
                              color: Color(0xFF313337),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold
                            ),                            
                          ),
                          Text(
                            widget.productList.weight.toString() + " " + widget.productList.unit,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              fontSize: 14.0,
                              color: Color(0xFFA2D463),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )

          ],
        ),
      )
    );
  }
}
