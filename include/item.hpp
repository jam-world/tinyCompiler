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
    string itemType;
public:
    item(string name) {itemType=name;} // constructor
    virtual string printItem(); // print the item
};

#endif /* item_hpp */
