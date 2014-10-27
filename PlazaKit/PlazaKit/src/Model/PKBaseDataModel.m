//
//  PKBaseDataModel.m
//  PlazaKit
//
//  Created by liyan on 10/22/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//
#import "PKBaseDataModel.h"
#import "NSObject+SelectorLeakWarning.h"
#include <objc/runtime.h>

@interface PKBaseDataModel()

@end

@implementation PKBaseDataModel


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        
    }
    return self;
}


- (id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (nil!=self)
    {
        [self setupObjAttributeWithDict:dict];
    }
    return self;
}

- (NSDictionary *)attributeMapDictionary
{
    NSMutableDictionary *propertyDict   = [[NSMutableDictionary alloc] init];
    unsigned int outCount               = 0;
    objc_property_t *properties         = class_copyPropertyList(self.class, &outCount);
    for (int i = 0; i < outCount; i++)
    {
        objc_property_t property    = properties[i];
        NSString *propName          = [NSString stringWithUTF8String:property_getName(property)];
        const char *typeName        = property_getAttributes(property);
        NSString *properyTypeName   = [[NSString alloc] initWithCString:typeName encoding:NSUTF8StringEncoding];
        [propertyDict setObject:properyTypeName forKey:propName];
    }
    return propertyDict;
}

- (void)setupObjAttributeWithDict:(NSDictionary *)dict
{
    if (dict==nil || ![dict isKindOfClass:[NSDictionary class]])
    {
        return;
    }
    
    NSDictionary *attrMapDic = [self attributeMapDictionary];
    if (nil==attrMapDic || [attrMapDic count] == 0)
    {
        return;
    }
    
    NSDictionary *propertys = [self attributeMapDictionary];
    for (NSString *attributeName in [propertys allKeys])
    {
        SEL sel = [self getSetterAttributeName:attributeName];
        if ([self respondsToSelector:sel])
        {
            id value = [dict objectForKey:attributeName];
            if (value)
            {
                NSString* className = [self className:[propertys objectForKey:attributeName]];
                if ([value isKindOfClass:[NSDictionary class]])
                {
                    id subObject = [[NSClassFromString(className) alloc] initWithDict:value];
                    
                    [self pk_performSelector:sel withObject:subObject];
                    
                    continue;
                }
                if ([value isKindOfClass:[NSArray class]])
                {
                    if ([className isEqualToString:@"NSString"] || [className isEqualToString:@"NSNumber"])
                    {
                        [self pk_performSelector:sel withObject:value];
                        continue;
                    }
                    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
                    for (id dateItem in value)
                    {
                        id subObject = [[NSClassFromString(className) alloc] initWithDict:dateItem];
                        [dataArray addObject:subObject];
                    }
                    
                    [self pk_performSelector:sel withObject:dataArray];
                    continue;
                }
                
                [self pk_performSelector:sel withObject:value];
            }
        }
    }
}

- (NSString*)className:(NSString *)propertyTypeName
{
    NSLog(@"%@", propertyTypeName);
    NSString* name = [[propertyTypeName componentsSeparatedByString:@","] objectAtIndex:0];
    NSString* cName = [[name substringToIndex:[name length]-1] substringFromIndex:3];
    if ([cName rangeOfString:@"<"].location != NSNotFound) {
        NSString* subName = [cName substringFromIndex:[cName rangeOfString:@"<"].location+1];
        return [subName substringToIndex:[subName length]-1];
    }
    return cName;
}

- (SEL)getSetterAttributeName:(NSString *)attributeName
{
    NSString *capital = [[attributeName substringToIndex:1] uppercaseString];
    
    NSString *setterSelStr = [NSString stringWithFormat:@"set%@%@:",capital,[attributeName substringFromIndex:1]];
    
    return NSSelectorFromString(setterSelStr);
    
}
@end
