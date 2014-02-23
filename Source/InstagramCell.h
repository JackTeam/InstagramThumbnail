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

@property (nonatomic, strong) UILabel *userLabel;
@property (nonatomic, strong) UIImageView *userImage;
@property (nonatomic, strong) UILabel *captionLabel;
@property (nonatomic, strong) UIButton *imageButton;
@property (nonatomic, assign) InstagramMediaModel *entity;
@property (nonatomic, assign) NSIndexPath *indexPath;
@property (nonatomic, assign) BOOL showOnePicturePerRow;

- (void)setEntity:(InstagramMediaModel *)entity andIndexPath:(NSIndexPath *)index;

@end
