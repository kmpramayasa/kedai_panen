import 'dart:core';

class Orders {
  int id;
  String product;
  int price;  
  int qty;
  int total;
  String address;
  String notes;
  DateTime date;

  //Constructors
  Orders({this.product, this.price, this.qty, this.total, this.address, this.notes, this.date});
  Orders.withId({this.id, this.product, this.price, this.qty, this.total, this.address, this.notes, this.date});

  //Convert object to map
  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    if(id != null){
      map['id'] = id;
    }    
    map['product'] = product;
    map['price'] = price;
    map['qty'] = qty;
    map['total'] = total;
    map['address'] = address;
    map['notes'] = notes;
    map['date'] = date.toIso8601String();

    return map;
  }

  //Convert map to object
  factory Orders.fromMap(Map<String, dynamic> map){
    return Orders.withId(
      id: map['id'],
      product: map['product'],
      price: map['price'],
      qty: map['qty'],
      total: map['total'],
      address: map['address'],
      notes: map['notes'],
      date: map['date'],
    );
  }

}