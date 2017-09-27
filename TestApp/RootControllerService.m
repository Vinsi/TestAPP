//
//  RootControllerService.m
//  TestApp
//
//  Created by vinsi on 9/25/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "RootControllerService.h"
#import "Configurator.h"

@implementation RootControllerService

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    [UIApplication sharedApplication].delegate.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [[UIApplication sharedApplication].delegate.window setRootViewController:[Configurator getRootViewController]];
    [[UIApplication sharedApplication].delegate.window makeKeyAndVisible];
    return YES;
}

@end
