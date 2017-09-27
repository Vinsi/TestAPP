
//
//  Created by Vinsi on 21.08.15
#import "AppDelegate.h"
#import "ServicesDispatcher.h"

@interface ServicesDispatcher()
@property (nonatomic, strong) NSArray<id<UIApplicationDelegate>> *services;
@end

@implementation ServicesDispatcher

- (instancetype)initWithServices:(NSArray<id<UIApplicationDelegate>> *)services {
    if ((self = [super init])) {
        self.services = services;
    }
    return self;
}

- (void)performSelector:(SEL)selector sender:(id)sender withArguments:(NSArray *)arguments {
    for(id<UIApplicationDelegate> service in self.services) {
        if([service respondsToSelector:selector]) {
            NSInvocation *invocation = [self invocationWithTarget:service selector:selector sender:sender arguments:arguments];
            if (invocation) {
                [invocation invoke];
            }
        }
    }
}

- (BOOL)performBOOLSelector:(SEL)selector sender:(id)sender withArguments:(NSArray *)arguments {
    BOOL returnValue = YES;
    for(id<UIApplicationDelegate> service in self.services) {
        if([service respondsToSelector:selector]) {
            BOOL selectorReturnValue;
            NSInvocation *invocation = [self invocationWithTarget:service selector:selector sender:sender arguments:arguments];
            if (invocation) {
                [invocation invoke];
                [invocation getReturnValue:&selectorReturnValue];
                returnValue = returnValue && selectorReturnValue;
            }
        }
    }
    return returnValue;
}

- (NSInvocation *)invocationWithTarget:(id)target selector:(SEL)selector sender:(id)sender arguments:(NSArray *)arguments
{
    NSInvocation * myInvocation = [NSInvocation invocationWithMethodSignature:[sender methodSignatureForSelector:selector]];
    myInvocation.target = target;
    myInvocation.selector = selector;
    
    // first two arguments of the method are always the target and the selector
    if (arguments.count == myInvocation.methodSignature.numberOfArguments-2) {
        for(int i = 0; i < arguments.count; i++) {
            id argument = [arguments objectAtIndex:i];
            NSUInteger argumentIndex = i+2;
            [myInvocation setArgument:&argument atIndex:argumentIndex];
        }
    }
    else {
       // SBLogVerbose(@"Missing arguments in method invocation: %@", NSStringFromSelector(selector));
        return nil;
    }
    return myInvocation;
}

@end
