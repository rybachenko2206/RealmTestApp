//
//  RLMResults+ToNSArray.m
//  RealmTestApp
//
//  Created by Roman Rybachenko on 6/8/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//


#import "RLMResults+ToNSArray.h"

@implementation RLMResults (ToNSArray)

- (NSArray *)toArray {
    NSArray *array = [NSArray new];
    for (NSUInteger i = 0; i < self.count; i++) {
        RLMObject *object = [self objectAtIndex:i];
        array = [array arrayByAddingObject:object];
    }

    return array;
}

@end
