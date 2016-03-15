//
//  InstagramMediaModel.h
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import <Foundation/Foundation.h>

enum XHInstagramMediaType {
    XHInstagramMediaTypeImage = 0,
    XHInstagramMediaTypeVideo
};

@interface InstagramMediaModel : NSObject

@property (nonatomic, assign) enum XHInstagramMediaType type;

@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *profilePicture;
@property (nonatomic, strong) NSString *picture;
@property (nonatomic, strong) UIImage *photo;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat heigth;
@property (nonatomic, assign) CGFloat roundedRadius;

@end
