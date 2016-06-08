//
//  Person.m
//  RealmTestApp
//
//  Created by Roman Rybachenko on 6/6/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//

#import "Person.h"

@implementation Person

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}


+ (NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties {
    NSDictionary *linkingProperties = @{@"dogs" :[RLMPropertyDescriptor descriptorWithClass:Dog.class propertyName:@"owner"]};
    
    return linkingProperties;
}

@end
