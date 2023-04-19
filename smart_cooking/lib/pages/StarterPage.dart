// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smart_cooking/pages/HomePage.dart';

class StarterPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEF5142),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
            Image.asset(
              "assets/images/start.png",
              height: 600,
              width: double.infinity,
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: SizedBox(
                height: 65,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Color(0xFFEF5142),
                    shadowColor: Color(0xFF8A362E),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    )
                  ),
                  child: Text("Get Started",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFEF5142),
                    )
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  }
                ),
              ),
            ), 
          ],
        ),
      ),
    );
  }
}
