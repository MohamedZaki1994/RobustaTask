//
//  RequestHandler.m
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/22/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

#import "RequestHandler.h"

@implementation RequestHandler

- (void) fetchRequest:(void (^)(void))completion {
     NSLog(@"dsa");
    NSURL *URL = [NSURL URLWithString:@"https://api.github.com/repositories"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
        ^(NSData *data, NSURLResponse *response, NSError *error) {
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSMutableArray *repos = [NSMutableArray new];
        for (NSDictionary *item in jsonDict) {
            RepositoryModel *model = [RepositoryModel new];
            model.name = item[@"name"];
            [repos addObject:model];
        }
        completion();
        }];

    [task resume];
}
@end
