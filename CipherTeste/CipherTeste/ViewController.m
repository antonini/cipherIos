//
//  ViewController.m
//  CipherTeste
//
//  Created by Tiago Missiato on 6/2/15.
//  Copyright (c) 2015 Tiago Missiato. All rights reserved.
//

#import "ViewController.h"
#import "HTTPRequest.h"
#import "HTTPResponse.h"
#import "NSObject+KJSerializer.h"
#import "UIImageView+WebCache.h"

@interface ViewController  () {
    NSArray *data;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIEdgeInsets inset = UIEdgeInsetsMake(10, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    [self performSelectorInBackground:@selector(loadData) withObject:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData
{
    
    HTTPResponse *ret = [HTTPRequest getItems:_item];
    if(ret.data){
        data = [[NSMutableArray alloc] init];
        NSMutableArray *serverOrder = [[NSMutableArray alloc] init];
        for (NSDictionary *currentItem in [ret.data objectForKey:@"conteudo"]) {
            Item *newItem = [[Item alloc] init];
            [newItem setDictionary:currentItem];
            
            [serverOrder addObject:newItem];
        }
        data = [serverOrder sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
            float first = [(Item*)a valor];
            float second = [(Item*)b valor];
            return first > second;
        }];
        NSLog(@"finished");
        [self.tableView reloadData];
    } else {
        NSLog(@"Nao Tem Retorno");
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [data count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

//    if (cell == nil)
//    {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                       reuseIdentifier:CellIdentifier] autorelease];
//    }
    
    Item *cItem = (Item *)[data objectAtIndex:indexPath.row];
    
    UILabel *title = (UILabel *)[cell.contentView viewWithTag:1];
    UILabel *description = (UILabel *)[cell.contentView viewWithTag:2];
    UILabel *value = (UILabel *)[cell.contentView viewWithTag:4];
    
    NSNumber *val = [NSNumber numberWithFloat: [cItem valor]];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:[NSLocale currentLocale]];
    NSString *numberAsString = [numberFormatter stringFromNumber:val];
    
    description.numberOfLines = 0;
    [description sizeToFit];
    
    title.text = [cItem title];
    description.text = [cItem description];
    value.text = numberAsString;
    
    UIImageView *itemImage = (UIImageView *)[cell.contentView viewWithTag:3];
    [itemImage sd_setImageWithURL:[NSURL URLWithString:[cItem image]]
                      placeholderImage:[UIImage imageNamed:nil]];
//    [itemImage setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[cItem image]]]]];
    
    return cell;
}
@end
