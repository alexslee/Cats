//
//  ImageDetailViewController.h
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SafariServices/SafariServices.h>
#import "FlickrImage.h"
#import "FlickrImageDetails.h"
@interface ImageDetailViewController : UIViewController

- (void)setupForImage:(FlickrImage *)image;

@end
