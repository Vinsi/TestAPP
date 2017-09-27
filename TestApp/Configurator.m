//
//  Configurator.m
//  eFatoora
//
//  Created by UAE on 8/21/17.
//  Copyright © 2017 UAE. All rights reserved.
//

#import "Configurator.h"
#import <UIKit/UIKit.h>
#import "Activity.h"
#import "AppDelegate.h"
#import "ListViewController.h"

@implementation Configurator

+(UIViewController*)getRootViewController{

    ListViewController *list = [[ListViewController alloc]initWithNibName:@"ListViewController" bundle:nil];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:list];
    return nvc;
    
}

@end
