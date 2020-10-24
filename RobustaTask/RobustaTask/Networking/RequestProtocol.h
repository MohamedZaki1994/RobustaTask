//
//  RequestProtocol.h
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/24/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoryModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RequestProtocol <NSObject>
- (void)fetchRequest: (void (^)(NSArray* model, NSError *error))completion;
- (void) fetchDetailsRequest:(NSString*)url completion: (void (^)(OwnerModel*))completion;

@end

NS_ASSUME_NONNULL_END
