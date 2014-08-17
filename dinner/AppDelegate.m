//
//  AppDelegate.m
//  dinner
//
//  Created by 张 凌翔 on 14-4-22.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "AppDelegate.h"
#import "mainTableController.h"
//#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //地图初始化
    [self mapInit];
    //
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[mainTableController alloc] init];
    //导航栏
    self.m_pNav = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.window.rootViewController = self.m_pNav;
    [self.window makeKeyAndVisible];
    return YES;
}

//地图初始化
-(void)mapInit{
    m_mapManager = [[BMKMapManager alloc] init];
    BOOL ret = [m_mapManager start:@"Cr53FgoEGGYX7scY92H7aAaU" generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
