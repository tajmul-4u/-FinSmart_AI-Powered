#ifndef USER_H
#define USER_H

#include <string>

class User {
private:
    int userID;
    std::string name;
    std::string email;
    std::string password;
public:
    User(int id, const std::string &name, const std::string &email);
    void setPassword(const std::string &pwd);
    bool login(const std::string &email, const std::string &pwd);
};

#endif
