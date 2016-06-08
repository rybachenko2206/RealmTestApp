//
//  PersonTableViewCell.h
//  RealmTestApp
//
//  Created by Roman Rybachenko on 6/6/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "Dog.h"

@interface PersonTableViewCell : UITableViewCell

+ (NSString *)cellIdentifier;
+ (CGFloat)cellHeight;

@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) Dog *dog;

@end
