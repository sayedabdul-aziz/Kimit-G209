void main() {
  // display("Ahmed Sayed Zizo", 26, "Zamalek");
  // display1("Ahmed Sayed Zizo", 26);
  // display2(name: "Zizo", team: "ZSC", age: 26);
  // display3(team: "Zamalek", name: "Zizo", age: 26);
  display4("ZIZO", age: 25);
  Map<String, int> list = {"A": 32, "B": 234};
  list.forEach((key, value) {
    //
  });
}

// 1) Positional (ordered,required)
void display(String name, int age, String team) {
  print("$name : $age : $team");
}

// 2) Positional (ordered,required and optional)
void display1(String name, int age, [String team = "Zamalek"]) {
  print("$name : $age : $team");
}

//3) NAMED (NOT ordered , required)
void display2({required String name, required int age, required String team}) {
  print("$name : $age : $team");
}

//4) NAMED (NOT ordered , required and optional)
void display3({required String name, required int age, String? team = "zsc"}) {
  print("$name : $age : $team");
}

//5) Mix (NOT ordered , required and optional)
void display4(String name, {required int age, String? team = "zsc"}) {
  print("$name : $age : $team");
}
