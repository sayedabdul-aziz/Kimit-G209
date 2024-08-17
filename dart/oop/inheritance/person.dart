class Person {
  int? id;
  String? name;
  int? age;
  Person({required this.name, required this.age, required this.id});

  display() {
    print("ay 7aga");
  }
}

class Student extends Person {
  int? grade;

  Student(this.grade,
      {required super.name, required super.age, required super.id});
  // Student(this.grade, String name, int age, int id)
  //     : super(name: name, age: age, id: id);

  @override
  display() {
    super.display(); //
    print("$name : $age : $grade");
  }
}
