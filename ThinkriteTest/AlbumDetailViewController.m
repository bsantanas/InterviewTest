//
//  AlbumDetailViewController.m
//  ThinkriteTest
//
//  Created by Bernardo Santana on 4/25/17.
//  Copyright © 2017 bsantanas. All rights reserved.
//

#import "AlbumDetailViewController.h"
#import "AlbumDetailTableViewCell.h"

@interface AlbumDetailViewController ()

@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) UIImageView *albumCover;
@property (weak, nonatomic) UILabel *artistLabel;
@property (weak, nonatomic) UILabel *designerLabel;

@end

@implementation AlbumDetailViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 100.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView reloadData];
    
    self.designerLabel.text = self.album.designer;
    self.artistLabel.text = self.album.artist;
    self.albumCover.image = self.albumCoverImage;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AlbumDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DescriptionCell" forIndexPath:indexPath];
    cell.descriptionLabel.text = self.album.albumDescription;
    return cell;
    
}

@end
