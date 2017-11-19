//
//  WebServices.h
//  Startwars_API
//
//  Created by Laura Lopez on 11/8/17.
//  Copyright © 2017 UAG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "SWObject.h"

@interface WebServices : NSObject<NSURLSessionDelegate>

+ (void)getGames:(void (^)(NSMutableArray<SWObject> *games)) handler;

@end

