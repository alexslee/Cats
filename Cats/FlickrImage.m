//
//  FlickrImage.m
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "FlickrImage.h"

@implementation FlickrImage

- (instancetype)initWithFarm:(NSString *)farm andID:(NSString *)imageID andSecret:(NSString *)secret andServer:(NSString *)server {
    
    self = [super init];
    
    if (self) {
        _farm = farm;
        _imageID = imageID;
        _secret = secret;
        _server = server;
        
        _constructedURL = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",_farm,_server,_imageID,_secret];
    }
    
    return self;
}

@end
