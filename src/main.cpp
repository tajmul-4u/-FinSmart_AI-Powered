#include <iostream>
#include "User.h"
#include "Account.h"
using namespace std;

int main() {
    std::cout << "Welcome to FinSmart++!" <<endl;

    //New User make
    User user(1, "Tajmul", "tajmul@example.com");
    user.setPassword("1234");

    //Getter to access the User Information
    cout<<"User ID: "<<user.getUserID()<<endl;
    cout<<"User Name: "<<user.getName()<<endl;
    cout<<"User Email: "<<user.getEmail()<<endl;

    //Account create
    Account acc(112233);
    acc.deposit(1500);
    acc.withdraw(1000);

    //Getter to Show the balance
    cout << "Account ID: "<<acc.getAccountID()<<endl;
    cout << "Current Balance: " << acc.getBalance() <<endl;

    return 0;
}
