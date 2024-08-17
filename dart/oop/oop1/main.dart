import 'person.dart';

void main() {
  Person p1 = Person(name: "Ali", age: 22, gender: "Male");
  p1.display();
  Person p2 = Person.setAge(age: 12);
  p2.display();
}
