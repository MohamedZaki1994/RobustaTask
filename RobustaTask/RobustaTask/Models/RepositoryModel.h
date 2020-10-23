//
//  RepositoryModel.h
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/22/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OwnerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RepositoryModel : NSObject

@property (nonatomic , retain) NSString* name;
@property (nonatomic , retain) NSString* desc;
@property OwnerModel* owner;

@end

NS_ASSUME_NONNULL_END
