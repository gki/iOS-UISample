
//
//  EmailProvider.m
//  UISample
//
//  Created by gki on 2015/06/29.
//  Copyright (c) 2015年 gki. All rights reserved.
//

#import "EmailProvider.h"

@implementation EmailProvider


static EmailProvider *instance = nil;

+ (EmailProvider *)sharedManager {
    @synchronized (self) {
        if (!instance) {
            instance = [[EmailProvider alloc] init];
        }
        
        return instance;
    }
}


@end
