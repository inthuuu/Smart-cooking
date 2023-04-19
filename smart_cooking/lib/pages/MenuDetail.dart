// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/models/Menu.dart';
import 'package:smart_cooking/pages/HomePage.dart';
import 'package:smart_cooking/providers/Ingredient_provider.dart';

class MenuDetail extends StatefulWidget {
  const MenuDetail({Key? key}) : super(key: key);

  @override
  _MenuDetailState createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ManageIngredients>(context, listen: false);
    String type = provider.type;

    //จำนวนการ์ดเมนู
    int itemcnt = provider.Menu.length;

    //ลิสชื่อเมนูที่มีชื่อ รูป ingredients
    List<menu> list = provider.Menu;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 420.0,
            elevation: 0,
            pinned: true,
            toolbarHeight: 80,
            backgroundColor: Color(0xFFEF5142),
            leading: IconButton(
              padding: EdgeInsets.only(left: 30),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                list[0].img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Image.asset("assets/images/line.png", height: 22),
                      SizedBox(width: 9),
                      Text(type, //ชื่อtype
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFEF5142))),
                    ]),
                    SizedBox(height: 15),
                    SizedBox(
                      child: Text(list[0].name, //ชื่อเมนู
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                    ),
                    SizedBox(height: 25),
                    SizedBox(
                      child: Text(
                        "Ingredient Lists",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFEF5142)),
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.only(top: 20),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: provider.HaveIngredient(
                              list[0].ingredient, provider.HaveIn)
                          .length, //length of list of ingredients users have in the fridge
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 23),
                          child: Row(
                            children: [
                              Text(
                                provider.HaveIngredient(list[0].ingredient,
                                        provider.HaveIn)[index]
                                    .toString(), //รายชื่อวัตถุดิบ
                                style: TextStyle(
                                    fontSize: 19, color: Colors.black),
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      child: Text(
                        "Shopping List",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFEF5142)),
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.only(top: 10),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: ((list[0].ingredient.length) -
                          provider.HaveIngredient(
                                  list[0].ingredient, provider.HaveIn)
                              .length), //length of list of ingredients users don't have in the fridge
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          //margin: EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              Text(
                                provider.NotHaveIngredient(
                                        list[0].ingredient,
                                        provider.HaveIngredient(
                                            list[0].ingredient,
                                            provider.HaveIn))[index]
                                    .toString(), //รายชื่อวัตถุดิบ
                                style: TextStyle(
                                    fontSize: 19, color: Color(0xFFEF5142)),
                              ),
                              Expanded(child: Container()),
                              IconButton(
                                color: Color(0xFFEF5142),
                                onPressed: () {},
                                icon: Icon(Icons.shopping_cart_outlined),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: (Padding(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            padding: EdgeInsets.all(15),
            color: Color(0xFFEF5142),
            textColor: Colors.white,
            child: Text('Finish',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
          ),
        )),
      ),
    );
  }
}
