// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/models/Menu.dart';
import 'package:smart_cooking/pages/MenuDetail.dart';
import 'package:smart_cooking/providers/Ingredient_provider.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ManageIngredients>(context, listen: false);
    String type = provider.type;
    //จำนวนการ์ดเมนู
    int itemcnt = provider.Menu.length;
    //ลิสชื่อเมนูที่มีชื่อ รูป ingredients
    List<menu> list = provider.Menu;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CustomScrollView(slivers: [
            SliverAppBar(
              collapsedHeight: 165,
              elevation: 0,
              pinned: true,
              toolbarHeight: 80,
              backgroundColor: Colors.grey.shade100,
              leading: IconButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_rounded),
              ),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 20, right: 20),
                title: Text(
                  'Select\nyour dish',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 525.0,
                padding: EdgeInsets.only(left: 20, top: 40),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemcnt,
                  itemBuilder: (context, index) {
                    return FadeIn(
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        width: 290.0,
                        margin: EdgeInsets.only(right: 25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            provider.passSingleMenu(list[index]);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuDetail()));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 315,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(list[index].img),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15)),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/images/line.png",
                                              height: 22),
                                          SizedBox(width: 8),
                                          Text(type,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFFEF5142))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(list[index].name,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ])),
    );
  }
}
