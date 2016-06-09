//
//  PersonTableViewCell.m
//  RealmTestApp
//
//  Created by Roman Rybachenko on 6/6/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//



#import "PersonTableViewCell.h"


@interface PersonTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *additionalInfoLabel;

@end


@implementation PersonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


#pragma mark - Setters

- (void)setPerson:(Person *)person {
    _person = person;
    
    self.nameLabel.text = _person.name;
    self.ageLabel.text = [NSString stringWithFormat:@"%ld", (long)_person.age];
    NSString *dogsStr = _person.dogs.count > 1 ? @"dogs" : @"dog";
    self.additionalInfoLabel.text = [NSString stringWithFormat:@"%ld %@", _person.dogs.count, dogsStr];
    // TODO: set image and birthday if they are exist
}

- (void)setDog:(Dog *)dog {
    _dog = dog;
    self.nameLabel.text = _dog.name;
    self.ageLabel.text = [NSString stringWithFormat:@"%ld", (long)_dog.age];
}


#pragma mark - Static methods

+ (NSString *)cellIdentifier {
    return [[PersonTableViewCell class] description];
}

+ (CGFloat)cellHeight {
    return 67;
}

@end
