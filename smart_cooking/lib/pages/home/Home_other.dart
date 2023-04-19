// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cooking/models/Ingredient.dart';
import 'package:smart_cooking/providers/Ingredient_provider.dart';

class HomeOther extends StatefulWidget {
  const HomeOther({Key? key}) : super(key: key);

  @override
  _HomeOtherState createState() => _HomeOtherState();
}

class _HomeOtherState extends State<HomeOther> {
  @override
  Widget build(BuildContext context) {
    ManageIngredients provider = Provider.of<ManageIngredients>(context);
    var Other = provider.getOhter();
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
                    ...Other.map(buildSingleCheckbox).toList(),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Widget buildSingleCheckbox(Ingredients Other) {
    return buildCheckbox(
      Other: Other,
      onClicked: () {
        setState(() {
          final newValue = !Other.value;
          Other.value = newValue;

          // print value test
          if (Other.value) {
            var provider =
                Provider.of<ManageIngredients>(context, listen: false);
            provider.addIngredients(Other.name);
            provider.printHaveIn();
          } else if (!Other.value) {
            var provider =
                Provider.of<ManageIngredients>(context, listen: false);
            provider.removeIngredients(Other.name);
            provider.printHaveIn();
          }
        });
      },
    );
  }

  Widget buildCheckbox({
    required Ingredients Other,
    required VoidCallback onClicked,
  }) {
    return ListTile(
      //contentPadding: EdgeInsets.only(left: 20, right: 20, ),
      onTap: onClicked,
      leading: Checkbox(
        activeColor: Color(0xFFEF5142),
        value: Other.value,
        onChanged: (value) => onClicked(),
      ),
      title: Text(
        Other.name,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    );
  }
}
