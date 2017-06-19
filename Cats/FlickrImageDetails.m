//
//  FlickrImageDetails.m
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "FlickrImageDetails.h"

@implementation FlickrImageDetails

- (instancetype)initWithURL:(NSString *)url andViews:(NSString *)views {
    self = [super init];
    
    if (self) {
        _url = url;
        _views = views;
    }
    
    return self;
}

@end
