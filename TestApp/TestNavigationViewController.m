//
//  TestNavigationViewController.m
//  TestApp
//
//  Created by vinsi on 9/30/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "TestNavigationViewController.h"

@interface TestNavigationViewController ()
@property(nonatomic,copy) void(^callback)();
@end

@implementation TestNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    if(self.callback)
        self.callback();
}
-(void)afterNavigationDidLoadOnComplete:(void (^)())callback{

    self.callback =callback;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
