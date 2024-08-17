import 'dart:io';

import 'bank_account.dart';

void main(List<String> args) {
  BankAccount b1 = BankAccount('Ahmed', 10000);
  BankAccount b2 = BankAccount('Mohammed', 20000);
  print('Welcome, ${b1.name}');
  while (true) {
    print(
        'Choose The Operation:\n1)Deposit\n2)Withdraw\n3)Check Balance\n4)Transfer');
    int ope = int.parse(stdin.readLineSync()!);
    switch (ope) {
      case 1:
        print('------------- Deposit Operation ----------------');
        print('Enter the amount:');
        double am = double.parse(stdin.readLineSync()!);
        b1.deposit(am);
        print('Operation Successfully, Your Balance is : ${b1.checkBalance()}');
        break;
      case 2:
        print('------------- Withdraw Operation ----------------');
        print('Enter the amount:');
        double am = double.parse(stdin.readLineSync()!);
        bool res = b1.withdraw(am);
        if (res) {
          print(
              'Operation Successfully, Your Balance is : ${b1.checkBalance()}');
        } else {
          print('Operation Failed, Your Balance is : ${b1.checkBalance()}');
        }
        break;
      case 3:
        print('------------- Check Balance Operation ----------------');
        print('Your Balance is : ${b1.checkBalance()}');
        break;
      case 4:
        print('------------- Transfer Operation ----------------');
        print('Enter the amount:');
        double am = double.parse(stdin.readLineSync()!);
        bool res = b1.transfer(b2, am);
        if (res) {
          print(
              'Operation Successfully, Your Balance is : ${b1.checkBalance()}');
        } else {
          print('Operation Failed, Your Balance is : ${b1.checkBalance()}');
        }
        break;
      default:
        print('Invalid Operation, plz choose from 1 to 4');
    }

    print('Do you want to continue? (y/n)');
    String res = stdin.readLineSync()!;
    if (res.toLowerCase() == 'n') {
      print('Thanks for using our service');
      break;
    }
  }
}
