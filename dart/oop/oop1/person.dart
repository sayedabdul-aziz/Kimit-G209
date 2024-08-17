class Person {
  // attr.
  String? name;
  String? gender;
  int? age;

  Person({required this.name, required this.gender, required this.age});
  Person.setAge({required this.age});
  // Person(String name, String gender, int age) {
  //   this.name = name;
  //   this.gender = gender;
  //   this.age = age;
  // }

  // methods
  void display() {
    print("$name : $age :$gender");
  }
}
