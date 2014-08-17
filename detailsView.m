//
//  detailsView.m
//  dinner
//
//  Created by Apple on 14-6-23.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "detailsView.h"

@implementation detailsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
//
-(void)initTheChild
{
    self.m_pLabelTitle = [[UILabel alloc] init];
    self.m_pLabelAppre = [[UILabel alloc] init];
    self.m_pLabelName = [[UILabel alloc] init];
    self.m_pLabelAge = [[UILabel alloc] init];
    self.m_pLabelPay = [[UILabel alloc]init];
    self.m_pLabelPlace = [[UILabel alloc] init];
    self.m_pLabelTime = [[UILabel alloc] init];
    self.m_pLabelInvite = [[UILabel alloc] init];
    self.m_pLabelSign = [[UILabel alloc] init];
    self.m_pLabelCommand = [[UILabel alloc] init];
}

//添加childview
-(void)addChildView
{
    [self initTheChild];
    UIImageView* pImgApp = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"grade.png"]];//等级pic
    
    //
    pImgApp.frame = CGRectMake(200, 0, 16, 16);
    UIView* viewTitle = [[UIView alloc]init];
    viewTitle.backgroundColor = [UIColor blueColor];
    self.m_pLabelTitle.frame = CGRectMake(0, 0, 80, 30);
    
    [viewTitle addSubview:self.m_pLabelTitle];
}


@end
