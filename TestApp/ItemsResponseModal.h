//
//  SearchResponseModal.h
//  TestApp
//
//  Created by vinsi on 9/27/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<Mantle/Mantle.h>
@interface ItemsResponseModal : MTLModel<MTLJSONSerializing>

@property(nonatomic,copy) NSArray *results;
@property(nonatomic,assign) NSInteger resultcount;
@end
