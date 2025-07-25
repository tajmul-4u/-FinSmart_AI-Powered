#ifndef USER_H
#define USER_H

#include <string>
using namespace std;

class User {
    private:
    int userID; //User Unique ID
    string name; //User Name
    string email; //User Email
    string password; //User password (Private Security)


    public:
    //Constructor: New User create auto initialize
    User(int id,const string &name,const string &email);

    //Getter Methods (Encapsulation)
    int getUserID() const; //User ID return
    string getName() const; //User Name return
    string getEmail() const; //User Email return

    //Setter Methods
    void setName(const string &name); //Update Name
    void setEmail(const string &email); //Update Email
    void setPassword(const string &pwd); //Set Password

    //Login function (Email and Password check)
    bool login(const string &email,const string &pwd);
};
#endif
