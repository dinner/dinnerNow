//
//  settingViewController.h
//  dinner
//
//  Created by Apple on 14-7-16.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface settingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(retain,nonatomic) UITableView* m_pTable;

@end
