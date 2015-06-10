//
//  CSYPickView.h
//  CumBox
//
//  Created by 陈世誉 on 15/6/4.
//  Copyright (c) 2015年 陈世誉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSYPickView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)UIButton *slectBtn;
@property(nonatomic,strong)UIPickerView *pickview;
@property(nonatomic,strong)NSArray *tabDataArray;
@property(nonatomic,strong)UIView *bjview;
-(instancetype)initWithFrame:(CGRect)frame andAddview:(UIView *)view
;
@end
