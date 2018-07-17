//
//  AppDelegate.m
//  MajicData
//
//  Created by Tesla_Chen on 2017/11/22.
//  Copyright © 2017年 zhejiangzhiyang. All rights reserved.
//

#import "AppDelegate.h"

#import "MDHomeViewController.h"
#import "MDActivityViewController.h"
#import "MDMyViewController.h"

#import "MDBaseViewController.h"
#import "MDBaseTabBarViewController.h"
#import "MDBaseNavigationViewController.h"

#import "MDLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark -- application
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // set RootVC
    [self setRootViewController];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}



#pragma mark -- Private Method


- (void) setRootViewController {
    
    MDHomeViewController *mdHomeVC = [[MDHomeViewController alloc] init];
    mdHomeVC.tabBarItem = [self setTabBarItemWith:@"首页" image:@"HomeUnSelect" selectImage:@"HomeSelect"];
    MDBaseNavigationViewController *homeNaviVC = [[MDBaseNavigationViewController alloc] initWithRootViewController:mdHomeVC];
    
    
    MDActivityViewController *mdActivityVC = [[MDActivityViewController alloc] init];
    mdActivityVC.tabBarItem = [self setTabBarItemWith:@"活动" image:@"ActivityUnSelect" selectImage:@"ActivitySelect"];
    MDBaseNavigationViewController *activityNaviVC = [[MDBaseNavigationViewController alloc] initWithRootViewController:mdActivityVC];

    MDMyViewController *mdMyVC = [[MDMyViewController alloc] init];
    mdMyVC.tabBarItem = [self setTabBarItemWith:@"我的" image:@"MyUnSelect" selectImage:@"MySelect"];
    MDBaseNavigationViewController *myNaviVC = [[MDBaseNavigationViewController alloc] initWithRootViewController:mdMyVC];

    
    MDBaseTabBarViewController *baseTabbarVC = [[MDBaseTabBarViewController alloc] init];
    [baseTabbarVC setViewControllers:@[homeNaviVC,activityNaviVC,myNaviVC]];
    [baseTabbarVC.tabBar setTintColor:KColor_Main];
    [baseTabbarVC.tabBar setBackgroundColor:KColor_White];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = KColor_White;
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = baseTabbarVC;
    
}


- (UITabBarItem *) setTabBarItemWith:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage {
    
    UITabBarItem *tabbarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:image] selectedImage:[UIImage imageNamed:selectImage]];
    
    [tabbarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16*kMainScaleMiunes]} forState:(UIControlStateNormal | UIControlStateSelected)];
    
    return tabbarItem;
}


@end
