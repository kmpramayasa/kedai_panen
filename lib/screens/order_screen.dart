import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layout/helpers/database_helper.dart';
import 'package:layout/screens/home_screen.dart';
import 'package:layout/screens/transaction_screen.dart';
import '../models/products_model.dart';
import '../models/orders_model.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key key, this.productList }) 
  :super(key: key);

  final Products productList;

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  Orders order;

  final _formKey = GlobalKey<FormState>();
  int _qty;
  int _total = 0;
  String _address = '';
  String _notes = '';
  DateTime _date = DateTime.now();

  final DateFormat dateFormatter = DateFormat("dd MM yyyy");

  //Form Controller to Store Input Value
  // TextEditingController orderProduct = TextEditingController();
  // TextEditingController orderPrice = TextEditingController();
  TextEditingController orderQty = TextEditingController();
  TextEditingController orderAddress = TextEditingController();
  // TextEditingController orderTotal = TextEditingController();
  TextEditingController orderNotes = TextEditingController();
  // TextEditingController orderDate = TextEditingController();  

  // Get Total Order price
  _totalOrder(){    
    if(orderQty.text != null){
      int price = widget.productList.price;
      int qty = int.tryParse(orderQty.text) ?? 0;

      _total = price*qty;
      return _total;
    }                
  }

  //Submit order procedure
  _submit(){        

    if(_formKey.currentState.validate()){
      _formKey.currentState.save();

      order = Orders(
        product: widget.productList.name, 
        weight: widget.productList.weight,
        unit: widget.productList.unit,
        image: widget.productList.image,
        category: widget.productList.category,
        price: widget.productList.price,
        qty: _qty,
        total: _total,
        address: _address,
        notes: _notes,
        date: _date,
      );          
      
      DatabaseHelper.instance.insertOrder(order);

      print("Pesanan Dibuat");    

      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), 
        (route) => false
      );     
    }    
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Ringkasan Order"),
      //   backgroundColor: Color(0xFFB2C2B9),  
      // ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 36.0),
          color: Colors.white,

          child: ListView(
            children: <Widget>[

              //Checkout header
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF389048),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16))
                ),
                padding: EdgeInsets.all(28.0), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white, size: 16.0,)
                        ),
                        SizedBox(width: 16.0,),
                        Text(
                          "Checkout Barang",
                          style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w300),
                        ),                        
                      ],
                    ),
                    
                    SizedBox(height: 24.0,),

                    //Prouct Info
                    Container(                      
                      child: Column(                    
                        children: <Widget>[                                                    

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,  
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image(
                                  image: AssetImage("../../assets/products/" + widget.productList.image),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,                        
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Column(     
                                  crossAxisAlignment: CrossAxisAlignment.start,                  
                                  children: <Widget>[
                                    Text(
                                      "${widget.productList.name}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold
                                      ),                            
                                    ),
                                    SizedBox(height: 8.0,),
                                    Text(
                                      widget.productList.weight.toString() + " " + widget.productList.unit,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0,
                                        color: Color(0xFFAFD9BA),
                                      ),
                                    ),
                                    SizedBox(height: 8.0,),
                                    Text(
                                      "Rp. " + widget.productList.price.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0,
                                        color: Colors.white,
                                      ),
                                    ),                                    
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 28.0,),

              //Orders Info
              Container(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      "Info Pesanan",
                      style: TextStyle(
                        color: Color(0xFF389048),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 14.0,),

                    //Order Forms
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: TextStyle(fontSize: 16.0),
                            decoration: InputDecoration(
                              hintText: 'Jumlah Pesanan',
                              labelStyle: TextStyle(fontSize: 16.0),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (input) => input.trim().isEmpty 
                            ? 'Mohon masukkan jumlah pesanan' : null,                          
                            controller: orderQty,
                            onSaved: (input) => _qty = int.parse(input),
                            onChanged: (value){},
                          ),
                          SizedBox(height: 12.0),
                          TextFormField(
                            style: TextStyle(fontSize: 16.0),
                            decoration: InputDecoration(
                              hintText: 'Alamat Pesanan',
                              labelStyle: TextStyle(fontSize: 16.0),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                            ),
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 5,
                            validator: (input) => input.trim().isEmpty 
                            ? 'Mohon masukkan alamat pesanan' : null,                          
                            controller: orderAddress,
                            onSaved: (input) => _address = input,
                          ),
                          SizedBox(height: 12.0),
                          TextFormField(
                            style: TextStyle(fontSize: 16.0),
                            decoration: InputDecoration(
                              hintText: 'Note Pesanan',
                              labelStyle: TextStyle(fontSize: 16.0),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,                                                     
                            controller: orderNotes,
                            onSaved: (input) => _notes = input,
                          ),
                          SizedBox(height: 24),

                          // _totalOrder(),
                          //Total Orders
                          Row(                            
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Total Pesanan',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),                                
                              ),
                              Text(
                                "Rp. " + _totalOrder().toString(),
                                style: TextStyle(
                                  color: Color(0xFF389048),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),                         
                              ),
                            ],
                          ),

                          SizedBox(height: 16.0,),

                          Container(
                            height: 50.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFF389048),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: FlatButton(
                              child: Text(
                                "Buat Pesanan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0
                                ),
                              ),
                              onPressed: _submit,
                            ),
                          ),
                        ],
                      )
                    )
                  ],
                ),
              ),              
            ],
          ),
        ),
      )
    );
  }
}
