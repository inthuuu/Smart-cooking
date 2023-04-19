import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/pages/StarterPage.dart';
import 'package:smart_cooking/providers/Ingredient_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return ManageIngredients();
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Smart Cooking",
        theme: ThemeData(
            fontFamily: 'Poppins', unselectedWidgetColor: Colors.grey.shade700),
        home: StarterPage(),
      ),
    );
  }
}
