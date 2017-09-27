//
//  APIClient.h
//
//
//  Created by UAE on 8/21/17.
//  Copyright © 2017 UAE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemsResponseModal.h"
@interface APIClient : NSObject



+(instancetype)SharedClient;

-(void)SearchAPPsinItunesWithName:(NSString*)name
       onComplete:(void(^)(bool Success ,ItemsResponseModal *response))callback;
@end
