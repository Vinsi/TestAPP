//
//  APIClient.m
//
//
//  Created by UAE on 8/21/17.
//  Copyright © 2017 UAE. All rights reserved.
//

#import "APIClient.h"
#import <AFNetworking/AFNetworking.h>
#import "ItemsResponseModal.h"

@implementation APIClient

+(instancetype)SharedClient{

    static APIClient *shared =nil ;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[APIClient alloc]init];
    });
    
    return shared;



}


-(void)SearchAPPsinItunesWithName:(NSString*)name
                       onComplete:(void(^)(bool Success,    ItemsResponseModal *response))callback{

     NSString *url = @"https://itunes.apple.com/search?term=trolley&country=ae&entity=software";
    
    
    NSString *URLString = url;    // Enter your url

    NSError *error;      // Initialize NSError
    

    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]]; //Intialialize AFURLSessionManager
    
    NSMutableURLRequest *req = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:nil error:nil];  // make NSMutableURL req
    


    
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        

        NSDictionary *responseDictionary = (NSDictionary *)responseObject;
        
        NSError *modalerror;
        ItemsResponseModal *list = [MTLJSONAdapter modelOfClass:ItemsResponseModal.class
                                                   fromJSONDictionary:responseDictionary error:&modalerror];
        callback(YES,list);
    }
      
      
      
      ]resume];

    






}


-(void)PostJsonWithUrl:(NSString*)url withData:(NSDictionary*)dctPost withOnComplete:(void (^)(NSURLResponse *response,
                                                                id responseObject,
                                                                NSError *error)
                                                       )callback{


    NSString *URLString = url;    // Enter your url
    NSDictionary *parameters =dctPost;  // Add your parameters
    NSError *error;      // Initialize NSError
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];  // Convert your parameter to NSDATA
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];  // Convert data into string using NSUTF8StringEncoding
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]]; //Intialialize AFURLSessionManager
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:nil error:nil];  // make NSMutableURL req
    
   // req.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue]; // add paramerets to NSMutableURLRequest
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
 
    [req setHTTPBody:jsonData];
    
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        
        callback(response,responseObject,error);
    }
        
     
        
    ]resume];
    
    
}
@end
