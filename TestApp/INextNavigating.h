//
//  INextNavigating.h
//  TestApp
//
//  Created by vinsi on 9/30/17.
//  Copyright © 2017 vinsi. All rights reserved.
//
#import <Foundation/Foundation.h>
@protocol INextNavigating<NSObject>
-(void)ShowNextWithNavigationController:(UINavigationController*)nvc withData:(id )data;

@end
