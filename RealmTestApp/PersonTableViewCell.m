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

#pragma mark - Static methods

+ (NSString *)cellIdentifier {
    return [[PersonTableViewCell class] description];
}

+ (CGFloat)cellHeight {
    return 67;
}

@end
