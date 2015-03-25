//
//  ViewController.m
//  xmlAnalysis
//
//  Created by MAC on 15/1/9.
//  Copyright (c) 2015年 MAC. All rights reserved.
//

#import "ViewController.h"
#import "xmlParser.h"

@interface ViewController ()
@property (strong,nonatomic) xmlParser *parer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self printXMLData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) printXMLData{
    xmlParser *parser = [xmlParser new];
    [parser startAnalysis];
    for(int i=0; i<parser.num; i++)
    {
        NSLog(@"第%d组数据：",i+1);
        NSLog(@"%@",[parser.pos[i] valueForKey:@"time"]);
        NSLog(@"%@",[parser.pos[i] valueForKey:@"no"]);
        NSLog(@"%@",[parser.pos[i] valueForKey:@"x"]);
        NSLog(@"%@",[parser.pos[i] valueForKey:@"y"]);
        NSLog(@"%@",[parser.pos[i] valueForKey:@"h"]);
    }
    NSLog(@"解析完成...");
}

@end
