class BankAccount {
  String name;
  double balance;
  BankAccount(this.name, this.balance);

  void deposit(double amount) {
    this.balance += amount;
  }

  bool withdraw(double amount) {
    if (this.balance >= amount) {
      this.balance -= amount;
      return true;
    }
    return false;
  }

  double checkBalance() {
    return this.balance;
  }

  bool transfer(BankAccount other, double amount) {
    if (this.balance >= amount) {
      this.balance -= amount;
      other.balance += amount;
      return true;
    }
    return false;
  }
}
