//
//  Album.m
//  ThinkriteTest
//
//  Created by Bernardo Santana on 4/25/17.
//  Copyright © 2017 bsantanas. All rights reserved.
//

#import "Album.h"

@implementation Album

+(instancetype)albumWithData:(NSDictionary *)data {
    Album *album = [[Album alloc] init];
    
    album.name = data[@"album"];
    album.artist = data[@"artist"];
    album.albumDescription = data[@"description"];
    album.designer = data[@"designer"];
    album.imageUrl = data[@"image_url"];
    
    return album;
}

@end
