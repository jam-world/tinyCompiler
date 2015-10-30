//
//  variable.hpp
//  symbolTable
//
//  Created by chencha on 10/28/15.
//  Copyright © 2015 jam-world. All rights reserved.
//

#ifndef variable_hpp
#define variable_hpp

#include <stdio.h>
#include "item.hpp"

class variable: public item {
private:
    int mSize;
    string mType;
public:
    variable(int size, string type, bool isExtern):item("variable", isExtern), mSize(size), mType(type) {} // constructor
    string printItem();
    void setType(string type) {mType = type;}
    void setSize(int size) {mSize = size;}
};

#endif /* variable_hpp */
