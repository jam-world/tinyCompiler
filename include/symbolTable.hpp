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
    item* lookup(string name); // lookup for a new item
    bool isVariableIn(string name) {return mTable.find(name)!=mTable.end()?true:false;} // test is the variable alreay in the table
    item* getVariable(string name) {return mTable[name];} // you need to make sure that you know the variable is in the table
    symbolTable* upToSuperTable() {return mSuperTable;} // return the superTable
    void printTable(); // print the symbol table for debug
};

#endif /* symbolTable_hpp */
