#include "Account.h"
#include <iostream>
using namespace std;

//Constructor
Account::Account(int id) : accountID(id), balance(0.0) {}

//Getter methods
int Account::getAccountID() const {
    return accountID;
}

double Account::getBalance() const {
    return balance;
}

//Setter methods
void Account::setBalance(double bal) {
    balance = bal;
}

//Deposit money
void Account::deposit(double amount) {
    balance += amount;
}

//Withdraw money
void Account::withdraw(double amount) {
    if(amount <= balance)
    balance -= amount;
    else
    cout<<"Insufficient Balance!"<<endl;
}
