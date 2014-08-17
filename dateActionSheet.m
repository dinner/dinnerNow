//
//  dateActionSheet.m
//  dinner
//
//  Created by Apple on 14-6-24.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "dateActionSheet.h"

@implementation dateActionSheet

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

-(void)layoutSubviews
{
    [super layoutSubviews];
    UINavigationBar* pNavBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0,350 , 320, 40)];
    pNavBar.barStyle = UIBarStyleBlackOpaque;
    UINavigationItem* pNavItem = [[UINavigationItem alloc] initWithTitle:@"时间选择"];
    UIBarButtonItem* prightBt = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleBordered target:self action:@selector(finish)];
    pNavItem.rightBarButtonItem = prightBt;
    NSArray* pArrayItem = [[NSArray alloc] initWithObjects:pNavItem, nil];
    [pNavBar setItems:pArrayItem];
    //nav
    [self.superview addSubview:pNavBar];
    //时间选择器
    self.m_pDatePicker = [[UIDatePicker alloc] init];
    UIView* pView = [[self.m_pDatePicker subviews] objectAtIndex:0];
    pView.backgroundColor = [UIColor whiteColor];
    CGRect rectPicker = CGRectMake(0, 390, 320, 90);
    self.m_pDatePicker.frame = rectPicker;
    [self.superview addSubview:self.m_pDatePicker];
}

//完成按钮点击 uiactionsheet收起
-(void)finish
{
    [self dismissWithClickedButtonIndex:0 animated:YES];
 //   [self.delegate actionSheet:self clickedButtonAtIndex:0];
    //
    NSDate* pDate = self.m_pDatePicker.date;
    NSDateFormatter* pDateFormat = [[NSDateFormatter alloc] init];
    [pDateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString* strTime = [pDateFormat stringFromDate:pDate];
    [self.date_delegate setDate:strTime];
    [self.date_delegate viewDown];//将视图放下
}
//
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
    }
    else{
        
    }
}


@end
