//
//  RealmDBManager.h
//  RealmTestApp
//
//  Created by Roman Rybachenko on 6/8/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//


#import <Realm/Realm.h>

#import <Foundation/Foundation.h>

@interface RealmDBManager : NSObject

@property (nonatomic, strong, readonly) RLMRealm *realmDB;

+ (RealmDBManager *)sharedInstance;

- (BOOL)deleteDatabase;

@end
