//
//  ItemCell.h
//  CipherTeste
//
//  Created by Tiago Missiato on 6/2/15.
//  Copyright (c) 2015 Tiago Missiato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemCell : NSObject

@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemTitle;
@property (weak, nonatomic) IBOutlet UILabel *itemDescription;

@end
