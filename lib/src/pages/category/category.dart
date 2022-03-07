import 'package:e_shopping/src/blocs/category_bloc.dart';
import 'package:e_shopping/src/helpers/BadgeIcon.dart';
import 'package:e_shopping/src/helpers/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:e_shopping/src/helpers/alert.dart';
import 'package:flutter/material.dart';
import 'package:e_shopping/src/models/category_model.dart' as list_data;


class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  List<list_data.Category> menu_list = [];
  List<list_data.Products> pro_list = [];
  String banner_imageUrl="";
  int favouriteCount=0;
  int cartCount=0;

  CategoryBloc _categoryBloc = CategoryBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryBloc.getCateItems();
    getRes();
  }


  @override
  void dispose() {
    _categoryBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title:
              const Text('Health Care', style: TextStyle(color: Colors.white)),
          actions: <Widget>[

            BadgeIcon(text:"",
              iconData:  Icons.search,
              notificationCount: 0,
              onTap: () {},
            ),
            BadgeIcon(text:"",
              iconData:  Icons.favorite,
              notificationCount: favouriteCount,
              onTap: () {},
            ),

            BadgeIcon(text:"",
              iconData:  Icons.shopping_cart,
              notificationCount: cartCount,
              onTap: () {},
            ),

          ],
        ),
        body: SingleChildScrollView(
            primary: false,
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(banner_imageUrl),
                        fit: BoxFit.cover,
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                          crossAxisCount: 3, height: 150.0),
                  itemBuilder: (_, index) =>
                      _categoryBloc.menuItem(context, index, menu_list),
                  itemCount: menu_list.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    height: 260,
                  ),
                  itemBuilder: (_, index) =>
                      _categoryBloc.list_Item(context, index, pro_list),
                  itemCount: menu_list.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                ),
              ],
            )));
  }

  void getRes() {

    _categoryBloc.dataResponse.listen((value) {

      if(!value.error!) {

        setState(() {
          banner_imageUrl=value.data!.image!;
          cartCount=value.data!.cartCount!;
          favouriteCount=value.data!.favouriteCount!;

        });

        if (value.data!.category!.isNotEmpty) {
          setState(() {
            menu_list.clear();
          });

          setState(() {
            menu_list.addAll(value.data!.category!);
          });
        }

        if (value.data!.products!.isNotEmpty) {
          setState(() {
            pro_list.clear();
          });

          setState(() {
            pro_list.addAll(value.data!.products!);
          });
        }

      }
      else
        {
          Alert.toast(value.message.toString());
        }

    });

  }
}
