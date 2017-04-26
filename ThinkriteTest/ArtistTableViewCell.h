//
//  ArtistTableViewCell.h
//  ThinkriteTest
//
//  Created by Bernardo Santana on 4/25/17.
//  Copyright © 2017 bsantanas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface ArtistTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *artistImage;

-(void)configureWithAlbum:(Album *)album;

@end
