//
//  KeyboardService.m
//  Test
//
//  Created by vinsi on 9/23/17.
//  Copyright © 2017 UAE. All rights reserved.
//

#import "IQKeyboardService.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
@implementation IQKeyboardService
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

 [IQKeyboardManager sharedManager].enable =YES;
 return YES;

}

@end
