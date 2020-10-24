//
//  RequestHandler.h
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/22/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoryModel.h"
#import "RequestProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface RequestHandler : NSObject <RequestProtocol>
- (void)fetchRequest: (void (^)(NSArray* model, NSError *error))completion;
- (void) fetchDetailsRequest:(NSString*)url completion: (void (^)(OwnerModel*))completion;
@end

NS_ASSUME_NONNULL_END
