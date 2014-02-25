//
//  InstagramMediaModel+XHMediaControl.m
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 HUAJIE. All rights reserved.
//

#import "InstagramMediaModel+XHMediaControl.h"

#import "XHCommon.h"

@implementation InstagramMediaModel (XHMediaControl)

- (NSOperationQueue *)downloadQueue {
    static NSOperationQueue *_sharedQueue = nil;
    
    if(_sharedQueue == nil) {
        _sharedQueue = [NSOperationQueue new];
        [_sharedQueue setMaxConcurrentOperationCount:3];
    }
    
    return _sharedQueue;
}

- (void)dataWithContentsOfURL:(NSURL *)url completionBlock:(DonwloadImageCompled)donwloadImageCompled {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:15.0];
    
    __weak typeof(self) weakSelf = self;
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[self downloadQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               UIImage *image = [[UIImage alloc] initWithData:data];
                               if (weakSelf.roundedRadius) {
                                   image = [XHCommon createRoundedRectImage:image size:image.size roundRadius:weakSelf.roundedRadius];
                               }
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   if (image) {
                                       if (donwloadImageCompled) {
                                           donwloadImageCompled(image, nil);
                                       }
                                   } else {
                                       donwloadImageCompled(nil, connectionError);
                                   }
                               });
                           }
     ];
}

- (void)downloadImageWithBlock:(DonwloadImageCompled)donwloadImageCompled {
    __weak typeof(self) weakSelf = self;
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [weakSelf dataWithContentsOfURL:[NSURL URLWithString:self.picture] completionBlock:donwloadImageCompled];
    });
}

+ (id)entityWithDictionary:(NSDictionary *)dictionary {
    InstagramMediaModel *instagramMediaModel = [[InstagramMediaModel alloc] init];
    instagramMediaModel.picture = [dictionary valueForKey:@"url"];
    instagramMediaModel.userName = [dictionary valueForKey:@"userName"];
    instagramMediaModel.caption = [dictionary valueForKey:@"caption"];
    instagramMediaModel.width = [[dictionary valueForKey:@"width"] floatValue];
    instagramMediaModel.heigth = [[dictionary valueForKey:@"heigth"] floatValue];
    instagramMediaModel.roundedRadius = 40;
    return instagramMediaModel;
}

@end
