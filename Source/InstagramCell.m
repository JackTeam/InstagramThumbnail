//
//  InstagramCell.m
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 HUAJIE. All rights reserved.
//

#import "InstagramCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation InstagramCell

- (void)setEntity:(InstagramMediaModel *)entity andIndexPath:(NSIndexPath *)index {
    [self setupCell];
    _entity = entity;
    
    __weak typeof(self) weakSelf = self;
    if (_entity.photo) {
        [self.thumbnailButton setBackgroundImage:_entity.photo forState:UIControlStateNormal];
    } else {
        [_entity downloadImageWithBlock:^(UIImage *image, NSError *error) {
            if (weakSelf.indexPath.row == index.row) {
                _entity.photo = image;
                [weakSelf.thumbnailButton setBackgroundImage:image forState:UIControlStateNormal];
            }
        }];
    }
    
    self.thumbnailButton.userInteractionEnabled = self.showThumbnail;
    self.thumbnailButton.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2);
    
    if (!self.showThumbnail) {
        self.userNameLabel.text = self.entity.userName;
        [self.contentView addSubview:self.userNameLabel];
        
        self.pictureCaptionLabel.text = self.entity.caption;
        [self.contentView addSubview:self.pictureCaptionLabel];
        
        [self.userProfileImageView setImage:[UIImage imageNamed:@"placeholder"]];
        [self.contentView addSubview:self.userProfileImageView];
        
        [_entity downloadImageWithBlock:^(UIImage *image, NSError *error) {
            if (image && !error && weakSelf.indexPath.row == index.row) {
                [weakSelf.userProfileImageView setImage:image];
            }
        }];
    }
}

#pragma mark - Action

- (void)selectedThumbnailImage:(UIButton *)sender {
    
}

- (void)setupCell {
    if (!_thumbnailButton) {
        _thumbnailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    [_thumbnailButton setFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.width)];
    [_thumbnailButton addTarget:self action:@selector(selectedThumbnailImage:) forControlEvents:UIControlEventTouchUpInside];
    [_thumbnailButton setBackgroundImage:[UIImage imageNamed:@"placeholder"] forState:UIControlStateNormal];
    self.thumbnailButton.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_thumbnailButton];
    
    if (!self.showThumbnail) {
        if (!_userNameLabel) {
            _userNameLabel = [[UILabel alloc] init];
        }
        _userNameLabel.frame = CGRectMake(40, 0, CGRectGetWidth(self.frame) - 45, 35);
        _userNameLabel.textColor = [UIColor blackColor];
        _userNameLabel.font = [_userNameLabel.font fontWithSize:12];
        
        if (!_pictureCaptionLabel) {
            _pictureCaptionLabel = [[UILabel alloc] init];
        }
        
        _pictureCaptionLabel.frame = CGRectMake(5, CGRectGetHeight(self.frame) - 40, CGRectGetWidth(self.frame) - 10, 30);
        _pictureCaptionLabel.numberOfLines = 0;
        _pictureCaptionLabel.textColor = [UIColor blackColor];
        _pictureCaptionLabel.font = [_pictureCaptionLabel.font fontWithSize:12];
        
        if (!_userProfileImageView) {
            _userProfileImageView = [[UIImageView alloc] init];
        }
        _userProfileImageView.frame = CGRectMake(0, 0, 35, 35);
        _userProfileImageView.contentMode = UIViewContentModeScaleAspectFit;
        _userProfileImageView.layer.masksToBounds = YES;
        _userProfileImageView.layer.cornerRadius = 17.5;
    }
}

#pragma mark - life cycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
