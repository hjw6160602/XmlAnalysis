//
//  xmlParser.m
//  xmlAnalysis
//
//  Created by MAC on 15/1/9.
//  Copyright (c) 2015年 MAC. All rights reserved.
//

#import "xmlParser.h"

@implementation xmlParser

//开始解析
- (void) startAnalysis{
    _pos = [NSMutableArray new];
    
    TBXML* tbxml = [[TBXML alloc] initWithXMLFile:@"test2.xml" error:nil];
    TBXMLElement * root = tbxml.rootXMLElement;
    
    if (root) {
        TBXMLElement * posElement = [TBXML childElementNamed:@"pos" parentElement:root];
        TBXMLElement *itemElement = [TBXML childElementNamed:@"item" parentElement:posElement];
        while (itemElement != nil) {
            NSMutableDictionary *dict = [NSMutableDictionary new];
            
            //获得属性值
            NSString *_time = [TBXML valueOfAttributeNamed:@"time" forElement:itemElement error:nil];
            [dict setValue:_time forKey:@"time"];
            
            NSString *_no = [TBXML valueOfAttributeNamed:@"no" forElement:itemElement error:nil];
            [dict setValue:_no forKey:@"no"];
            
            NSString *_x = [TBXML valueOfAttributeNamed:@"x" forElement:itemElement error:nil];
            [dict setValue:_x forKey:@"x"];
            
            NSString *_y = [TBXML valueOfAttributeNamed:@"y" forElement:itemElement error:nil];
            [dict setValue:_y forKey:@"y"];
            
            NSString *_h = [TBXML valueOfAttributeNamed:@"h" forElement:itemElement error:nil];
            [dict setValue:_h forKey:@"h"];

            [_pos addObject:dict];
            
            itemElement = itemElement->nextSibling;
        }
        _num = [_pos count];
    }
}

@end
