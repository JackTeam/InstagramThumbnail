//
//  InstagramThumbnailCollectionViewController.m
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "InstagramThumbnailCollectionViewController.h"

@interface InstagramThumbnailCollectionViewController ()

@end

@implementation InstagramThumbnailCollectionViewController

#pragma mark - Life cycle

- (void)_setup {
    
}

+ (instancetype)sharedInstagramCollectionViewController {
    InstagramThumbnailCollectionViewController *instagramThumbnailCollectionViewController = [[InstagramThumbnailCollectionViewController alloc]  initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
    instagramThumbnailCollectionViewController.showThumbnail = YES;
    return instagramThumbnailCollectionViewController;
}

- (id)init {
    self = [super init];
    if (self) {
        [self _setup];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (kXHISIPAD) {
        return CGSizeMake(200, 200);
    }
    return CGSizeMake(100, 100);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10* (kXHISIPAD ? 2 : 1);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10 * (kXHISIPAD ? 2 : 1);
}

@end
