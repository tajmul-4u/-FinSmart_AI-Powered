#include "User.h"
#include<iostream>
using namespace std;


//Constructor: User Object initialize
User::User(int id, const string &name,const string &email) : userID(id),name(name),email(email) {}

//Getter implementations
int User::getUserID() const {
    return userID;
}

string User::getName() const {
    return name;
}

string User::getEmail() const {
    return email;
}

//Setter implementations
void User::setName(const string &newName) {
    name = newName;
}

void User::setEmail(const string &newEmail) {
    email = newEmail;
}

void User::setPassword(const string &pwd) {
    password = pwd;
}

//Login Function (Email and Password to be match for true)
bool User::login(const string &emailInput, const string &pwd) {
    return (emailInput == email && pwd == password);
}