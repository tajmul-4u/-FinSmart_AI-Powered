#ifndef ACCOUNT_H
#define ACCOUNT_H

class Account {
    private:

    int accountID; //Account an Unique ID
    double balance; //Account current balance

    public:
    //Constructor: Account create as auto ID set and balance initial = 0
    Account(int id);

    //Getter Methods
    int getAccountID() const; //Account ID return
    double getBalance() const; //Show the current balance

    //Setter Methods
    void setBalance(double bal); //Manually balance set

    //Transaction Methods
    void deposit(double amount); //Cash add
    void withdraw(double amount); //Cash minus

};

#endif