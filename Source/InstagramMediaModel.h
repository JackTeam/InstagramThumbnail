//
//  InstagramMediaModel.h
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 HUAJIE. All rights reserved.
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

@end
