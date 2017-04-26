//
//  AlbumDetailViewController.h
//  ThinkriteTest
//
//  Created by Bernardo Santana on 4/25/17.
//  Copyright © 2017 bsantanas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface AlbumDetailViewController : UIViewController

@property (strong, nonatomic) Album *album;
@property (strong, nonatomic) UIImage *albumCoverImage;

@end
