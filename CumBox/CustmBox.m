//
//  CustmBox.m
//  CumBox
//
//  Created by 陈世誉 on 15/6/4.
//  Copyright (c) 2015年 陈世誉. All rights reserved.
//

#import "CustmBox.h"

@implementation CustmBox

-(instancetype)initWithFrame:(CGRect)frame andAddview:(UIView *)view
{
    self = [super initWithFrame:frame];
    if (self) {
        _slectBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _slectBtn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [_slectBtn setImage:[UIImage imageNamed:@"ico_1.png"] forState:UIControlStateNormal];
        [_slectBtn setImage:[UIImage imageNamed:@"ico.png"] forState:UIControlStateSelected];
        [_slectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_slectBtn setBackgroundImage:[UIImage imageNamed:@"listbj.png"] forState:UIControlStateNormal];
        _slectBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _slectBtn.imageEdgeInsets=UIEdgeInsetsMake(0,self.frame.size.width-20, 0, 0);
        _slectBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [_slectBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_slectBtn setTitle:@"时间" forState:UIControlStateNormal];
        [self addSubview:_slectBtn];
        
        _table=[[UITableView alloc]initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y+self.frame.size.height, self.frame.size.width, 0) style:UITableViewStylePlain];
        _table.dataSource=self;
        _table.delegate=self;
        [view addSubview:_table];
        
        self.tabDataArray=@[@"2011",@"2012",@"2013",@"2014",@"2015"];
    }
    return self;
}
-(void)btnClick:(UIButton *)btn
{
    btn.selected=!btn.selected;
     CGRect temp = self.table.frame;
    if (btn.selected) {
       
        temp.size.height=250;
        [UIView animateWithDuration:0.5 animations:^{
            
            self.table.frame=temp;
        }];
    }else
    {
        temp.size.height=0;
        [UIView animateWithDuration:0.5 animations:^{
            self.table.frame=temp;
        }];
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tabDataArray.count;
   // return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellString=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellString];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellString];
    }
    cell.textLabel.text=[self.tabDataArray objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.slectBtn setTitle:[self.tabDataArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    self.slectBtn.selected=NO;
    CGRect temp = self.table.frame;
    temp.size.height=0;
    [UIView animateWithDuration:0.5 animations:^{
        self.table.frame=temp;
    }];
}
@end
