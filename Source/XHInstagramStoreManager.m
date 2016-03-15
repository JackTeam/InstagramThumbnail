//
//  XHInstagramStoreManager.m
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
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
        
        __block NSMutableArray *mediaArray = [NSMutableArray new];
        for (NSDictionary *mediaDictionary in instagramDataSources) {
            NSInteger index = [instagramDataSources indexOfObject:mediaDictionary];
            if (index < (page + 1) * 10 && index >= page * 10) {
                [mediaArray addObject:[InstagramMediaModel entityWithDictionary:mediaDictionary]];
            }
        }
        instagramDataSources = nil;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (downloadDataSourceCompled) {
                downloadDataSourceCompled(mediaArray, nil);
            }
            mediaArray = nil;
        });
    });
}

@end
