//
//  RequestHandler.h
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/22/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoryModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RequestHandler : NSObject
- (void)fetchRequest: (void (^)(void))completion;
@end

NS_ASSUME_NONNULL_END
