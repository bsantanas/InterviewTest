//
//  Model.m
//  ThinkriteTest
//
//  Created by Bernardo Santana on 4/25/17.
//  Copyright © 2017 bsantanas. All rights reserved.
//

#import "Model.h"


@implementation Model

+ (Model *)shared {
    static Model *shared = nil;
    @synchronized(self) {
        if (shared == nil)
            shared = [[self alloc] init];
    }
    return shared;
}

- (void)loadAlbumsWithCompletion:(void (^)(BOOL))completion {
    
    NSURL *url = [NSURL URLWithString:@"http://software.voicerite.com/apptest/coding_test.json"];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              if(data) {
                                                  self.albums = [self parseAlbumsFromData:data];
                                                  completion(YES);
                                              } else {
                                                  completion(NO);
                                              }
                                          }];
    

    [downloadTask resume];
}

-(NSArray *)parseAlbumsFromData:(NSData *)data {
    NSMutableArray *albums = [[NSMutableArray alloc] init];
    NSError *error = nil;
    id object = [NSJSONSerialization
                 JSONObjectWithData:data
                 options:NSUTF8StringEncoding
                 error:&error];
    
    if(!error ) {
        NSDictionary *dict = object;
        NSArray *results = dict[@"Albums"];
        for (NSDictionary *result in results) {
            Album *album = [Album albumWithData:result];
            [albums addObject:album];
        }
        for (NSDictionary *result in results) {
            Album *album = [Album albumWithData:result];
            [albums addObject:album];
        }
        for (NSDictionary *result in results) {
            Album *album = [Album albumWithData:result];
            [albums addObject:album];
        }

    }
    
    return [[NSArray alloc] initWithArray:albums];
}

@end
