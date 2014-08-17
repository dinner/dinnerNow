//
//  createAInvite.h
//  dinner
//
//  Created by Apple on 14-6-26.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dateActionSheet.h"
#import "restaurantViewController.h"
#import "infoStruct.h"

@protocol createNewInTableDelegate <NSObject>
-(void)createNew:(infoStruct*)st;
@end


@interface createAInvite : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,dateDelegate,delegateAddress>

@property(retain,nonatomic) UITableView* m_pTable;
@property (retain,nonatomic) UIButton* m_btCreate;
@property (weak,nonatomic) id<createNewInTableDelegate> delegate;
//@property(retain,nonatomic) UILabel* pGirl;
//@property(retain,nonatomic) UILabel* pBoy;
//@property(retain,nonatomic) UILabel* pEither;

@end
