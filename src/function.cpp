//
//  function.cpp
//  symbolTable
//
//  Created by chencha on 10/28/15.
//  Copyright © 2015 jam-world. All rights reserved.
//

#include "function.hpp"
#include <string>
#include <iostream>
using namespace std;

// print the item
string func::printItem() {
    cout << "begin function parameter list: " << endl;
    mParaList->printTable();
    cout << "end list" << endl;
    return item::printItem() + " type: " + mFunType + "para number: " + to_string(mNumOfPara);
}