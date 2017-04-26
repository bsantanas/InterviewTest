//
//  AlbumDetailViewController.m
//  ThinkriteTest
//
//  Created by Bernardo Santana on 4/25/17.
//  Copyright © 2017 bsantanas. All rights reserved.
//

#import "AlbumDetailViewController.h"

@interface AlbumDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *albumCover;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *designerLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation AlbumDetailViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.album.name;
    
    self.designerLabel.text = self.album.designer;
    self.artistLabel.text = self.album.artist;
    self.albumCover.image = self.albumCoverImage;
    self.descriptionLabel.text = self.album.albumDescription;
}

@end
