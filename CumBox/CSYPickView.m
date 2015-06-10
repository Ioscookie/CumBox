//
//  CSYPickView.m
//  CumBox
//
//  Created by 陈世誉 on 15/6/4.
//  Copyright (c) 2015年 陈世誉. All rights reserved.
//

#import "CSYPickView.h"
#define kwidth 100;
@implementation CSYPickView

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
        [_slectBtn setTitle:@"时间" forState:UIControlStateNormal];
        [_slectBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_slectBtn];
        _bjview=[[UIView alloc]initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y+self.frame.size.height, self.frame.size.width, 200)];
        _bjview.backgroundColor=[UIColor grayColor];
        _bjview.userInteractionEnabled=YES;
        [view addSubview:_bjview];
        
        UIView *toobar=[[UIView alloc]initWithFrame:CGRectMake(0, 0, _bjview.frame.size.width, 40)];
        toobar.backgroundColor=[UIColor redColor];
        toobar.userInteractionEnabled=YES;
        [_bjview addSubview:toobar];
        
        UIButton *qxbtn=[UIButton buttonWithType:UIButtonTypeCustom];
        qxbtn.frame = CGRectMake(0, 5, 30, 30);
        [qxbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [qxbtn setTitle:@"取消" forState:UIControlStateNormal];
        qxbtn.titleLabel.font=[UIFont systemFontOfSize:14];
        [qxbtn addTarget:self action:@selector(qxClick) forControlEvents:UIControlEventTouchUpInside];
        [toobar addSubview:qxbtn];
        
        UIButton *qdbtn=[UIButton buttonWithType:UIButtonTypeCustom];
        qdbtn.frame = CGRectMake(toobar.frame.size.width-30, 5, 30, 30);
        [qdbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [qdbtn setTitle:@"确定" forState:UIControlStateNormal];
        qdbtn.titleLabel.font=[UIFont systemFontOfSize:14];
        [qdbtn addTarget:self action:@selector(qdClick) forControlEvents:UIControlEventTouchUpInside];
        [toobar addSubview:qdbtn];
        _pickview=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 40, _bjview.frame.size.width, _bjview.frame.size.height)];
        _pickview.dataSource=self;
        _pickview.delegate=self;
        _bjview.alpha=0;
        [_bjview addSubview:_pickview];
        
        self.tabDataArray=@[@"2011",@"2012",@"2013",@"2014",@"2015"];
    }
    return self;
}
-(void)qxClick
{
    self.slectBtn.selected=NO;
    self.bjview.alpha=0;
}
-(void)qdClick
{
    self.slectBtn.selected=NO;
    self.bjview.alpha=0;
}
-(void)btnClick:(UIButton *)btn
{
    btn.selected=!btn.selected;
    if (btn.selected) {
        self.bjview.alpha=1;
       
    }else
    {
       self.bjview.alpha=0;
    }
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.tabDataArray.count;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.tabDataArray objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"%@",self.tabDataArray[row]);
    
}
@end
