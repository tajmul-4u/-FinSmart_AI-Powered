#include <iostream>
#include "User.h"
#include "Account.h"

int main() {
    std::cout << "Welcome to FinSmart++!" << std::endl;

    User user(1, "John Doe", "john@example.com");
    user.setPassword("1234");

    Account acc(1001);
    acc.deposit(500);
    acc.withdraw(100);

    std::cout << "Current Balance: " << acc.getBalance() << std::endl;

    return 0;
}
