import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layout/models/products_model.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({Key key, this.productList})
  : super(key: key);

  final Products productList;
  
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  final star = <Widget>[];

  @override
  Widget build(BuildContext context) {

    for(int i = 0; i < widget.productList.rating; i++){
      star.add(new Icon(
       FontAwesomeIcons.star, color: Colors.yellow, size: 15, 
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.productList.name}'),
        backgroundColor: Color(0xFFB2C2B9),        
      ),
      body: ListView(
        children: <Widget>[
          
          //Product Image
          Image(
            image: AssetImage('assets/products/'+ widget.productList.image),
            width: double.infinity,
            height: 250.0,
            fit: BoxFit.cover,
          ),

          //Product Info
          Container(
            padding: EdgeInsets.fromLTRB(36, 24, 36, 0),              
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    //Product Rating
                    Row(
                      children: star,
                    ),

                    //Product Category
                    Container(
                      color: Color(0xFF389048),
                      padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                      child: Text(
                        widget.productList.category,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    
                  ],
                ),

                //Product Price
                Text(
                  '${widget.productList.name}',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 19.0,
                  ),
                ),

                //Product Weight
                Text(
                  widget.productList.weight.toString() + " "+ widget.productList.unit,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    fontSize: 16.0,
                    color: Color(0xFFA2D463),
                  ),
                ),

                //Product Price
                Text(
                  "Rp. " + widget.productList.price.toString(),
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                    color: Color(0xFFff7f50),
                  ),
                ),

              ],
            ),
          ),

          //Product Description
          Container(
            padding: EdgeInsets.fromLTRB(36, 12, 36, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                //Label Text
                Text(
                  "Deskripsi Produk",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Color(0xFFA2D463),
                  ),
                ),

                //Description Text
                Text(
                  widget.productList.description,
                  style: TextStyle(
                    fontFamily: 'Roboto',                      
                    fontSize: 14.0,
                    color: Color(0xFFB2C2B9),
                  ),
                ),
              ],
            ),
          )
        ],
      ),      

      //BottomSheet
      bottomSheet: Container(        
        padding: EdgeInsets.fromLTRB(36, 0, 36, 0),
        margin: EdgeInsets.symmetric(vertical: 12.0),
        height: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // ignore: deprecated_member_use

            Container(                                     
              child: FlatButton(                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Color(0xFFB2C2B9), width: 1.0)                
                ),              
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.heart,
                      color: Color(0xFFB2C2B9),
                      size: 14.0,
                    ),
                    SizedBox(width: 6,),
                    Text(
                      "Wishlist",
                      style: TextStyle(
                        fontSize: 14.0,                        
                        color: Color(0xFFB2C2B9)
                      ),  
                    )
                  ],
                ),
                onPressed: () => print("Wishlist"),
              ),
            ),

            SizedBox(width: 24.0,),

            // ignore: deprecated_member_use
            Container(              
              child: FlatButton(              
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Color(0xFFff7f50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Color(0xFFff7f50), width: 1.0)                
                ),              
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.shoppingCart,
                      color: Colors.white,
                      size: 14.0,
                    ),
                    SizedBox(width: 6.0,),
                    Text(
                      "Beli Sekarang",
                        style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),  
                    )
                  ],
                ),
                onPressed: () => print("Beli Sekarang"),
              ),
            ),            
          ],
        ),
      ),
    );
  }
}