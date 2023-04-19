// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/pages/HomePage.dart';
import 'package:smart_cooking/pages/Menu.dart';
import 'package:smart_cooking/providers/Ingredient_provider.dart';

class TypeOfFood extends StatefulWidget {
  const TypeOfFood({Key? key}) : super(key: key);

  @override
  _TypeOfFoodState createState() => _TypeOfFoodState();
}

class _TypeOfFoodState extends State<TypeOfFood> {
  final List<dynamic> _typefood = [
    ['Grill', 'assets/images/types/grill.png'],
    ['Deep Fry', 'assets/images/types/deepfry.png'],
    ['Stir-Fry', 'assets/images/types/stirfry.png'],
    ['Salad', 'assets/images/types/salad.png'],
    ['Steam', 'assets/images/types/steam.png'],
    ['Others', 'assets/images/types/others.png']
  ];

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

      //------------------------------------------------- screen
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomScrollView(slivers: [
              SliverAppBar(
                collapsedHeight: 165.0,
                elevation: 0,
                pinned: true,
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
                              : Icons.menu_rounded,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(left: 20, right: 20),
                  title: Text(
                    'Select\ntypes of food',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 35,
                      crossAxisCount: 2,
                    ),
                    itemCount: _typefood.length,
                    itemBuilder: (BuildContext context, index) {
                      return FadeInUp(
                        duration: Duration(milliseconds: 500),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 10,
                                spreadRadius: 0,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.red,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                            onPressed: () {
                              var provider = Provider.of<ManageIngredients>(
                                  context,
                                  listen: false);

                              provider.typenamefood(_typefood, index);
                              provider.getType(_typefood, index);

                              provider.findTypeForMenu(
                                  provider.Menu, provider.HaveIn);

                              provider.passMenu(provider.MenuHave);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Menu()));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: _buildImageWidget(_typefood[index][1]),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  _typefood[index][0],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
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
      ),
    );
  }

  Image _buildImageWidget(String imagePath) {
    return Image.asset(
      imagePath,
      height: 75,
      width: 75,
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
