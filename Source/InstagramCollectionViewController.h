//
//  InstagramCollectionViewController.h
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 HUAJIE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstagramCollectionViewController : UICollectionViewController

@property (nonatomic, strong) NSMutableArray *mediaArray;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, assign) BOOL downloading;
@property (nonatomic, assign) BOOL hideFooter;

@end
