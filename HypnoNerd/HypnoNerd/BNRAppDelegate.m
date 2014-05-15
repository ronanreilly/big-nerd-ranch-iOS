//
//  BNRAppDelegate.m
//  HypnoNerd
//
//  Created by Ronan Sean Reilly on 10/05/2014.
//  Copyright (c) 2014 Ronan Sean Reilly. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRHypnosisViewController.h"
#import "BNRReminderViewController.h"

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // Set our VC as root VC
    BNRHypnosisViewController *hvc = [[BNRHypnosisViewController alloc] init];
    //self.window.rootViewController = hvc;
    
    // pointer to object that represents app bundle
    //NSBundle *appBundle = [NSBundle mainBundle];
    
    // Look in appBundle for our reminder view controller xib
    /*BNRReminderViewController *rvc = [[BNRReminderViewController alloc] initWithNibName:@"BNRReminderViewController" bundle:appBundle];*/
    //self.window.rootViewController = rvc;
    
    // Creating BNRReminderViewController without passing bundle or xib
    BNRReminderViewController *rvc = [[BNRReminderViewController alloc] init];
    
    // A tab view controller to switch between our two views.
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers= @[hvc, rvc];
    
    self.window.rootViewController = tabBarController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
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
