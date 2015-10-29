//
//  function.cpp
//  symbolTable
//
//  Created by chencha on 10/28/15.
//  Copyright © 2015 jam-world. All rights reserved.
//

#include "function.hpp"
#include <string>
using namespace std;

// print the item
string func::printItem() {
    return item::printItem() + " type: " + funType + "para number: " + to_string(numOfPara);
}