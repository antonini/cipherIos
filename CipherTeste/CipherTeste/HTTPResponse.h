//
//  HTTPResponse.h
//  Webservice
//
//  Created by Mac_02 on 21/11/13.
//  Copyright (c) 2013 USB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPResponse : NSObject

@property BOOL status;
@property (nonatomic,retain) NSString *message;
@property (nonatomic,retain) NSDictionary *data;

@end
