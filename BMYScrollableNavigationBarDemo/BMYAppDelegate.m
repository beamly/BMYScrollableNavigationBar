//
//  BMYAppDelegate.m
//  BMYScrollableNavigationBarDemo
//
//  Created by Alberto De Bortoli on 08/07/14.
//  Copyright (c) 2014 Beamly. All rights reserved.
//

#import "BMYAppDelegate.h"

#import "BMYScrollableNavigationBar.h"
#import "BMYViewController.h"

@implementation BMYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    UINavigationController *navigationController =
        [[UINavigationController alloc] initWithNavigationBarClass:[BMYScrollableNavigationBar class] toolbarClass:nil];

    BMYViewController *tableViewController =
        [[BMYViewController alloc] init];

    [navigationController setViewControllers:@[tableViewController] animated:NO];

    self.window.rootViewController = navigationController;

    [self.window makeKeyAndVisible];
    return YES;
}

@end
