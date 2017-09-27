//
//  SearchModal.h
//  TestApp
//
//  Created by vinsi on 9/27/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<Mantle/Mantle.h>
@interface ItemModal : MTLModel<MTLJSONSerializing>

@property(nonatomic,copy) NSString *artworkUrl60;
@property(nonatomic,copy) NSString *artistName;
@property(nonatomic,copy) NSDate   *releaseDate;


@end
