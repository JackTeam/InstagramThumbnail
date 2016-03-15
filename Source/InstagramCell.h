//
//  InstagramCell.h
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstagramMediaModel+XHMediaControl.h"

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
