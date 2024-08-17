// 1)

// void main(List<String> args) {
//   int num = 7;
//   if (isPrime(num)) {
//     print("$num is prime");
//   } else {
//     print("$num is not prime");
//   }
// }

// bool isPrime(int num) {
//   for (int i = 2; i < num; i++) {
//     if (num % i == 0) {
//       return false;
//     }
//   }
//   return true;
// }

// 2)
// void main(List<String> args) {
//   String text = 'MoHMMAED'; //8
//   if (text.length % 2 != 0) {
//     String middle = text.substring(text.length ~/ 2, text.length ~/ 2 + 1);
//     print(middle);
//   } else {
//     String middle = text.substring(text.length ~/ 2 - 1, text.length ~/ 2 + 1);
//     print(middle);
//   }
// }

// 3

void main(List<String> args) {
  String text = 'I Want to be a programmer and I want to be a good programmer';
  List<String> words = text.split(' ');
  print(words.length);
}
