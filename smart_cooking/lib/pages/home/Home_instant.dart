// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/models/Ingredient.dart';
import 'package:smart_cooking/providers/Ingredient_provider.dart';

class HomeInstant extends StatefulWidget {
  const HomeInstant({Key? key}) : super(key: key);

  @override
  _HomeInstantState createState() => _HomeInstantState();
}

class _HomeInstantState extends State<HomeInstant> {
  @override
  Widget build(BuildContext context) {
    ManageIngredients provider = Provider.of<ManageIngredients>(context);
    var Instant = provider.getIns();
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
                    ...Instant.map(buildSingleCheckbox).toList(),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget buildSingleCheckbox(Ingredients Instant) {
    return buildCheckbox(
      Instant: Instant,
      onClicked: () {
        setState(() {
          final newValue = !Instant.value;
          Instant.value = newValue;

          // print value test
          if (Instant.value) {
            var provider =
                Provider.of<ManageIngredients>(context, listen: false);
            provider.addIngredients(Instant.name);
            provider.printHaveIn();
          } else if (!Instant.value) {
            var provider =
                Provider.of<ManageIngredients>(context, listen: false);
            provider.removeIngredients(Instant.name);
            provider.printHaveIn();
          }
        });
      },
    );
  }

  Widget buildCheckbox({
    required Ingredients Instant,
    required VoidCallback onClicked,
  }) {
    return ListTile(
      //contentPadding: EdgeInsets.only(left: 20, right: 20, ),
      onTap: onClicked,
      leading: Checkbox(
        activeColor: Color(0xFFEF5142),
        value: Instant.value,
        onChanged: (value) => onClicked(),
      ),
      title: Text(
        Instant.name,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    );
  }
}
