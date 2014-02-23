//
//  InstagramCollectionViewController.h
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 HUAJIE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstagramCell.h"
#import "XHInstagramStoreManager.h"

#define kXHISIPAD ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define showAlert(Title, Message, CancelButton) UIAlertView * alert = [[UIAlertView alloc] initWithTitle:Title message:Message delegate:nil cancelButtonTitle:CancelButton otherButtonTitles:nil, nil]; \
[alert show];

static NSString * const kXHInstagramCell = @"InstagramCell";

@interface InstagramCollectionViewController : UICollectionViewController

@property (nonatomic, strong) XHInstagramStoreManager *instagramStoreManager;
@property (nonatomic, strong) NSMutableArray *mediaArray;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, assign) BOOL downloading;
@property (nonatomic, assign) BOOL hideFooter;
@property (nonatomic, assign) BOOL showThumbnail;

+ (instancetype)sharedInstagramCollectionViewController;

- (void)downloadDataSource;

@end
