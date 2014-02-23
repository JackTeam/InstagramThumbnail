//
//  XHInstagramStoreManager.h
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 HUAJIE. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^DownloadDataSourceCompled)(NSArray *mediaArray, NSError *error);

@interface XHInstagramStoreManager : NSObject

- (void)mediaWithPage:(NSInteger)page localDownloadDataSourceCompled:(DownloadDataSourceCompled)downloadDataSourceCompled;

@end
