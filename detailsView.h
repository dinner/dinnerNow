//
//  detailsView.h
//  dinner
//
//  Created by Apple on 14-6-23.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//


//详情页面
#import <UIKit/UIKit.h>

@interface detailsView : UIView

@property(retain,nonatomic) UILabel* m_pLabelTitle;
@property(retain,nonatomic) UILabel* m_pLabelAppre;//点赞
@property(retain,nonatomic) UILabel* m_pLabelName;
@property(retain,nonatomic) UILabel* m_pLabelAge;
@property(retain,nonatomic) UILabel* m_pLabelPay;
@property(retain,nonatomic) UILabel* m_pLabelPlace;
@property(retain,nonatomic) UILabel* m_pLabelTime;
@property(retain,nonatomic) UILabel* m_pLabelInvite;
@property(retain,nonatomic) UILabel* m_pLabelSign;
@property(retain,nonatomic) UILabel* m_pLabelCommand;

@end
