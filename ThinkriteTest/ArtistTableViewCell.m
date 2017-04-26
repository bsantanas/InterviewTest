//
//  ArtistTableViewCell.m
//  ThinkriteTest
//
//  Created by Bernardo Santana on 4/25/17.
//  Copyright © 2017 bsantanas. All rights reserved.
//

#import "ArtistTableViewCell.h"

@interface ArtistTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumNameLabel;

@end

@implementation ArtistTableViewCell

-(void)configureWithAlbum:(Album *)album
{
    self.artistNameLabel.text = album.artist;
    self.albumNameLabel.text = album.name;
}

@end
