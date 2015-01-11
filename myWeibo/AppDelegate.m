//
//  AppDelegate.m
//  myWeibo
//
//  Created by HeZitong on 14/11/6.
//  Copyright (c) 2014年 HeZitong. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    HomeTableViewController *homeTableViewCtrl = [[HomeTableViewController alloc] initWithStyle:UITableViewStylePlain];
    MessageTableViewController *messageTableViewCtrl = [[MessageTableViewController alloc] initWithStyle:UITableViewStylePlain];
    AddTableViewController *addTableViewCtrl = [[AddTableViewController alloc] initWithStyle:UITableViewStylePlain];
    FindTableViewController *findTableViewCtrl = [[FindTableViewController alloc] initWithStyle:UITableViewStylePlain];
    MeTableViewController *meTableViewCtrl = [[MeTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController *homeNavCtrl = [[UINavigationController alloc] initWithRootViewController:homeTableViewCtrl];
    UINavigationController *messageNavCtrl = [[UINavigationController alloc] initWithRootViewController:messageTableViewCtrl];
    UINavigationController *addNavCtrl = [[UINavigationController alloc] initWithRootViewController:addTableViewCtrl];
    UINavigationController *findNavCtrl = [[UINavigationController alloc] initWithRootViewController:findTableViewCtrl];
    UINavigationController *meNavCtrl = [[UINavigationController alloc] initWithRootViewController:meTableViewCtrl];
    
    MainTabBarController *mainTabBarCtrl = [[MainTabBarController alloc] init];
    
    //只有一个homeNavCtrl
    mainTabBarCtrl.viewControllers = [NSArray arrayWithObjects:homeNavCtrl,messageNavCtrl,addNavCtrl,findNavCtrl,meNavCtrl,nil];
    
    CGSize tabBarImageSize = CGSizeMake(23, 23);
    UIImage *homeImage = [[UIImage imageNamed:@"home.png"] scaleToSize:tabBarImageSize];
    UIImage *messageImage = [[UIImage imageNamed:@"message.png"] scaleToSize:tabBarImageSize];
    UIImage *addImage = [[UIImage imageNamed:@"add.png"] scaleToSize:CGSizeMake(60, 30)];
    addImage = [addImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *findImage = [[UIImage imageNamed:@"find.png"] scaleToSize:tabBarImageSize];
    UIImage *meImage = [[UIImage imageNamed:@"me.png"] scaleToSize:tabBarImageSize];
    
    UIColor *orangeC = [UIColor colorWithRed:253.0/255 green:109.0/255 blue:10.0/255 alpha:1];
    [[mainTabBarCtrl tabBar] setTintColor:orangeC];
    
    UITabBarItem *homeTabBarButton = [[UITabBarItem alloc] initWithTitle:@"首页" image:homeImage tag:0];
    UITabBarItem *messageTabBarButton = [[UITabBarItem alloc] initWithTitle:@"消息" image:messageImage tag:0];
    UITabBarItem *addTabBarButton = [[UITabBarItem alloc] initWithTitle:@" " image:addImage tag:0];
    UITabBarItem *findTabBarButton = [[UITabBarItem alloc] initWithTitle:@"发现" image:findImage tag:0];
    UITabBarItem *meTabBarButton = [[UITabBarItem alloc] initWithTitle:@"我" image:meImage tag:0];
    
    homeNavCtrl.tabBarItem = homeTabBarButton;
    messageNavCtrl.tabBarItem = messageTabBarButton;
    addNavCtrl.tabBarItem = addTabBarButton;
    findNavCtrl.tabBarItem = findTabBarButton;
    meNavCtrl.tabBarItem = meTabBarButton;
    
    self.window.rootViewController = mainTabBarCtrl;
    
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)applicationDidFinishLaunching:(UIApplication *)application{
    //self.mainTabBarCtrl = [[UITabBarController alloc] init];
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
