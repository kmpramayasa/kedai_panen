import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layout/models/products_model.dart';
import 'package:layout/screens/transaction_screen.dart';
import 'package:layout/screens/wishlist_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      

      appBar: AppBar(
        title: Center(
          child: Text(
            "Profil Saya",
              style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w300),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0), bottomLeft: Radius.circular(16.0))),
        backgroundColor: Color(0xFF389048),
        elevation: 0,
      ),

      body: Container(
        margin: EdgeInsets.only(top: 18.0),
        // padding: EdgeInsets.symmetric(horizontal: 36.0),
        
        color: Colors.white,
        child: ListView(
          children: <Widget>[                       
            
            Container(
              padding: EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                children: <Widget>[
                  
                  Container(     
                    margin: EdgeInsets.only(bottom: 12.0),         
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[                                          
                        //Profile Info
                        Container(
                          margin: EdgeInsets.only(top: 12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              //Profile Photo
                              CircleAvatar(
                                backgroundImage: NetworkImage('https://scontent-sin6-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/p640x640/154824579_3492853340940403_690758322210287145_n.jpg?tp=1&_nc_ht=scontent-sin6-1.cdninstagram.com&_nc_cat=107&_nc_ohc=ZsuNjv7XyZYAX9Kv89o&ccb=7-4&oh=7fce847973d9fc8d55b98d2bc2036dad&oe=607BD920'),
                                maxRadius: 25.0,
                              ),
                              SizedBox(width: 10,),
                              Column(       
                                crossAxisAlignment: CrossAxisAlignment.start,             
                                children: <Widget>[
                                  //Profile Name
                                  Text(
                                    "Komang Pramayasa",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      color: Color(0xFF525252),
                                    ),
                                  ),
                                  //ProfileButton
                                  FlatButton(
                                    onPressed: () => print("ubah"), 
                                    padding: EdgeInsets.symmetric(horizontal: 4),
                                    color: Color(0xFFAFD9BA),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),                                       
                                    ),     
                                    child: Text(
                                      "Ubah Profile", 
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0
                                      ),
                                    ),
                                  ),                                         
                                ],
                              )  
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),          

                  Divider(color: Color(0xFFB2C2B9)),

                  SizedBox(height: 16.0,),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(
                        "Aktivitas Saya",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF525252),
                        ),
                      ),

                      Card(
                        //ListTile
                        child: ListTile(
                          onTap: () => Navigator.push(
                            context, MaterialPageRoute(
                              builder: (BuildContext context) => TransactionScreen()
                            )
                          ),
                          leading: Icon(
                            FontAwesomeIcons.shoppingBag, 
                            color: Color(0xFF389048),
                          ),
                          title: Text(
                            "Daftar Pesanan", 
                            style: TextStyle(
                              color: Color(0xFF525252),  
                              fontFamily: 'Roboto',                      
                            ),
                          ),
                          subtitle: Text(
                            "Lihat daftar pesanan produk Anda.", 
                            style: TextStyle(
                              color: Color(0xFFB2C2B9),  
                              fontFamily: 'Roboto',                      
                            ),
                          ),                          
                        ),                  
                      ),
                      
                      Card(
                        //ListTile
                        child: ListTile(
                          onTap: () => Navigator.push(
                            context, MaterialPageRoute(
                              builder: (BuildContext context) => WishlistScreen()
                            )
                          ),
                          leading: Icon(
                            FontAwesomeIcons.heart, 
                            color: Color(0xFF389048),
                          ),
                          title: Text(
                            "Produk Favorit", 
                            style: TextStyle(
                              color: Color(0xFF525252),   
                              fontFamily: 'Roboto',                     
                            ),
                          ),
                          subtitle: Text(
                            "Lihat produk yang sudah Anda wishlist.", 
                            style: TextStyle(
                              color: Color(0xFFB2C2B9),   
                              fontFamily: 'Roboto',                     
                            ),
                          ),                         
                        ),
                        
                      ),                      
                    ],
                  ),            

                  SizedBox(height: 16.0,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(
                        "Pengaturan Umum",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF525252),
                        ),
                      ),

                      Card(
                        //ListTile
                        child: ListTile(
                          onTap: () => print("Pembayaran"),
                          leading: Icon(
                            FontAwesomeIcons.creditCard, 
                            color: Color(0xFF389048),
                          ),
                          title: Text(
                            "Pembayaran", 
                            style: TextStyle(
                              color: Color(0xFF525252),  
                              fontFamily: 'Roboto',                      
                            ),
                          ),
                          subtitle: Text(
                            "OVO, DANA, GoPay, Kartu Kredit, dan Lainnya", 
                            style: TextStyle(
                              color: Color(0xFFB2C2B9),  
                              fontFamily: 'Roboto',                      
                            ),
                          ),                         
                        ),                  
                      ),
                      
                      Card(
                        //ListTile
                        child: ListTile(
                          onTap: () => print("Notifikasi"),
                          leading: Icon(
                            FontAwesomeIcons.bell, 
                            color: Color(0xFF389048),
                          ),
                          title: Text(
                            "Notifikasi", 
                            style: TextStyle(
                              color: Color(0xFF525252),   
                              fontFamily: 'Roboto',                     
                            ),
                          ),
                          subtitle: Text(
                            "Aplikasi, Chat, dan Lainnya", 
                            style: TextStyle(
                              color: Color(0xFFB2C2B9),   
                              fontFamily: 'Roboto',                     
                            ),
                          ),                         
                        ),
                        
                      ),

                      Card(
                        //ListTile
                        child: ListTile(
                          onTap: () => print("Hubungi Kami"),
                          leading: Icon(
                            FontAwesomeIcons.phoneAlt, 
                            color: Color(0xFF389048),
                          ),
                          title: Text(
                            "Hubungi Kami", 
                            style: TextStyle(
                              color: Color(0xFF525252),  
                              fontFamily: 'Roboto',                      
                            ),
                          ),
                          subtitle: Text(
                            "Ajukan keluhan terhadap tim kami", 
                            style: TextStyle(
                              color: Color(0xFFB2C2B9), 
                              fontFamily: 'Roboto',                       
                            ),
                          ),                          
                        ),
                        
                      ), 

                    ],
                  ),            

                  SizedBox(height: 16.0,),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Lainnya",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF525252),
                        ),
                      ),
                      Card(
                        //ListTile
                        child: ListTile(
                          onTap: () => print("Info"),
                          leading: Icon(
                            FontAwesomeIcons.infoCircle, 
                            color: Color(0xFF389048),
                          ),
                          title: Text(
                            "Tentang Aplikasi", 
                            style: TextStyle(
                              color: Color(0xFF525252),
                              fontFamily: 'Roboto',                        
                            ),
                          ),
                          subtitle: Text(
                            "Pelajari tentang aplikasi kita", 
                            style: TextStyle(
                              color: Color(0xFFB2C2B9),    
                              fontFamily: 'Roboto',                    
                            ),
                          ),                         
                        ),                  
                      ),                                            

                    ],
                  ),
                  
                  SizedBox(height: 12.0,),
                  Column(              
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => print("Keluar"), 
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),  
                          side: BorderSide(color: Color(0xFF389048), width: 1.0)                                      
                        ),     
                        child: Text(
                          "Keluar", 
                          style: TextStyle(
                            color: Color(0xFF389048),
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),     
                    ],
                  )
                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}