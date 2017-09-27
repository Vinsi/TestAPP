//
//  Activity.m
//  eFatoora
//
//  Created by UAE on 8/21/17.
//  Copyright © 2017 UAE. All rights reserved.
//
#import <CCActivityHUD/CCActivityHUD.h>
#import "Activity.h"
@interface Activity()

@property(nonatomic,strong) CCActivityHUD *hud;


@end
@implementation Activity

-(CCActivityHUD *)hud{

    if(_hud)return _hud;
     _hud = [CCActivityHUD new ];
    _hud.overlayType =CCActivityHUDOverlayTypeBlur;

    return  _hud;
}

-(void)Show{
    [self.hud show];
    
    
}

-(void)Hide{

    [self.hud dismiss];
}

@end
