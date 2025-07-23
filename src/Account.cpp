#include "Account.h"
#include <iostream>

Account::Account(int id) : accountID(id), balance(0.0) {}

void Account::deposit(double amount) {
    balance += amount;
}

void Account::withdraw(double amount) {
    if(amount <= balance) balance -= amount;
    else std::cout << "Insufficient balance!" << std::endl;
}

double Account::getBalance() const {
    return balance;
}
