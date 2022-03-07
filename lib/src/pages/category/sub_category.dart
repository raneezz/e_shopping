import 'package:e_shopping/src/blocs/sub_category_bloc.dart';
import 'package:e_shopping/src/helpers/BadgeIcon.dart';
import 'package:flutter/material.dart';
import 'package:e_shopping/src/models/sub_category_model.dart' as list_data;

class SubCategoryPage extends StatefulWidget {
  final String id;
  final String image;
  final String title;

  const SubCategoryPage({
    required this.id,
    required this.title,
    required this.image,
  });

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  List<list_data.SubCategory> _list = [];
  int favouriteCount = 0;
  int cartCount = 0;
  SubCategoryBloc _subcategoryBloc = SubCategoryBloc();

  @override
  void initState() {
    super.initState();
    _subcategoryBloc.getSubCateItems(widget.id, "1");

    getRes();
  }

  @override
  void dispose() {
    _subcategoryBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          actions: <Widget>[
            BadgeIcon(
              text: "",
              iconData: Icons.search,
              notificationCount: 0,
              onTap: () {},
            ),
            BadgeIcon(
              text: "",
              iconData: Icons.favorite,
              notificationCount: favouriteCount,
              onTap: () {},
            ),
            BadgeIcon(
              text: "",
              iconData: Icons.shopping_cart,
              notificationCount: cartCount,
              onTap: () {},
            ),
          ],
        ),
        body: Container(
            color: Theme.of(context).primaryColor,
            height: MediaQuery.of(context).size.height,
            child: Stack(alignment: Alignment.topLeft, children: [
              Container(
                  margin: EdgeInsets.fromLTRB(25, 55, 0, 0),
                  child: Text(widget.title,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 22.0))),
              Container(
                margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(100.0))),
                child: Container(
                    margin: EdgeInsets.fromLTRB(25, 85, 25, 0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: _list.length,
                      scrollDirection: Axis.vertical,
                      primary: true,
                      itemBuilder: (context, index) {
                        return _subcategoryBloc.listItem(context, index, _list);
                      },
                    )),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  alignment: Alignment.topCenter,
                  height: 200,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.network(
                      widget.image,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  )),
            ])));
  }

  void getRes() {
    _subcategoryBloc.subdataResponse.listen((value) {
      if (!value.error!) {
        setState(() {
          cartCount = value.data!.cartCount!;
          favouriteCount = value.data!.favouriteCount!;
        });

        if (value.data!.category!.isNotEmpty) {
          setState(() {
            _list.clear();
          });

          setState(() {
            _list.addAll(value.data!.subCategory!);
          });
        }
      }
    });
  }
}
