//
//  TestNavigationViewController.h
//  TestApp
//
//  Created by vinsi on 9/30/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol INavigating <NSObject>
-(void)afterNavigationDidLoadOnComplete:(void(^)())callback;


@end
@interface TestNavigationViewController : UINavigationController <INavigating>

@end
