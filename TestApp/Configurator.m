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
#import "LoginViewController.h"
#import "TestNavigationViewController.h"
@implementation Configurator

+(UIViewController*)getRootViewController{

    ListViewController *list = [[ListViewController alloc]initWithNibName:@"ListViewController" bundle:nil];
    
    LoginViewController *login  = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    
    
    TestNavigationViewController *nvc = [[TestNavigationViewController alloc] initWithRootViewController:list];
    id<INavigating> nvcObj  = nvc;
    [nvcObj afterNavigationDidLoadOnComplete:^{
         [nvc presentViewController:login animated:YES completion:nil];
    }];
   
    return nvc;
    
}

@end
