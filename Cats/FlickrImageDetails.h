//
//  FlickrImageDetails.h
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrImageDetails : NSObject

@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *views;

- (instancetype)initWithURL:(NSString *)url andViews:(NSString *)views;

@end
