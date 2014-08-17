//
//  detailOfRes.h
//  dinner
//
//  Created by Apple on 14-7-15.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct st{
    __unsafe_unretained NSString* strName;
    __unsafe_unretained NSString* strTel;
    __unsafe_unretained NSString* strAddress;
}detailsInfos;

@interface detailOfRes : NSObject

@end
