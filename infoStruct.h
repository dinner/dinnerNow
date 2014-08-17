//
//  infoStruct.h
//  dinner
//
//  Created by 张 凌翔 on 14-4-22.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface infoStruct : NSObject

    @property (weak, nonatomic)NSString* strName;
    @property (weak, nonatomic)NSString* strAge;
    @property (weak, nonatomic)NSString* strAddress;
    @property (weak, nonatomic)NSString* strTime;
    @property (weak, nonatomic)NSString* strPeople;
   @property (weak, nonatomic) NSString* strCall;
@property(weak,nonatomic)NSString* strTitle;
@property(weak,nonatomic)NSString* strGrade;
@property(weak,nonatomic)NSString* strType;//付款方式
@property(weak,nonatomic)NSString* stryy;//报名
@property(weak,nonatomic)NSString* strComment;//评论
//初始化
-(void)initWithInfo:(NSString*)title grade:(NSString*)_grade name:(NSString*)_name age:(NSString*)_age type:(NSString*)_type time:(NSString*)_time address:(NSString*)_addr condition:(NSString*)_cond call:(NSString*)_call comment:(NSString*)_comment yy:(NSString*)_yy;

-(void)initWithInfo:(NSString*)strTitle type:(NSString*)strType time:(NSString*)strTime add:(NSString*)strAdd people:(NSString*)strPeople;

//复制结构体
-(void)copySt:(infoStruct*)stOld;
@end
