//
//  AlbumsTableViewController.m
//  ThinkriteTest
//
//  Created by Bernardo Santana on 4/25/17.
//  Copyright © 2017 bsantanas. All rights reserved.
//

#import "AlbumsTableViewController.h"
#import "AlbumDetailViewController.h"
#import "ArtistTableViewCell.h"
#import "Model.h"

@interface AlbumsTableViewController ()

@property (strong, nonatomic) NSArray<UIImage *> *imageCache;
@property (strong, nonatomic) Album *selectedAlbum;

@end

@implementation AlbumsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[Model shared] loadAlbumsWithCompletion:^(BOOL success) {
        if(success) {
            [self.tableView reloadData];
        }
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Model shared].albums.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ArtistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableToDetail" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"TableToDetail"]) {
        AlbumDetailViewController *avc = segue.destinationViewController;
        avc.album = self.selectedAlbum;
    }
}


@end
