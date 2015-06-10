//
//  CustmBox.h
//  CumBox
//
//  Created by 陈世誉 on 15/6/4.
//  Copyright (c) 2015年 陈世誉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustmBox : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIButton *slectBtn;
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *tabDataArray;
-(instancetype)initWithFrame:(CGRect)frame andAddview:(UIView *)view
;
@end
