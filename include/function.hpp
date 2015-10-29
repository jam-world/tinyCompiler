//
//  function.hpp
//  symbolTable
//
//  Created by chencha on 10/28/15.
//  Copyright © 2015 jam-world. All rights reserved.
//

#ifndef function_hpp
#define function_hpp

#include <stdio.h>
#include "item.hpp"

class func: public item {
private:
    string funType;
    int numOfPara;
public:
    func(string funtype, int numofpara):item("function"),funType(funtype),numOfPara(numofpara) {} //constructor
    string printItem(); // override
};

#endif /* function_hpp */
