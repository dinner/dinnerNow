//
//  AppDelegate.h
//  dinner
//
//  Created by 张 凌翔 on 14-4-22.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainTableController.h"
#import "BMKMapManager.h"

@class mainTableController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    BMKMapManager* m_mapManager;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) mainTableController *viewController;
@property (strong ,nonatomic) UINavigationController* m_pNav;

@end
