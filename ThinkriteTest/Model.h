//
//  Model.h
//  ThinkriteTest
//
//  Created by Bernardo Santana on 4/25/17.
//  Copyright © 2017 bsantanas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface Model : NSObject

@property (strong, nonatomic) NSArray<Album *> *albums;

+ (Model *)shared;

-(void)loadAlbumsWithCompletion:(void (^)(BOOL))completion;

@end
