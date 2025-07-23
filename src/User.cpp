#include "User.h"
#include <iostream>

User::User(int id, const std::string &name, const std::string &email) : userID(id), name(name), email(email) {}

void User::setPassword(const std::string &pwd) {
    password = pwd;
}

bool User::login(const std::string &emailInput, const std::string &pwd) {
    return (emailInput == email && pwd == password);
}
