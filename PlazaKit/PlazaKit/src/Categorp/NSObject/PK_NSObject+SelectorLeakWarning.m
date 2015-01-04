//
//  NSObject+SelectorLeakWarning.m
//  PlazaKit
//
//  Created by liyan on 10/22/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

#import "PK_NSObject+SelectorLeakWarning.h"

@implementation NSObject (PK_SelectorLeakWarning)

- (id)pk_performSelector:(SEL)aSelector
{
    return [self pk_performSelector:aSelector withObject:nil];
}

- (id)pk_performSelector:(SEL)aSelector withObject:(id)object
{
    return [self pk_performSelector:aSelector withObject:object withObject:nil];
}

- (id)pk_performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2
{
    _Pragma("clang diagnostic push")
    _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")
    id sender =  [self performSelector:aSelector withObject:object1 withObject:object2];
    _Pragma("clang diagnostic pop")
    return sender;
}

@end
