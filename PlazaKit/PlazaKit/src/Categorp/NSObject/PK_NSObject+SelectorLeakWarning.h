//
//  NSObject+SelectorLeakWarning.h
//  PlazaKit
//
//  Created by liyan on 10/22/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PK_SelectorLeakWarning)

- (id)pk_performSelector:(SEL)aSelector;
- (id)pk_performSelector:(SEL)aSelector withObject:(id)object;
- (id)pk_performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;



@end
