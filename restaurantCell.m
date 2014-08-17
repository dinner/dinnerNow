//
//  restaurantCell.m
//  dinner
//
//  Created by Apple on 14-7-10.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "restaurantCell.h"

@implementation restaurantCell

- (void)awakeFromNib
{
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier NS_AVAILABLE_IOS(3_0)
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
    //设置圆角
    self.m_pImage.layer.masksToBounds = YES;
    self.m_pImage.layer.cornerRadius = 5.0f;
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}
//选择按钮点击
- (IBAction)chooseThisClicked:(id)sender {
    [self.delegate choose:self.m_pName.text];
}

-(void)setPic:(UIImage*) image
{
    //设置圆角
    self.m_pImage.layer.masksToBounds = YES;
    self.m_pImage.layer.cornerRadius = 5.0f;
    self.m_pImage.image = image;
    //按钮样式
    self.m_btChoose.layer.masksToBounds = YES;
    self.m_btChoose.layer.cornerRadius = 5.0f;
    [self.m_btChoose setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.m_btChoose setBackgroundColor:[UIColor orangeColor]];
}
-(void)setName:(NSString*)strName
{
    self.m_pName.text = strName;
}
-(void)setAddress:(NSString*)strAddress
{
    self.m_pAddress.text = strAddress;
}
-(void)setNumber:(NSString*)strNumber
{
    self.m_pNumber.text = strNumber;
}



@end
