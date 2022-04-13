class Person {
  String name;
  String age;

  Person({required this.name,  required this.age});

  @override
  String toString() {
    return "Name: $name. Age: $age";
  }
}