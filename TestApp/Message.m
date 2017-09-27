//
//  Message.m
//  eFatoora
//
//  Created by UAE on 8/21/17.
//  Copyright © 2017 UAE. All rights reserved.
//
#import <ARNAlert/ARNAlert.h>
#import "Message.h"
@interface Message()

@property(nonatomic,strong) ARNAlert *alert;
@end
@implementation Message

-(ARNAlert *)alert{

    if(_alert)return _alert;
    _alert = [[ARNAlert alloc]init];
    return  _alert;

}

-(void)ShowMessage:(NSString *)text{

    [ARNAlert showNoActionAlertWithTitle:@"" message:text buttonTitle:@"Ok"];

}

@end
