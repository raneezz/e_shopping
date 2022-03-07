import 'package:e_shopping/src/api_provider/CategoryProvider.dart';
import 'package:e_shopping/src/models/category_model.dart';
import 'package:e_shopping/src/models/sub_category_model.dart';
import 'package:flutter/services.dart';


class Repository {
  final CategoryApiProvider = CategoryProvider();


  Future<CategoryModel> getCategoryItems() => CategoryApiProvider.getItems();
  Future<SubCategoryModel> getSubCategoryItems(String id,String page) => CategoryApiProvider.getSubItems(id,page);



}