//
//  HTTPRequest.h
//  CAS
//
//  Created by Mac_02 on 20/11/13.
//  Copyright (c) 2013 USB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPResponse.h"
#import "Item.h"

@interface HTTPRequest : NSObject

+(HTTPResponse *)getItems:(Item *)item;

@end
