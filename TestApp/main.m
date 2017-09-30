//
//  main.m
//  TestApp
//
//  Created by vinsi on 9/25/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "LanguageManager.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
           [LanguageManager setupCurrentLanguage];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
