//
//  HTTPRequest.m
//  CAS
//
//  Created by Mac_02 on 20/11/13.
//  Copyright (c) 2013 USB. All rights reserved.
//

#define ITEMS_URL @"http://tmp.eidoscode.com/cipher/ws.json"

#import "HTTPRequest.h"

@implementation HTTPRequest

+(HTTPResponse *)getItems:(Item *)item
{
    NSURL *url = [NSURL URLWithString:ITEMS_URL];
    NSLog(@"%@",url);
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:url];
    
    req.HTTPMethod=@"GET";
    
    return [HTTPRequest sendRequest:req];
}

+(HTTPResponse *)sendRequest:(NSMutableURLRequest *)request
{
    
    [request setAllHTTPHeaderFields:@{@"Accept-Language": @"pt-BR"}];
    NSURLResponse *response;
    NSError *error;
    NSDictionary *data;
    HTTPResponse *ret = [[HTTPResponse alloc] init];
    // executa a requisição http
    NSData *dat = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSLog(@"ret => %@",[[NSString alloc] initWithData:dat encoding:NSUTF8StringEncoding]);
    //checa se foi ok
    if (!error) {
        // transforma o json em NSDictionary
        data = [NSJSONSerialization JSONObjectWithData:dat options:kNilOptions error:&error];
        
        if (!error) {
            ret.status = YES;
            ret.message = @"";
            ret.data = data;
        } else {
            ret.status = NO;
            ret.message = [error localizedDescription];
        }
    } else {
        ret.status = NO;
        ret.message = [error localizedDescription];
    }
    return ret;
}

@end
