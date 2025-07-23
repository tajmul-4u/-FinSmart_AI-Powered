#ifndef ACCOUNT_H
#define ACCOUNT_H

#include <vector>
#include <string>

class Account {
private:
    int accountID;
    double balance;
public:
    Account(int id);
    void deposit(double amount);
    void withdraw(double amount);
    double getBalance() const;
};

#endif
