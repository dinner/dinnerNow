//
//  mainTableCell.m
//  dinner
//
//  Created by Apple on 14-7-11.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "mainTableCell.h"

@implementation mainTableCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//设置信息
-(void)setInfo:(infoStruct*)st
{
    self.m_pPhoto.layer.masksToBounds = YES;
    self.m_pPhoto.layer.cornerRadius = 5.0f;
    self.m_pPhoto.image = [UIImage imageNamed:@"img.png"];
    self.m_pTitle.text = st.strTitle;
    self.m_pType.text = st.strType;
    self.m_pTime.text = st.strTime;
    self.m_pAddress.text = st.strAddress;
    self.m_pPeople.text = st.strPeople;
}

@end
