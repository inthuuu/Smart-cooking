// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:smart_cooking/models/Ingredient.dart';
import 'package:smart_cooking/models/Menu.dart';
import 'package:smart_cooking/providers/menu_deep_provider.dart';
import 'package:smart_cooking/providers/menu_grill_provider.dart';
import 'package:smart_cooking/providers/menu_salad_provider.dart';
import 'package:smart_cooking/providers/menu_steam_provider.dart';
import 'package:smart_cooking/providers/menu_stirfry_provider.dart';

class ManageIngredients with ChangeNotifier {
  List<Ingredients> Meat = [
    Ingredients(name: "Bacon"),
    Ingredients(name: "Beef"),
    Ingredients(name: "Chicken"),
    Ingredients(name: "Chicken Feet"),
    Ingredients(name: "Chicken Wings"),
    Ingredients(name: "Cod"),
    Ingredients(name: "Egg"),
    Ingredients(name: "Fish"),
    Ingredients(name: "Mackerel"),
    Ingredients(name: "Mussel"),
    Ingredients(name: "Pork"),
    Ingredients(name: "Pork Belly"),
    Ingredients(name: "Pork Neck"),
    Ingredients(name: "Pork Rip"),
    Ingredients(name: "Sea Clam"),
    Ingredients(name: "Shellfish"),
    Ingredients(name: "Short Mackerel"),
    Ingredients(name: "Shrimp"),
    Ingredients(name: "Squid"),
    Ingredients(name: "Tilapia Fish"),
  ];

  List<Ingredients> getMeat() {
    return Meat;
  }

  List<Ingredients> Vegetable = [
    Ingredients(name: "Cabbage"),
    Ingredients(name: "Carrot"),
    Ingredients(name: "Celery"),
    Ingredients(name: "Chilli"),
    Ingredients(name: "Chinese Cabbage"),
    Ingredients(name: "Chinese Radish"),
    Ingredients(name: "Chinese Spinach"),
    Ingredients(name: "Coriander"),
    Ingredients(name: "Fingerroot"),
    Ingredients(name: "Green Onion"),
    Ingredients(name: "Galangal"),
    Ingredients(name: "Garlic"),
    Ingredients(name: "Ginger"),
    Ingredients(name: "Green Bean"),
    Ingredients(name: "Holy Basil"),
    Ingredients(name: "Iceberg Lettuce"),
    Ingredients(name: "Kale"),
    Ingredients(name: "Kaffir Lime Leaves"),
    Ingredients(name: "Lesser Galangal"),
    Ingredients(name: "Lemongrass"),
    Ingredients(name: "Mint"),
    Ingredients(name: "Oyster Mushroom"),
    Ingredients(name: "Pandan Leaves"),
    Ingredients(name: "Pea Eggplant"),
    Ingredients(name: "Pumpkin Squash"),
    Ingredients(name: "Red Onion"),
    Ingredients(name: "Shallot"),
    Ingredients(name: "Shiitake Mushroom"),
    Ingredients(name: "Sweet Basil"),
    Ingredients(name: "Sweet Onion"),
    Ingredients(name: "Sweet Potato"),
    Ingredients(name: "Thyme"),
    Ingredients(name: "Yard Long Bean"),
    Ingredients(name: "Young Ginger"),
    Ingredients(name: "Young Pepper"),
  ];

  List<Ingredients> getVeg() {
    return Vegetable;
  }

  List<Ingredients> Fruit = [
    Ingredients(name: "Avocado"),
    Ingredients(name: "Green Mango"),
    Ingredients(name: "Green Papaya"),
    Ingredients(name: "Lime"),
    Ingredients(name: "Tomato"),
  ];

  List<Ingredients> getFruit() {
    return Fruit;
  }

  List<Ingredients> Flour = [
    Ingredients(name: "All Purpose Flour"),
    Ingredients(name: "Mung Bean Vermicelli"),
    Ingredients(name: "Rice"),
    Ingredients(name: "Rice Flour"),
    Ingredients(name: "Rice Vermicelli"),
    Ingredients(name: "Tapioca Starch"),
  ];

  List<Ingredients> getFlour() {
    return Flour;
  }

  List<Ingredients> Instant = [
    Ingredients(name: "Crispy Fish"),
    Ingredients(name: "Dried Shrimp"),
    Ingredients(name: "Dried Squid"),
    Ingredients(name: "Egg Tofu"),
    Ingredients(name: "Tofu"),
  ];

  List<Ingredients> getIns() {
    return Instant;
  }

  List<Ingredients> Other = [
    Ingredients(name: "Bread Crumbs"),
    Ingredients(name: "Butter"),
    Ingredients(name: "Corn Syrup"),
    Ingredients(name: "Cumin"),
    Ingredients(name: "Coconut Milk"),
    Ingredients(name: "Chili Powder"),
    Ingredients(name: "Dark Soy Sauce"),
    Ingredients(name: "Dried Chilli"),
    Ingredients(name: "Fermented Anchovy Brine"),
    Ingredients(name: "Fish Sauce"),
    Ingredients(name: "Gochujang Paste"),
    Ingredients(name: "Granulated Garlic"),
    Ingredients(name: "Granulated Onion"),
    Ingredients(name: "Light Soy Sauce"),
    Ingredients(name: "Mayonnaise"),
    Ingredients(name: "Mustard"),
    Ingredients(name: "Oil"),
    Ingredients(name: "Oyster Sauce"),
    Ingredients(name: "Palm Sugar"),
    Ingredients(name: "Panang Curry Paste"),
    Ingredients(name: "Paprika"),
    Ingredients(name: "Peanuts"),
    Ingredients(name: "Pepper"),
    Ingredients(name: "Poultry Seasoning"),
    Ingredients(name: "Sake"),
    Ingredients(name: "Salt"),
    Ingredients(name: "Sesame Seeds"),
    Ingredients(name: "Shrimp Paste"),
    Ingredients(name: "Sour Curry Paste"),
    Ingredients(name: "Stock"),
    Ingredients(name: "Sugar"),
    Ingredients(name: "Tamarind"),
    Ingredients(name: "Thai Chili Paste"),
    Ingredients(name: "Thai Red Curry Paste"),
    Ingredients(name: "Tomato Sauce"),
    Ingredients(name: "Vinegar"),
    Ingredients(name: "Water"),
    Ingredients(name: "Worcestershire Sauce"),
  ];

  List<Ingredients> getOhter() {
    return Other;
  }

  List<menu> MenuGrill = [
    menu(
        name: "Thai Grilled Pork Neck",
        img: "assets/images/types/grill/Thai Grilled Pork Neck.jpg",
        ingredient: Thai_Grilled_Pork_Neck),
    menu(
        name: "Salt Crusted Grilled Fish",
        img: 'assets/images/types/grill/Salt-Crusted Grilled Fish.jpg',
        ingredient: Salt_Crusted_Grilled_Fish),
    menu(
        name: "Grilled Mackerel with Salt",
        img: 'assets/images/types/grill/Grilled Mackerel with Salt.jpg',
        ingredient: Grilled_Mackerel_with_Salt),
    menu(
        name: "Steak",
        img: 'assets/images/types/grill/Steak.jpg',
        ingredient: Steak),
    menu(
        name: "Grilled Chicken with Black Pepper",
        img: 'assets/images/types/grill/Grilled Chicken with Black Pepper.png',
        ingredient: Grilled_Chicken_with_Black_Pepper),
    menu(
        name: "Korean Spicy BBQ Squid",
        img: 'assets/images/types/grill/Korean Spicy BBQ Squid.jpg',
        ingredient: Korean_Spicy_BBQ_Squid),
  ];

  static List<menu> MenuDeep = [
    menu(
        name: "Hat Yai Fried Chicken",
        img: 'assets/images/types/deepfry/Hat-Yai Fried Chicken.jpg',
        ingredient: Hat_Yai_Fried_Chicken),
    menu(
        name: "Omelet",
        img: 'assets/images/types/deepfry/Omelet.jpg',
        ingredient: Omelet),
    menu(
        name: "Pan Fried Crispy Pork Belly",
        img: 'assets/images/types/deepfry/Pan Fried Crispy Pork Belly.png',
        ingredient: Pan_Fried_Crispy_Pork_Belly),
    menu(
        name: "Fried Pork Rip",
        img: 'assets/images/types/deepfry/Fried Pork Rip.jpg',
        ingredient: Fried_Pork_Rip),
    menu(
        name: "Fried Meat",
        img: 'assets/images/types/deepfry/Fried Meat.jpg',
        ingredient: Fried_Meat),
    menu(
        name: "Fried Tofu Stuffed With Pork And Shrimp",
        img:
            'assets/images/types/deepfry/Fried Tofu Stuffed with Pork and Shrimp.jpg',
        ingredient: Fried_Tofu_Stuffed_With_Pork_And_Shrimp),
  ];

  static List<menu> MenuStirfry = [
    menu(
        name: "Garlic Fried Rice with Bacon",
        img: 'assets/images/types/stirfry/Garlic Fried Rice with Bacon.jpg',
        ingredient: Garlic_Fried_Rice_with_Bacon),
    menu(
        name: "Spicy Seafood Stir Fried",
        img: 'assets/images/types/stirfry/Spicy Seafood Stir-Fried.jpg',
        ingredient: Spicy_Seafood_Stir_Fried),
    menu(
        name: "Stir Fried Clam with Chili Paste",
        img: 'assets/images/types/stirfry/Stir-Fried Clam with Chili Paste.jpg',
        ingredient: Stir_Fried_Clam_with_Chili_Paste),
    menu(
        name: "Stir Fried Pork with Shrimp Paste",
        img:
            'assets/images/types/stirfry/Stir-Fried Pork with Shrimp Paste.jpg',
        ingredient: Stir_Fried_Pork_with_Shrimp_Paste),
    menu(
        name: "Stir Fried Chicken with Holy Basil",
        img:
            'assets/images/types/stirfry/Stir-Fried Chicken with Holy Basil.jpg',
        ingredient: Stir_Fried_Chicken_with_Holy_Basil),
    menu(
        name: "Egg Tofu Stir Fry",
        img: 'assets/images/types/stirfry/Egg Tofu Stir-Fry.jpg',
        ingredient: Egg_Tofu_Stir_Fry),
  ];

  List<menu> MenuSalad = [
    menu(
        name: "Mung Bean Vermicelli Salad",
        img: 'assets/images/types/salad/Mung Bean Vermicelli Salad.jpg',
        ingredient: Mung_Bean_Vermicelli_Salad),
    menu(
        name: "Spicy Mango Salad with Crispy Fish",
        img: 'assets/images/types/salad/Spicy Mango Salad with Crispy Fish.jpg',
        ingredient: Spicy_Mango_Salad_with_Crispy_Fish),
    menu(
        name: "Spicy Short Mackerel Salad",
        img: 'assets/images/types/salad/Spicy Short Mackerel Salad.jpg',
        ingredient: Spicy_Short_Mackerel_Salad),
    menu(
        name: "Spicy Rice Vermicelli Salad",
        img: 'assets/images/types/salad/Spicy Rice Vermicelli Salad.jpg',
        ingredient: Spicy_Rice_Vermicelli_Salad),
    menu(
        name: "Chicken Feet Spicy Salad",
        img: 'assets/images/types/salad/Chicken Feet Spicy Salad.jpg',
        ingredient: Chicken_Feet_Spicy_Salad),
    menu(
        name: "Kale Salad with Shrimp",
        img: 'assets/images/types/salad/Kale Salad with Shrimp.jpg',
        ingredient: Kale_Salad_with_Shrimp),
  ];

  List<menu> MenuStream = [
    menu(
        name: "Chinese Vegetable Stew",
        img: 'assets/images/types/steam/Chinese Vegetable Stew.png',
        ingredient: Chinese_Vegetable_Stew),
    menu(
        name: "Omelet Soup",
        img: 'assets/images/types/steam/Omelet Soup.jpg',
        ingredient: Omelet_Soup),
    menu(
        name: "Stuffed Cabbage Soup",
        img: 'assets/images/types/steam/Stuffed Cabbage Soup.jpg',
        ingredient: Stuffed_Cabbage_Soup),
    menu(
        name: "Chicken Red Curry",
        img: 'assets/images/types/steam/Chicken Red Curry.jpg',
        ingredient: Chicken_Red_Curry),
    menu(
        name: "Panang Curry with Pork",
        img: 'assets/images/types/steam/Panang Curry with Pork.jpg',
        ingredient: Panang_Curry_with_Pork),
    menu(
        name: "Sour Curry",
        img: 'assets/images/types/steam/Sour Curry.jpg',
        ingredient: Sour_Curry),
  ];

  List<String> HaveIn = []; //list ingredients ที่มี

  void addIngredients(String name) {
    HaveIn.add(name);
    notifyListeners();
  }

  void removeIngredients(String name) {
    HaveIn.remove(name);
    notifyListeners();
  }

  void printHaveIn() {
    print(HaveIn);
  }

  //list menu ที่ใช้ sort
  List<menu> Menu = [];
  //list menu ที่ sort แล้ว
  List<menu> MenuHave = [];

  String type = ''; //type ที่เลือก

  String getType(List _typefood, int index) {
    type = _typefood[index][0];
    return type;
  }

  void changeType(List<menu> menutype) {
    Menu = []; //list menu ที่ใช้ sort
    Menu = menutype;
    MenuHave = []; //list menu ที่ sort แล้ว
  }

  void typenamefood(List _typefood, int index) {
    if (_typefood[index][0] == 'Grill') {
      type = _typefood[index][0];
      changeType(MenuGrill);
    } else if (_typefood[index][0] == 'Deep Fry') {
      type = _typefood[index][0];
      changeType(MenuDeep);
    } else if (_typefood[index][0] == 'Stir-Fry') {
      type = _typefood[index][0];
      changeType(MenuStirfry);
    } else if (_typefood[index][0] == 'Salad') {
      type = _typefood[index][0];
      changeType(MenuSalad);
    } else if (_typefood[index][0] == 'Steam') {
      type = _typefood[index][0];
      changeType(MenuStream);
    } else {
      type = _typefood[index][0];
    }
  }

  void passSingleMenu(menu singleMenu) {
    Menu = [];
    Menu.add(singleMenu);
  }

  void passMenu(List<menu> menuhave) {
    Menu = [];
    Menu = menuhave;
    MenuHave = [];
  }

  void findTypeForMenu(List<menu> Menu, List<String> HaveIn) {
    for (int i = 0; i < Menu.length; i++) {
      if (FindSame(Menu[i].ingredient, HaveIn)) {
        MenuHave.add(Menu[i]);
      }
    }
  }

  bool FindSame(List<Ingredients> IngredientMenu, List<String> HaveIn) {
    List A = IngredientMenu;
    List B = HaveIn;
    List C = [];
    for (int i = 0; i < A.length; i++) {
      for (int j = 0; j < B.length; j++) {
        if (A[i].name == B[j]) {
          C.add(A[i]);
        }
      }
    }
    if (C.length >= A.length * 0.4) {
      return true;
    } else {
      return false;
    }
  }

  List<String> HaveIngredient(
      List<Ingredients> Ingredientlist, List<String> HaveIn) {
    List A = Ingredientlist;
    List B = HaveIn;
    List<String> C = [];
    for (int i = 0; i < A.length; i++) {
      for (int j = 0; j < B.length; j++) {
        if (A[i].name == B[j]) {
          C.add(A[i].name);
        }
      }
    }
    return C;
  }

  List<String> NotHaveIngredient(
      List<Ingredients> Ingredientlist, List<String> NotHaveIn) {
    List A = Ingredientlist;
    List B = HaveIn;
    List<String> C = [];
    List<String> D = [];

    for (int i = 0; i < A.length; i++) {
      for (int j = 0; j < B.length; j++) {
        if (A[i].name == B[j]) {
          C.add(A[i].name);
        }
      }
    }
    for (int i = 0; i < A.length; i++) {
      D.add(A[i].name);
    }
    for (int i = 0; i < D.length; i++) {
      for (int j = 0; j < C.length; j++) {
        if (D[i] == C[j]) {
          D.remove(C[j]);
        }
      }
    }
    return D;
  }
}
