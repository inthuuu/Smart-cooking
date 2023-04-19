// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/models/Ingredient.dart';
import 'package:smart_cooking/providers/Ingredient_provider.dart';

class HomeMeat extends StatefulWidget {
  const HomeMeat({Key? key}) : super(key: key);

  @override
  _HomeMeatState createState() => _HomeMeatState();
}

class _HomeMeatState extends State<HomeMeat> {
  @override
  Widget build(BuildContext context) {
    ManageIngredients provider = Provider.of<ManageIngredients>(context);
    var Meat = provider.getMeat();
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
                    ...Meat.map(buildSingleCheckbox).toList(),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget buildSingleCheckbox(Ingredients Meat) {
    return buildCheckbox(
      Meat: Meat,
      onClicked: () {
        setState(() {
          final newValue = !Meat.value;
          Meat.value = newValue;

          // print value test
          if (Meat.value) {
            var provider =
                Provider.of<ManageIngredients>(context, listen: false);
            provider.addIngredients(Meat.name);
            provider.printHaveIn();
          } else if (!Meat.value) {
            var provider =
                Provider.of<ManageIngredients>(context, listen: false);
            provider.removeIngredients(Meat.name);
            provider.printHaveIn();
          }
        });
      },
    );
  }

  Widget buildCheckbox({
    required Ingredients Meat,
    required VoidCallback onClicked,
  }) {
    return ListTile(
      //contentPadding: EdgeInsets.only(left: 20, right: 20, ),
      onTap: onClicked,
      leading: Checkbox(
        activeColor: Color(0xFFEF5142),
        value: Meat.value,
        onChanged: (value) => onClicked(),
      ),
      title: Text(
        Meat.name,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    );
  }
}
