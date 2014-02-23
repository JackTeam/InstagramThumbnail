//
//  InstagramMediaModel+XHMediaControl.m
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 HUAJIE. All rights reserved.
//

#import "InstagramMediaModel+XHMediaControl.h"

@implementation InstagramMediaModel (XHMediaControl)

- (void)downloadImageWithBlock:(DonwloadImageCompled)donwloadImageCompled {
    
}

+ (id)entityWithDictionary:(NSDictionary *)dictionary {
    InstagramMediaModel *instagramMediaModel = [[InstagramMediaModel alloc] init];
    instagramMediaModel.picture = [dictionary valueForKey:@"url"];
    instagramMediaModel.userName = [dictionary valueForKey:@"userName"];
    instagramMediaModel.caption = [dictionary valueForKey:@"caption"];
    instagramMediaModel.width = [[dictionary valueForKey:@"width"] floatValue];
    instagramMediaModel.heigth = [[dictionary valueForKey:@"heigth"] floatValue];
    return instagramMediaModel;
}

@end
