//
//  scope.cpp
//  symbolTable
//
//  Created by chencha on 10/28/15.
//  Copyright © 2015 jam-world. All rights reserved.
//

#include "scope.hpp"
#include <iostream>

string scope::printItem() {
    cout << "begins scope: " << mScopeName << endl;
    mTable->printTable();
    return " end \n";
}