// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/models/Ingredient.dart';
import 'package:smart_cooking/providers/Ingredient_provider.dart';

class HomeFlour extends StatefulWidget {
  const HomeFlour({Key? key}) : super(key: key);

  @override
  _HomeFlourState createState() => _HomeFlourState();
}

class _HomeFlourState extends State<HomeFlour> {
  @override
  Widget build(BuildContext context) {
    ManageIngredients provider = Provider.of<ManageIngredients>(context);
    var Flour = provider.getFlour();
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Consumer(
          builder: (context, ManageIngredients provider, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  children: [
                    ...Flour.map(buildSingleCheckbox).toList(),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget buildSingleCheckbox(Ingredients Flour) {
    return buildCheckbox(
      Flour: Flour,
      onClicked: () {
        setState(() {
          final newValue = !Flour.value;
          Flour.value = newValue;

          // print value test
          if (Flour.value) {
            var provider =
                Provider.of<ManageIngredients>(context, listen: false);
            provider.addIngredients(Flour.name);
            provider.printHaveIn();
          } else if (!Flour.value) {
            var provider =
                Provider.of<ManageIngredients>(context, listen: false);
            provider.removeIngredients(Flour.name);
            provider.printHaveIn();
          }
        });
      },
    );
  }

  Widget buildCheckbox({
    required Ingredients Flour,
    required VoidCallback onClicked,
  }) {
    return ListTile(
      //contentPadding: EdgeInsets.only(left: 20, right: 20, ),
      onTap: onClicked,
      leading: Checkbox(
        activeColor: Color(0xFFEF5142),
        value: Flour.value,
        onChanged: (value) => onClicked(),
      ),
      title: Text(
        Flour.name,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    );
  }
}
