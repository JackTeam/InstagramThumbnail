//
//  XHInstagramStoreManager.m
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 HUAJIE. All rights reserved.
//

#import "XHInstagramStoreManager.h"

#import "InstagramMediaModel+XHMediaControl.h"

@interface XHInstagramStoreManager ()

@property (nonatomic, strong) dispatch_queue_t downLoadQueue;

@end

@implementation XHInstagramStoreManager

- (id)init {
    self = [super init];
    if (self) {
        _downLoadQueue = dispatch_queue_create("downLoadQueue", NULL);
    }
    return self;
}

- (void)mediaWithPage:(NSInteger)page localDownloadDataSourceCompled:(DownloadDataSourceCompled)downloadDataSourceCompled {
    dispatch_async(self.downLoadQueue, ^{
        NSMutableArray *instagramDataSources = [[NSMutableArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"InstagramDataSource" ofType:@"plist"]];
        
        NSMutableArray *mediaArray = [NSMutableArray new];
        for (id mediaDictionary in instagramDataSources) {
            NSInteger index = [instagramDataSources indexOfObject:mediaDictionary];
            if (index < (page + 1) * 10 && index >= page * 10) {
                [mediaArray addObject:[InstagramMediaModel entityWithDictionary:mediaDictionary]];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (downloadDataSourceCompled) {
                downloadDataSourceCompled(mediaArray, nil);
            }
        });
    });
}

@end
