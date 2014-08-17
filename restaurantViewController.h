//
//  restaurantViewController.h
//  dinner
//
//  Created by Apple on 14-7-10.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "restaurantCell.h"

@protocol delegateAddress <NSObject>
-(void)setTheAddress:(NSString*)strHotel;//设置地点

@end

@interface restaurantViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDelegate,chooseThisDelegate>

@property(retain,nonatomic) id<delegateAddress> oDelegate;
@end
