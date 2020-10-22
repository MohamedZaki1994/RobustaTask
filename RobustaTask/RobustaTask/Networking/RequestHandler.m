//
//  RequestHandler.m
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/22/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

#import "RequestHandler.h"

@implementation RequestHandler

- (void) fetchRequest:(void (^)(NSArray*))completion {
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
            OwnerModel *owner = [OwnerModel new];
            model.name = item[@"name"];
            model.owner = owner;
            model.owner.onwerName = item[@"owner"][@"login"];
            model.owner.avatarImageURL = item[@"owner"][@"avatar_url"];
            [repos addObject:model];
        }
        completion(repos);
        }];

    [task resume];
}
@end
