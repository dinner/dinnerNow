//
//  inviteCost.m
//  dinner
//
//  Created by 张 凌翔 on 14-4-23.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "inviteCost.h"

@implementation inviteCost

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    //添加点击事件
    UITapGestureRecognizer* ptapIPay = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelIpayClicked:)];
    UITapGestureRecognizer* ptapAA = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelAAClicked:)];
    self.m_pLabelIPay.userInteractionEnabled = YES;
    [self.m_pLabelIPay addGestureRecognizer:ptapIPay];
    self.m_pLabelAA.userInteractionEnabled = YES;
    [self.m_pLabelAA addGestureRecognizer:ptapAA];
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//我请客点击
-(void)labelIpayClicked:(UITapGestureRecognizer*)gesture
{
    _m_pLabelIPay.textColor = [UIColor blueColor];
    _m_pLabelAA.textColor = [UIColor grayColor];
    NSLog(@"I pay");
}
//aa制点击
-(void)labelAAClicked:(UITapGestureRecognizer*)gesture
{
    _m_pLabelIPay.textColor = [UIColor grayColor];
    _m_pLabelAA.textColor = [UIColor blueColor];
    NSLog(@"AA");
}


@end
