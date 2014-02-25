//
//  InstagramCollectionViewController.m
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 HUAJIE. All rights reserved.
//

#import "InstagramCollectionViewController.h"

static NSString * const kXHInstagramFooter = @"InstagramFooter";

@interface InstagramCollectionViewController ()

@end

@implementation InstagramCollectionViewController

#pragma mark - Propertys

- (NSMutableArray *)mediaArray {
    if (!_mediaArray) {
        _mediaArray = [[NSMutableArray alloc] initWithCapacity:3];
    }
    return _mediaArray;
}

- (XHInstagramStoreManager *)instagramStoreManager {
    if (!_instagramStoreManager) {
        _instagramStoreManager = [[XHInstagramStoreManager alloc] init];
    }
    return _instagramStoreManager;
}

#pragma mark - Life cycle

- (void)_baseSetup {
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.activityIndicator startAnimating];
    self.downloading = YES;
}

- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    if ((self = [super initWithCollectionViewLayout:layout])) {
        [self _baseSetup];
    }
    return self;
}

+ (instancetype)sharedInstagramCollectionViewController {
    return nil;
}

- (id)init {
    self = [super init];
    if (self) {
        [self _baseSetup];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self downloadDataSource];
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

- (void)_setupCollectionView {
    [self.collectionView registerClass:[InstagramCell class] forCellWithReuseIdentifier:kXHInstagramCell];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kXHInstagramFooter];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"Instagram";
    
    [self _setupCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DataSource manager 

- (void)downloadDataSource {
    self.downloading = YES;
    __weak typeof(self) weakSelf = self;
    if ([self.mediaArray count] == 0) {
        [self.instagramStoreManager mediaWithPage:0 localDownloadDataSourceCompled:^(NSArray *mediaArray, NSError *error) {
            if (error || mediaArray.count == 0) {
                showAlert(@"Instagram", @"No results found", @"OK");
                [weakSelf.activityIndicator stopAnimating];
            }else{
                [weakSelf.mediaArray addObjectsFromArray:mediaArray];
                [weakSelf.collectionView reloadData];
            }
            weakSelf.downloading = NO;
        }];
    } else {
        [self.instagramStoreManager mediaWithPage:1 localDownloadDataSourceCompled:^(NSArray *mediaArray, NSError *error) {
            
            NSUInteger a = [weakSelf.mediaArray count];
            [weakSelf.mediaArray addObjectsFromArray:mediaArray];
            
            NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
            [mediaArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                NSUInteger b = a+idx;
                NSIndexPath *path = [NSIndexPath indexPathForItem:b inSection:0];
                [arr addObject:path];
            }];
            
            [weakSelf.collectionView performBatchUpdates:^{
                [weakSelf.collectionView insertItemsAtIndexPaths:arr];
            } completion:nil];
            
            weakSelf.downloading = NO;
            
            if (mediaArray.count == 0) {
                [weakSelf.activityIndicator stopAnimating];
                weakSelf.activityIndicator.hidden = YES;
                weakSelf.hideFooter = YES;
                [weakSelf.collectionView reloadData];
            }
        }];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return [self.mediaArray count];
}

#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    InstagramCell *instagramCell = [collectionView dequeueReusableCellWithReuseIdentifier:kXHInstagramCell forIndexPath:indexPath];
    
    if ([self.mediaArray count] > 0) {
        InstagramMediaModel *entity = [self.mediaArray objectAtIndex:indexPath.row];
        instagramCell.indexPath = indexPath;
        instagramCell.showThumbnail = self.showThumbnail;
        [instagramCell setEntity:entity andIndexPath:indexPath];
        
    }
    
    if (indexPath.row == [self.mediaArray count] - 1 && !self.downloading) {
        [self downloadDataSource];
    }
    
    return instagramCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (self.hideFooter) {
        return CGSizeZero;
    }
    return CGSizeMake(CGRectGetWidth(self.view.frame), 40);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind != UICollectionElementKindSectionFooter || self.hideFooter) {
        return nil;
    }
    
    UICollectionReusableView *foot = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kXHInstagramFooter forIndexPath:indexPath];
    
    CGPoint center = self.activityIndicator.center;
    center.x = foot.center.x;
    center.y = 20;
    self.activityIndicator.center = center;
    
    [foot addSubview:self.activityIndicator];
    
    return foot;
}

@end
