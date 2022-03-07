import 'package:e_shopping/src/models/category_model.dart';
import 'package:e_shopping/src/pages/category/sub_category.dart';
import 'package:e_shopping/src/repo/Repository.dart';
import 'package:e_shopping/src/ui/Clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc {
  final repository = Repository();

  final category_data = PublishSubject<CategoryModel>();

  Stream<CategoryModel> get dataResponse => category_data.stream;

  dispose() {
    category_data.close();
  }

  getCateItems() async {
    CategoryModel data = await repository.getCategoryItems();
    if (data != null) {
      category_data.sink.add(data);
    } else {
      print("error");
    }
  }

  menuItem(BuildContext context, int index, List<Category> list) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SubCategoryPage(id:list[index].id!,title:list[index].title!,image:list[index].image!)));
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Column(  crossAxisAlignment: CrossAxisAlignment.center,  mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Card(
                    elevation: 3,
                    shadowColor: Colors.grey.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        list[index].image.toString(),
                        width: 85,
                        height: 85,
                        fit: BoxFit.cover,
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(list[index].title.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0))
              ],
            )));
  }

  list_Item(BuildContext context, int index, List<Products> list) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
              width: 0.3,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text(list[index].uom.toString(),
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                              fontSize: 12))),
                  Visibility(
                      visible: checkValue(list[index].discount),maintainSize: false,replacement: SizedBox(height: 35,),
                      child: Container(
                        child: ClipPath(
                          clipper: ArcClipper(),
                          child: Container(
                              width: 110,
                              height: 35,
                              padding: EdgeInsets.all(5),
                              color: Theme.of(context).buttonColor,
                              child: Center(
                                  child: Text(
                                list[index].discount! + " Discount",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ))),
                        ),
                      )),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Image.network(
                list[index].image!,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(list[index].title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 14))),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("₹ ${list[index].splPrice}",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  SizedBox(
                    width: 10,
                  ),
                  Visibility(
                    visible: checkValue(list[index].discount),
                    child:
                  Text(list[index].price.toString(),
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black26,
                          fontWeight: FontWeight.w700,
                          fontSize: 13))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                  height: 25,
                  color: Theme.of(context).primaryColor,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  child: Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ))
            ],
          )),
    );
  }


  bool checkValue(String? discount) {
    var _show = false;
    if (discount == null || discount == "") {
      _show = false;
    } else {
      _show = true;
    }

    return _show;
  }
}
