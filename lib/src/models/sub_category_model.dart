import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) => SubCategoryModel.fromJson(json.decode(str));
String subCategoryModelToJson(SubCategoryModel data) => json.encode(data.toJson());
class SubCategoryModel {
  SubCategoryModel({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  SubCategoryModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;

  bool? get error => _error;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}


Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? image, 
      String? category, 
      List<SubCategory>? subCategory, 
      List<Products>? products, 
      int? favouriteCount, 
      int? cartCount,}){
    _image = image;
    _category = category;
    _subCategory = subCategory;
    _products = products;
    _favouriteCount = favouriteCount;
    _cartCount = cartCount;
}

  Data.fromJson(dynamic json) {
    _image = json['image'];
    _category = json['category'];
    if (json['sub_category'] != null) {
      _subCategory = [];
      json['sub_category'].forEach((v) {
        _subCategory?.add(SubCategory.fromJson(v));
      });
    }
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _favouriteCount = json['favouriteCount'];
    _cartCount = json['cartCount'];
  }
  String? _image;
  String? _category;
  List<SubCategory>? _subCategory;
  List<Products>? _products;
  int? _favouriteCount;
  int? _cartCount;

  String? get image => _image;
  String? get category => _category;
  List<SubCategory>? get subCategory => _subCategory;
  List<Products>? get products => _products;
  int? get favouriteCount => _favouriteCount;
  int? get cartCount => _cartCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['category'] = _category;
    if (_subCategory != null) {
      map['sub_category'] = _subCategory?.map((v) => v.toJson()).toList();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['favouriteCount'] = _favouriteCount;
    map['cartCount'] = _cartCount;
    return map;
  }

}



Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      String? id, 
      String? title, 
      String? brand, 
      String? stockStatus, 
      String? image, 
      String? discount, 
      int? price, 
      int? splPrice, 
      String? uom, 
      String? varientId,}){
    _id = id;
    _title = title;
    _brand = brand;
    _stockStatus = stockStatus;
    _image = image;
    _discount = discount;
    _price = price;
    _splPrice = splPrice;
    _uom = uom;
    _varientId = varientId;
}

  Products.fromJson(dynamic json) {
    _id = json['_id'];
    _title = json['title'];
    _brand = json['brand'];
    _stockStatus = json['stockStatus'];
    _image = json['image'];
    _discount = json['discount'];
    _price = json['price'];
    _splPrice = json['spl_price'];
    _uom = json['uom'];
    _varientId = json['varientId'];
  }
  String? _id;
  String? _title;
  String? _brand;
  String? _stockStatus;
  String? _image;
  String? _discount;
  int? _price;
  int? _splPrice;
  String? _uom;
  String? _varientId;

  String? get id => _id;
  String? get title => _title;
  String? get brand => _brand;
  String? get stockStatus => _stockStatus;
  String? get image => _image;
  String? get discount => _discount;
  int? get price => _price;
  int? get splPrice => _splPrice;
  String? get uom => _uom;
  String? get varientId => _varientId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title'] = _title;
    map['brand'] = _brand;
    map['stockStatus'] = _stockStatus;
    map['image'] = _image;
    map['discount'] = _discount;
    map['price'] = _price;
    map['spl_price'] = _splPrice;
    map['uom'] = _uom;
    map['varientId'] = _varientId;
    return map;
  }

}


SubCategory subCategoryFromJson(String str) => SubCategory.fromJson(json.decode(str));
String subCategoryToJson(SubCategory data) => json.encode(data.toJson());
class SubCategory {
  SubCategory({
      String? id, 
      String? title, 
      String? image, 
      int? productCount,}){
    _id = id;
    _title = title;
    _image = image;
    _productCount = productCount;
}

  SubCategory.fromJson(dynamic json) {
    _id = json['_id'];
    _title = json['title'];
    _image = json['image'];
    _productCount = json['productCount'];
  }
  String? _id;
  String? _title;
  String? _image;
  int? _productCount;

  String? get id => _id;
  String? get title => _title;
  String? get image => _image;
  int? get productCount => _productCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title'] = _title;
    map['image'] = _image;
    map['productCount'] = _productCount;
    return map;
  }

}