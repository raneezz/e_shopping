import 'package:e_shopping/src/models/sub_category_model.dart';
import 'package:e_shopping/src/repo/Repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SubCategoryBloc {
  final repository = Repository();

  final subcategory_data = PublishSubject<SubCategoryModel>();

  Stream<SubCategoryModel> get subdataResponse => subcategory_data.stream;

  dispose() {
    subcategory_data.close();
  }

  getSubCateItems(String id, String page) async {
    SubCategoryModel data = await repository.getSubCategoryItems(id, page);
    if (data != null) {
      subcategory_data.sink.add(data);
    } else {
      print("error");
    }
  }

  listItem(BuildContext context, int index, List<SubCategory> list) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Card(
                elevation: 1,
                shadowColor: Colors.grey.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              list[index].image!,
                              width: 75,
                              height: 75,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(list[index].title!,
                                      maxLines: 3,
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("${list[index].productCount!} items",
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13.0))
                                ]),
                          ],
                        ),
                      ],
                    )))));
  }
}
