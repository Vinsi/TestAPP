//
//  AppDelegate.m
//  eFatoora
//
//  Created by UAE on 8/21/17.
//  Copyright © 2017 UAE. All rights reserved.
//

#import "AppDelegate.h"
#import "Configurator.h"

#import "ServicesDispatcher.h"
#import "IQKeyboardService.h"
#import "RootControllerService.h"
#import "FaceBookService.h"
@interface AppDelegate ()
@property(nonatomic,strong) ServicesDispatcher *serviceDispatcher;
@end
@implementation AppDelegate


- (ServicesDispatcher *)serviceDispatcher {
    if (!_serviceDispatcher) {
        _serviceDispatcher = [[ServicesDispatcher alloc] initWithServices:@[
                                                                   [IQKeyboardService new],
                                                                   [RootControllerService new],
                                                                    [FaceBookService new]
                                                                            ]];
                                                                              
    }
    return _serviceDispatcher;
    
}


#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return [self.serviceDispatcher performBOOLSelector:@selector(application:didFinishLaunchingWithOptions:) sender:self withArguments:@[application, launchOptions ?: @{}]];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self.serviceDispatcher performSelector:@selector(applicationWillResignActive:) sender:self withArguments:@[application]];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.serviceDispatcher performSelector:@selector(applicationDidEnterBackground:) sender:self withArguments:@[application]];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self.serviceDispatcher performSelector:@selector(applicationWillEnterForeground:) sender:self withArguments:@[application]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self.serviceDispatcher performSelector:@selector(applicationDidBecomeActive:) sender:self withArguments:@[application]];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.serviceDispatcher performSelector:@selector(applicationWillTerminate:) sender:self withArguments:@[application]];
}

- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<NSString *,id> *)options {
    return [self.serviceDispatcher performBOOLSelector:@selector(application:openURL:options:) sender:self withArguments:@[application, url, options]];
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler {
    return [self.serviceDispatcher performBOOLSelector:@selector(application:continueUserActivity:restorationHandler:) sender:self withArguments:@[application, userActivity, restorationHandler]];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [self.serviceDispatcher performBOOLSelector:@selector(application:openURL:sourceApplication:annotation:) sender:self withArguments:@[application, url, sourceApplication ?: @"", annotation ?: [NSNull null]]];
}



@end
