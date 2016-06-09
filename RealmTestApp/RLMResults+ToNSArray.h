//
//  RLMResults+ToNSArray.h
//  RealmTestApp
//
//  Created by Roman Rybachenko on 6/8/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//

#import <Realm/Realm.h>

@interface RLMResults (ToNSArray)

- (NSArray *)toArray;

@end
