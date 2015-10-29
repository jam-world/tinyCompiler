//
//  symbolTable.hpp
//  symbolTable
//
//  Created by chencha on 10/28/15.
//  Copyright © 2015 jam-world. All rights reserved.
//

#ifndef symbolTable_hpp
#define symbolTable_hpp

#include <stdio.h>
#include <map>
#include "item.hpp"

using namespace std;

class symbolTable {
private:
    map<string, item*> mTable;
    symbolTable* mSuperTable; // if null then is the gobal
public:
    symbolTable(symbolTable* superTable):mSuperTable(superTable){} // constructor
    void insert(string name, item* newItem) {mTable[name]=newItem;} // insert new item into the table
    item* lookup(string name) {return mTable[name];} // lookup for a new item
    void printTable(); // print the symbol table for debug
};

#endif /* symbolTable_hpp */
