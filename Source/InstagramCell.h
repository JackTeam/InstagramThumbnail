//
//  InstagramCell.h
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 HUAJIE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstagramMediaModel.h"

@interface InstagramCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UIImageView *userProfileImageView;
@property (nonatomic, strong) UILabel *pictureCaptionLabel;
@property (nonatomic, strong) UIButton *thumbnailButton;
@property (nonatomic, assign) InstagramMediaModel *entity;
@property (nonatomic, assign) NSIndexPath *indexPath;
@property (nonatomic, assign) BOOL showThumbnail;

- (void)setEntity:(InstagramMediaModel *)entity andIndexPath:(NSIndexPath *)index;

@end
