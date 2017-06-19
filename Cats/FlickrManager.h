//
//  FlickrManager.h
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FlickrImage.h"
@interface FlickrManager : NSObject

- (void)downloadImageWithCompletionHandler:(void (^)(UIImage *))completion fromURL:(NSString *)url;

- (void)collectImagesWithCompletionHandler:(void (^)(NSMutableArray *))completion;

@end
