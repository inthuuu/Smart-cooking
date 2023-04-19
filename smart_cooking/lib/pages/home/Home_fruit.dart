// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/models/Ingredient.dart';
import 'package:smart_cooking/providers/Ingredient_provider.dart';

class HomeFruit extends StatefulWidget {
  const HomeFruit({Key? key}) : super(key: key);

  @override
  _HomeFruitState createState() => _HomeFruitState();
}

class _HomeFruitState extends State<HomeFruit> {
  @override
  Widget build(BuildContext context) {
    ManageIngredients provider = Provider.of<ManageIngredients>(context);
    var Fruit = provider.getFruit();
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
                    ...Fruit.map(buildSingleCheckbox).toList(),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget buildSingleCheckbox(Ingredients Fruit) {
    return buildCheckbox(
      Fruit: Fruit,
      onClicked: () {
        setState(() {
          final newValue = !Fruit.value;
          Fruit.value = newValue;

          // print value test
          if (Fruit.value) {
            var provider =
                Provider.of<ManageIngredients>(context, listen: false);
            provider.addIngredients(Fruit.name);
            provider.printHaveIn();
          } else if (!Fruit.value) {
            var provider =
                Provider.of<ManageIngredients>(context, listen: false);
            provider.removeIngredients(Fruit.name);
            provider.printHaveIn();
          }
        });
      },
    );
  }

  Widget buildCheckbox({
    required Ingredients Fruit,
    required VoidCallback onClicked,
  }) {
    return ListTile(
      //contentPadding: EdgeInsets.only(left: 20, right: 20, ),
      onTap: onClicked,
      leading: Checkbox(
        activeColor: Color(0xFFEF5142),
        value: Fruit.value,
        onChanged: (value) => onClicked(),
      ),
      title: Text(
        Fruit.name,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    );
  }
}
