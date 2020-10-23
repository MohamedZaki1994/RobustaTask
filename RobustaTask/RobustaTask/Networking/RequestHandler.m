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
            model.desc = item[@"description"];
            model.owner = owner;
            model.owner.url = item[@"owner"][@"url"];
            [repos addObject:model];
        }
        completion(repos);
        }];

    [task resume];
}

- (void) fetchDetailsRequest:(NSString*)url completion: (void (^)(OwnerModel*))completion {
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
        ^(NSData *data, NSURLResponse *response, NSError *error) {
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        OwnerModel *owner = [OwnerModel new];

        if ([jsonDict objectForKey:@"name"] == (id)[NSNull null]) {
            owner.ownerName = @"Unkown";

        } else {
            owner.ownerName = jsonDict[@"name"];
        }
        owner.location = jsonDict[@"location"];
        owner.createdDate = jsonDict[@"created_at"];
        owner.followers = jsonDict[@"followers"];
        owner.following = jsonDict[@"following"];
        owner.numberOfRepos = jsonDict[@"public_repos"];
        owner.avatarImageURL = jsonDict[@"avatar_url"];
        completion(owner);
        }];

    [task resume];
}
@end
