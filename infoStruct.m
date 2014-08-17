//
//  infoStruct.m
//  dinner
//
//  Created by 张 凌翔 on 14-4-22.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "infoStruct.h"

@implementation infoStruct


//初始化
-(void)initWithInfo:(NSString*)title grade:(NSString*)_grade name:(NSString*)_name age:(NSString*)_age type:(NSString*)_type time:(NSString*)_time address:(NSString*)_addr condition:(NSString*)_cond call:(NSString*)_call comment:(NSString*)_comment yy:(NSString*)_yy
{
    _strTitle = title;
    _strGrade = _grade;
    _strName = _name;
    _strAge = _age;
    _strType = _type;
    _strTime = _time;
    _strAddress = _addr;
    _strPeople = _cond;
    _strCall = _call;
    _strComment = _comment;
    _stryy = _yy;
}
//复制结构体
-(void)copySt:(infoStruct*)stOld
{
    _strTitle = stOld.strTitle;
    _strGrade = stOld.strGrade;
    _strName = stOld.strName;
    _strAge = stOld.strAge;
    _strType = stOld.strType;
    _strTime = stOld.strTime;
    _strAddress = stOld.strAddress;
    _strPeople = stOld.strPeople;
    _strCall = stOld.strCall;
    _strComment = stOld.strComment;
    _stryy = stOld.stryy;
}
//初始化数据
-(void)initWithInfo:(NSString*)strTitle type:(NSString*)strType time:(NSString*)strTime add:(NSString*)strAdd people:(NSString*)strPeople
{
    _strTitle = strTitle;
    _strType = strType;
    _strTime = strTime;
    _strAddress = strAdd;
    _strPeople = strPeople;
}


@end
