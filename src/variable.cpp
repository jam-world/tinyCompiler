//
//  variable.cpp
//  symbolTable
//
//  Created by chencha on 10/28/15.
//  Copyright © 2015 jam-world. All rights reserved.
//

#include "variable.hpp"

// print the variable
string variable::printItem() {
    return item::printItem() + " type: " + mType + " size: " + std::to_string(mSize);
}