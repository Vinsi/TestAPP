//
//  SearchResponseModal.m
//  TestApp
//
//  Created by vinsi on 9/27/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "ItemsResponseModal.h"
#import "ItemModal.h"
@implementation ItemsResponseModal
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
              @"results":@"results",
              @"resultcount":@"resultcount"
             
             
             };

    
}
#pragma mark - JSON Transformer

+ (NSValueTransformer *)resultsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:ItemModal.class];
}
@end
