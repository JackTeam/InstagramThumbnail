//
//  InstagramCollectionViewController.m
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 HUAJIE. All rights reserved.
//

#import "InstagramCollectionViewController.h"

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

- (id)init {
    self = [super init];
    if (self) {
        [self _baseSetup];
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
    self.title = @"Instagram";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
