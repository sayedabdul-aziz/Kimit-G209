class Person {
  //private attr.
  String? _name;
  String? _gender;
  int? _age;

  // methods
  // setName(String name) {
  //   this._name = name;
  // }

  set name(String name) => this._name = name;

  // String getName() {
  //   return this._name ?? '';
  // }

  String get name => this._name ?? '';

  setAge(int age) {
    if (age > 0) {
      this._age = age;
    } else {
      print("Invalid Age!!");
    }
  }
}
