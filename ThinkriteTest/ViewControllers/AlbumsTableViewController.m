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

@property (strong, nonatomic) NSMutableDictionary *imageCache;
@property (strong, nonatomic) Album *selectedAlbum;
@property (strong, nonatomic) UIImage *selectedImage;

@end

@implementation AlbumsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Albums";
    
    self.imageCache = [[NSMutableDictionary alloc] init];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    [[Model shared] loadAlbumsWithCompletion:^(BOOL success) {
        if(success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
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
    ArtistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumCell" forIndexPath:indexPath];
    
    if([[Model shared].albums objectAtIndex:indexPath.row]) {
        Album *album = [Model shared].albums[indexPath.row];
        [cell configureWithAlbum:album];
        
        UIImage *image = [self.imageCache objectForKey:album.imageUrl];
        if (image) {
            cell.artistImage.image = image;
        } else {
            [self downloadImageWithURL:album.imageUrl AndSetAt:indexPath];
        }
    }
    
    
    return cell;
}

-(void)downloadImageWithURL:(NSString *)url AndSetAt:(NSIndexPath *) indexPath {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       NSURL *imageURL = [NSURL URLWithString:url];
                       NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                       UIImage *image = [UIImage imageWithData:imageData];
                       [self.imageCache setObject:image forKey:url];
                       
                       dispatch_sync(dispatch_get_main_queue(), ^{
                           ArtistTableViewCell *updateCell = (id)[self.tableView cellForRowAtIndexPath:indexPath];
                           if (updateCell)
                               updateCell.artistImage.image = image;
                           
                       });
                   });

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([[Model shared].albums objectAtIndex:indexPath.row]) {
        Album *album = [Model shared].albums[indexPath.row];
        self.selectedImage = self.imageCache[album.imageUrl];
        self.selectedAlbum = album;
        [self performSegueWithIdentifier:@"TableToDetail" sender:self];
    }
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"TableToDetail"]) {
        AlbumDetailViewController *avc = segue.destinationViewController;
        avc.album = self.selectedAlbum;
        avc.albumCoverImage = self.selectedImage;
    }
}


@end
