// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:smart_cooking/pages/TypeOfFood.dart';
import 'package:smart_cooking/pages/home/Home_instant.dart';
import 'package:smart_cooking/pages/home/Home_meat.dart';
import 'package:smart_cooking/pages/home/Home_veg.dart';
import 'package:smart_cooking/pages/home/Home_fruit.dart';
import 'package:smart_cooking/pages/home/Home_flour.dart';
import 'package:smart_cooking/pages/home/Home_other.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    super.initState();
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      //-------------------------------------------------- menu animation
      backdropColor: Colors.grey.shade800,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(-20.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),

      //--------------------------------------------------- menu
      drawer: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "SMART\nCOOKING",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  color: Colors.grey.shade700,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  leading: Icon(Icons.home_filled),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TypeOfFood()));
                  },
                  leading: Icon(Icons.lunch_dining_rounded),
                  title: Text('Types of food'),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Terms of Service | Privacy Policy',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

      //--------------------------------------------------- screen
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: DefaultTabController(
            length: 6, // tab bar length
            child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, value) {
                return [
                  SliverAppBar(
                    expandedHeight: 225.0, // appBar height
                    elevation: 0,
                    pinned: true,
                    stretch: true,
                    toolbarHeight: 80,
                    backgroundColor: Colors.grey.shade100,
                    leading: IconButton(
                      color: Colors.black,
                      onPressed: _handleMenuButtonPressed,
                      icon: ValueListenableBuilder<AdvancedDrawerValue>(
                        valueListenable: _advancedDrawerController,
                        builder: (_, value, __) {
                          return AnimatedSwitcher(
                            duration: Duration(milliseconds: 250),
                            child: Icon(
                              value.visible
                                  ? Icons.close_rounded
                                  : Icons.menu_rounded, // icon on appBar (menu)
                              key: ValueKey<bool>(value.visible),
                            ),
                          );
                        },
                      ),
                    ),

                    //-------------------------------------------------- head title
                    title: AnimatedOpacity(
                      opacity: _isScrolled ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Column(
                        children: [
                          Text(
                            'Select your ingredients', // small title
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      titlePadding: const EdgeInsets.symmetric(horizontal: 20),
                      title: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _isScrolled ? 0.0 : 1.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FadeIn(
                              duration: const Duration(milliseconds: 400),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Select\nyour ingredients', // big title
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),

                    //--------------------------------------------------- tab bar
                    bottom: TabBar(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        isScrollable: true,
                        labelColor: Color(0xFFEF5142),
                        unselectedLabelColor: Colors.grey.shade500,
                        indicatorColor: Color(0xFFEF5142),
                        indicatorWeight: 3,
                        tabs: [
                          Tab(
                            child: Text("Meat", style: TextStyle(fontSize: 16)),
                          ),
                          Tab(
                            child: Text("Vegetables",
                                style: TextStyle(fontSize: 16)),
                          ),
                          Tab(
                            child:
                                Text("Fruits", style: TextStyle(fontSize: 16)),
                          ),
                          Tab(
                            child:
                                Text("Flour", style: TextStyle(fontSize: 16)),
                          ),
                          Tab(
                            child: Text("Instants",
                                style: TextStyle(fontSize: 16)),
                          ),
                          Tab(
                            child:
                                Text("Others", style: TextStyle(fontSize: 16)),
                          ),
                        ]),
                  ),
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  HomeMeat(),
                  HomeVeg(),
                  HomeFruit(),
                  HomeFlour(),
                  HomeInstant(),
                  HomeOther()
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: (Padding(
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TypeOfFood()));
              },
              padding: EdgeInsets.all(15),
              color: Color(0xFFEF5142),
              textColor: Colors.white,
              child: Text('Next',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
            ),
          )),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
