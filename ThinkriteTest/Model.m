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
                 options:0
                 error:&error];
    
    if(!error && [object isKindOfClass:[NSArray class]]) {
        NSArray *results = object;
        for (NSDictionary *result in results) {
            Album *album = [Album albumWithData:result];
            [albums addObject:album];
        }
    }
    
    return [[NSArray alloc] initWithArray:albums];
}

@end
