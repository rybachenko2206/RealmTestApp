//
//  Dog.h
//  RealmTestApp
//
//  Created by Roman Rybachenko on 6/6/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//

#import <Realm/Realm.h>
@class Person;

@interface Dog : RLMObject

@property NSString *name;
@property NSInteger age;
@property NSData *picture;
@property Person *owner;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Dog>
RLM_ARRAY_TYPE(Dog)
