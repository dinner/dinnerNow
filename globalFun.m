//
//  globalFun.m
//  dinner
//
//  Created by Apple on 14-6-25.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "globalFun.h"

@implementation globalFun

+(NSString*)getCurrentTime
{
    NSString* strCurrentTime;
    NSDate* date = [NSDate date];
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    strCurrentTime = [dateFormat stringFromDate:date];
    return strCurrentTime;
}

@end
