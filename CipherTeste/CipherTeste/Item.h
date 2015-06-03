//
//  Item.h
//  CipherTeste
//
//  Created by Tiago Missiato on 6/2/15.
//  Copyright (c) 2015 Tiago Missiato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic,retain) NSString *image;
@property (nonatomic,retain) NSString *title;
@property (nonatomic,retain) NSString *description;
@property float valor;

@end
