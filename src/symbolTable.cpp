//
//  symbolTable.cpp
//  symbolTable
//
//  Created by chencha on 10/28/15.
//  Copyright © 2015 jam-world. All rights reserved.
//

#include "symbolTable.hpp"
#include <iostream>
using namespace std;

// print the symbol table
void symbolTable::printTable() {
    map<string, item*>::iterator iter;
    for (iter=mTable.begin(); iter!=mTable.end(); iter++) {
        cout << iter->first + " " << (iter->second)->printItem() << endl;
    }
}