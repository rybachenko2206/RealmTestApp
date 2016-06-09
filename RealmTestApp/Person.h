//
//  Person.h
//  RealmTestApp
//
//  Created by Roman Rybachenko on 6/6/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"

@interface Person : RLMObject

@property NSString *firstName;
@property NSString *lastName;
@property (readonly) NSString *name;
@property NSInteger age;
@property NSData *picture;
@property NSDate *birthday;

@property (readonly) RLMLinkingObjects *dogs;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Person>
RLM_ARRAY_TYPE(Person)
