import 'dart:core';

class Orders {
  int id;
  String product;
  int price;  
  int qty;
  int total;
  DateTime date;
  String notes;

  //Constructors
  Orders({this.product, this.price, this.qty, this.total, this.date, this.notes});
  Orders.withId({this.id, this.product, this.price, this.qty, this.total, this.date, this.notes});

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
    map['date'] = date.toIso8601String();
    map['notes'] = notes;

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
      date: map['date'],
      notes: map['notes'],
    );
  }

}