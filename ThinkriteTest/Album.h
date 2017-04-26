//
//  Album.h
//  ThinkriteTest
//
//  Created by Bernardo Santana on 4/25/17.
//  Copyright © 2017 bsantanas. All rights reserved.
//

#import <Foundation/Foundation.h>

/// An album object
@interface Album : NSObject

/**
    The image URL of the album
 */
@property (strong, nonatomic) NSString *imageUrl;

/**
 The artist
 */
@property (strong, nonatomic) NSString *artist;

/**
 The nameof the album
 */
@property (strong, nonatomic) NSString *name;

/**
 The designer of the cover
 */
@property (strong, nonatomic) NSString *designer;

/**
 The description of the album
 */
@property (strong, nonatomic) NSString *albumDescription;


/// Initializer
+(instancetype)albumWithData:(NSDictionary *)data;


@end
