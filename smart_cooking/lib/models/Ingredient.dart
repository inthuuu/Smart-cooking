// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

class Ingredients {
  final String name;
  bool value;

  Ingredients({
    required this.name,
    this.value = false,
  });
}
