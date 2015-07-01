//
//  EmailProvider.h
//  UISample
//
//  Created by gki on 2015/06/29.
//  Copyright (c) 2015年 gki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmailProvider : NSObject
@property (nonatomic) NSString *email;

+ (EmailProvider *)sharedManager;
@end
