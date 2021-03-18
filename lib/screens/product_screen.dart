import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/products_model.dart';
import '../screens/product_detail_screen.dart';


class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Produk Kedai Panen",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF389048),
              ),
            )
          ],
        ),
      ),

      body: Container(
        padding: EdgeInsets.fromLTRB(36, 24, 36, 24),
        color: Colors.white,

        child: GridView.builder(
          itemCount: Product.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            childAspectRatio: 0.8,
          ),          
          primary: false,
          
          itemBuilder: (BuildContext context, int index){
            Products productList = Product[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProductDetailScreen(productList: productList),
                  )
                );
              },
              child: ProductWidget(
                productList: productList
              ),
            );
          },          
        ),                              
      )
    );    
  }
}

class ProductWidget extends StatelessWidget {

  ProductWidget({
    Key key, this.productList
  }): super(key: key);

  final Products productList;
  final star = <Widget>[];

  @override
  Widget build(BuildContext context) {
    
    for(var i = 0; i < productList.rating; i++){
      star.add(
        new Icon(FontAwesomeIcons.star, size: 10, color: Colors.yellow)
      );
    }
    
    return Container(   
      height: 300.0,           
      child: Stack(
        children: <Widget>[


          // Container(
          //   margin: EdgeInsets.all(10),
          //   width: 200.0,
          //   child: Stack(
          //     alignment: Alignment.topCenter,
          //     children: <Widget>[                                                

          //       Container(
          //         decoration: BoxDecoration(                      
          //           borderRadius: BorderRadius.circular(18.0)
          //         ),
          //         child: Stack(
          //           children: <Widget>[
          //             Image(
          //               height: 150.0,
          //               width: 200.0,
          //               image: AssetImage("assets/products/" + productList.image),
          //               fit: BoxFit.cover,                          
          //             ),
          //             Container(                                                   
          //               padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
          //               color: Color(0xFF389048),
          //               child: Text(
          //                 productList.category,
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.bold,                              
          //                   color: Colors.white
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       ), 

          //       Positioned(
          //         bottom: 10.0,
          //         child: Container(
          //           height: 120.0,
          //           width: 200.0,
          //           padding: EdgeInsets.all(16.0),
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(18.0),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.grey.withOpacity(0.3),
          //                 spreadRadius: 3,
          //                 blurRadius: 7,
          //                 offset: Offset(0,3),
          //               )
          //             ]
          //           ),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.end,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: <Widget>[
          //               Row(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: <Widget>[
          //                   Text(
          //                     '${productList.name}',
          //                     style: TextStyle(
          //                       fontSize: 16.0,
          //                       fontWeight: FontWeight.bold,
          //                       fontFamily: 'Roboto',
          //                     ),
          //                   ),
          //                   Container(
          //                     child: Row(
          //                       children: star,
          //                     ),
          //                   )  
          //                 ],
          //               ),
                        

          //               Text(
          //                 productList.weight.toString() + " " + productList.unit,
          //                 style: TextStyle(
          //                   color: Color(0xFFA2D463),
          //                 ),
          //               ),
                        
          //               Text(
          //                 "Rp. " + productList.price.toString(),
          //                 style: TextStyle(
          //                   color: Color(0xFFff7f50),
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 15,
          //                   fontFamily: 'Roboto'
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ), 
                            
          //     ],

              
          //   ),
          // ),

          Container(            
            width: 200.0,                                 
            decoration: BoxDecoration(              
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0,3),
                )
              ],              
            ),
            child: Column(              
              children: <Widget>[
                Image(
                  height: 150.0,
                  width: 200.0,
                  image: AssetImage("assets/products/" +productList.image), 
                  fit: BoxFit.cover,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${productList.name}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Container(
                            child: Row(
                              children: star,
                            ),
                          )  
                        ],
                      ),
                      

                      Text(
                        productList.weight.toString() + " " + productList.unit,
                        style: TextStyle(
                          color: Color(0xFFA2D463),
                        ),
                      ),
                      
                      Text(
                        "Rp. " + productList.price.toString(),
                        style: TextStyle(
                          color: Color(0xFFff7f50),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Roboto'
                        ),
                      ),                                            
                    ],
                  ),  
                ),
                                                                    
              ],
            ),
          ),          
        ],
      ),
    );
  }
}