//
//  LanguageManager.h
//  ios_language_manager
//
//  Created by Maxim Bilan on 12/23/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString * const LanguageCodes[] = { @"en",  @"ar" ,@"ml",@"hi"};
static NSString * const LanguageStrings[] = { @"English", @"Arabic",@"Malayalam",@"Hindi" };
static NSString * const LanguageSaveKey = @"currentLanguageKey";
typedef NS_ENUM(NSInteger, ELanguage)
{
    ELanguageEnglish,

	ELanguageArabic,
     ELanguageMalayalam,
         ELanguageHindi,
	
    ELanguageCount
};

@interface LanguageManager : NSObject

+ (void)setupCurrentLanguage;
+ (NSArray *)languageStrings;
+ (NSString *)currentLanguageString;
+ (NSString *)currentLanguageCode;
+ (NSInteger)currentLanguageIndex;
+ (void)saveLanguageByIndex:(NSInteger)index;
+ (BOOL)isCurrentLanguageRTL;

@end
