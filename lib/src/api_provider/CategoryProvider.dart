import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:e_shopping/src/helpers/Api.dart';
import 'package:e_shopping/src/models/category_model.dart';
import 'package:e_shopping/src/models/sub_category_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class CategoryProvider {
  Future<CategoryModel> getItems() async {
    Response response;
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": Api.token
    };
    try {
      response = await http.post(Uri.parse(Api.base_url + Api.categories),
          headers: headers);

      if (response.statusCode == 200) {
        print("api_Res=== ${response.body}");
        return CategoryModel.fromJson(json.decode(response.body));
      } else {
        print("api error");
        return CategoryModel.fromJson(json.decode(response.body));
      }
    } on SocketException {
      print("error_occured");
      final error = CategoryModel(message: "No Internet Connection");
      return error;
    }
  }

  //sub
  Future<SubCategoryModel> getSubItems(String id, String page) async {
    Response response;
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": Api.token
    };

    final body = jsonEncode({"cat_id": id, "page": page});

    try {
      response = await http.post(Uri.parse(Api.base_url + Api.subcategories),
          headers: headers, body: body);

      if (response.statusCode == 200) {
        print("api_Res=== ${response.body}");
        return SubCategoryModel.fromJson(json.decode(response.body));
      } else {
        print("api error");
        return SubCategoryModel.fromJson(json.decode(response.body));
      }
    } on SocketException {
      print("error_occured");
      final error = SubCategoryModel(message: "No Internet Connection");
      return error;
    }
  }
}
