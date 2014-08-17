//
//  mainTableController.h
//  dinner
//
//  Created by Apple on 14-7-7.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "detailInfo.h"
#import "createAInvite.h"

@interface mainTableController : UITableViewController<createNewInTableDelegate,EGORefreshTableHeaderDelegate>

@property(retain,nonatomic)EGORefreshTableHeaderView* m_pView;
@end
