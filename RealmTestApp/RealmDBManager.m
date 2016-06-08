//
//  RealmDBManager.m
//  RealmTestApp
//
//  Created by Roman Rybachenko on 6/8/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//



#import "RealmDBManager.h"


@interface RealmDBManager ()
@property (nonatomic, strong, readwrite) RLMRealm *realmDB;
@end


@implementation RealmDBManager

+ (RealmDBManager *)sharedInstance {
    static RealmDBManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [RealmDBManager new];
        sharedManager.realmDB = [RLMRealm defaultRealm];
    });
    
    return sharedManager;
}


#pragma mark - Interface methods

- (BOOL)deleteDatabase {
    BOOL success = NO;
    
    NSFileManager *manager = [NSFileManager defaultManager];
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    NSArray<NSURL *> *realmFileURLs = @[
                                        config.fileURL,
                                        [config.fileURL URLByAppendingPathExtension:@"lock"],
                                        [config.fileURL URLByAppendingPathExtension:@"log_a"],
                                        [config.fileURL URLByAppendingPathExtension:@"log_b"],
                                        [config.fileURL URLByAppendingPathExtension:@"note"]
                                        ];
   
    NSString *documentsDirectoryStr = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    documentsDirectoryStr = [documentsDirectoryStr stringByAppendingPathComponent:@"default.realm.management/"];
    NSURL *realmFolderUrl = [NSURL URLWithString:documentsDirectoryStr];
    NSError *error = nil;
    if ([manager fileExistsAtPath:realmFolderUrl.absoluteString]) {
        BOOL wasDeleted = [manager removeItemAtURL:realmFolderUrl error:&error];
        NSLog(@"wasDeleted = %d", wasDeleted);
    }
    
    
    for (NSURL *URL in realmFileURLs) {
        NSError *error = nil;
        [manager removeItemAtURL:URL error:&error];
        if (error) {
            // handle error
        }
        success = !error;
    }

    
    return success;
}

@end
