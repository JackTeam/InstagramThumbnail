//
//  InstagramMediaModel+XHMediaControl.h
//  InstagramThumbnail
//
//  Created by 曾 宪华 on 14-2-23.
//  Copyright (c) 2014年 HUAJIE. All rights reserved.
//

#import "InstagramMediaModel.h"

typedef void (^DonwloadImageCompled)(UIImage *image, NSError *error);

@interface InstagramMediaModel (XHMediaControl)

- (void)downloadImageWithBlock:(DonwloadImageCompled)donwloadImageCompled;

@end
