//
//  scope.hpp
//  symbolTable
//
//  Created by chencha on 10/28/15.
//  Copyright © 2015 jam-world. All rights reserved.
//

#ifndef scope_hpp
#define scope_hpp

#include <stdio.h>
#include "item.hpp"
#include "symbolTable.hpp"

class scope: public item {
private:
    symbolTable *mTable;
    string mScopeName;
public:
    scope(string scopeName, symbolTable* table):item("scope",false),mTable(table),mScopeName(scopeName) {} // constructor
    string printItem(); // vertual
};

#endif /* scope_hpp */
