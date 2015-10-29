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
    string mFunType;
    int mNumOfPara;
public:
    func(int numOfPara):item("function"),mNumOfPara(numOfPara) {} //constructor
    func(string funtype, int numofpara):item("function"),mFunType(funtype),mNumOfPara(numofpara) {} //constructor
    void setType(string funType) {mFunType = funType;} // set the type of the function
    string printItem(); // override
};

#endif /* function_hpp */
