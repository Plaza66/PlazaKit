//
//  PKBaseDataModel.h
//  PlazaKit
//
//  Created by liyan on 10/22/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKBaseModel.h"
@protocol PKBaseDataModel <NSObject>

@end

@interface PKBaseDataModel : PKBaseModel < NSCoding , PKBaseDataModel >

- (id)initWithDict:(NSDictionary *)dict;

@end
