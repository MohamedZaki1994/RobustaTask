//
//  OwnerModel.h
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/22/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OwnerModel : NSObject
@property (nonatomic , retain) NSString* ownerName;
@property (nonatomic , retain) NSString* avatarImageURL;
@property (nonatomic , retain) NSString* location;
@property (nonatomic , retain) NSString* followers;
@property (nonatomic , retain) NSString* following;
@property (nonatomic , retain) NSString* createdDate;
@property (nonatomic , retain) NSString* numberOfRepos;
@property (nonatomic , retain) NSString* url;
@end

NS_ASSUME_NONNULL_END
