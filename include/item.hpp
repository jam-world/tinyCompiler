//
//  item.hpp
//  symbolTable
//
//  Created by chencha on 10/28/15.
//  Copyright © 2015 jam-world. All rights reserved.
//

#ifndef item_hpp
#define item_hpp

#include <stdio.h>
#include <string>
using namespace std;

class item {
private:
    string mItemType;
    bool mIsExtern;
public:
    item(string itemType):mItemType(itemType),mIsExtern(false) {} // constructor
    virtual string printItem(); // print the item
    void setExtern() {mIsExtern=true;} // set the extern attribute
};

#endif /* item_hpp */
