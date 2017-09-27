//
//  SearchModal.m
//  TestApp
//
//  Created by vinsi on 9/27/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "ItemModal.h"

@implementation ItemModal
+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    return dateFormatter;
}
+(NSDictionary *)JSONKeyPathsByPropertyKey{

    return  @{
              @"artworkUrl60":   @"artworkUrl60",
              @"artistName"  :   @"artistName" ,
              @"releaseDate" :   @"releaseDate"
              
              };


}
#pragma mark - JSON Transformers

+ (NSValueTransformer *)releaseDateJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success,
                                                                 NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}


@end
