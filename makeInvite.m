//
//  makeInvite.m
//  dinner
//
//  Created by 张 凌翔 on 14-4-23.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "makeInvite.h"
#import "inviteCost.h"
#import "inviteTime.h"
#import "globalFun.h"
#define keybord_height 216.0

@interface makeInvite ()

@end

@implementation makeInvite

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self iconHide];
    
    _m_pTitle.delegate = self;//为编辑框设置代理
    //label添加点击事件
    [self addClickActionToLabel];
    //时间label点击事件
    UITapGestureRecognizer* pTimeGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btTimeClicked)];
    _m_pDate.userInteractionEnabled = YES;
    [_m_pDate addGestureRecognizer:pTimeGes];
    //初始化时间为当前时间
    NSString* strTime = [globalFun getCurrentTime];
    _m_pDate.text = strTime;
}
//时间点击
-(void)btTimeClicked
{
    dateActionSheet* pAcSheet = [[dateActionSheet alloc]init];
    pAcSheet.date_delegate = self;
    [pAcSheet showFromRect:self.view.bounds inView:self.view animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//隐藏图标
-(void)iconHide
{
    //
    self.m_pViewGirl.hidden = YES;
    self.m_pViewBoy.hidden= YES;
    self.m_pViewEther.hidden = YES;
    //
    self.m_pViewIpay.hidden = YES;
    self.m_pViewAA.hidden = YES;
}

//label添加点击事件
-(void)addClickActionToLabel
{
    //邀请女性点击
    UITapGestureRecognizer* pTapGirl = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelGirlClicked:)];
    self.m_pGirl.userInteractionEnabled = YES;
    [self.m_pGirl addGestureRecognizer:pTapGirl];
    //邀请男性点击
    UITapGestureRecognizer* pTapBoy = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelBoyClicked:)];
    self.m_pBoy.userInteractionEnabled = YES;
    [self.m_pBoy addGestureRecognizer:pTapBoy];
    //邀请不限男女
    UITapGestureRecognizer*pTapEther= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelEtherClicked:)];
    self.m_pEther.userInteractionEnabled = YES;
    [self.m_pEther addGestureRecognizer:pTapEther];

    //消费方式 我请客
    UITapGestureRecognizer* pTapIpay = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelIPayClicked:)];
    self.m_pLabelIPay.userInteractionEnabled = YES;
    [self.m_pLabelIPay addGestureRecognizer:pTapIpay];
    //消费方式 AA制
    UITapGestureRecognizer* pTapAA = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelAAClicked:)];
    self.m_pLabelAA.userInteractionEnabled = YES;
    [self.m_pLabelAA addGestureRecognizer:pTapAA];
}

#pragma  mark -"性别label点击事件"
-(void) labelGirlClicked:(UITapGestureRecognizer*)gesture
{
//    self.m_pGirl.textColor = [UIColor blueColor];
//    self.m_pBoy.textColor = [UIColor grayColor];
//    self.m_pEther.textColor = [UIColor grayColor];
    self.m_pViewGirl.hidden = NO;
    self.m_pViewBoy.hidden = YES;
    self.m_pViewEther.hidden = YES;
}
-(void) labelBoyClicked:(UITapGestureRecognizer*)gesture
{
//    self.m_pBoy.textColor = [UIColor blueColor];
//    self.m_pGirl.textColor = [UIColor grayColor];
//    self.m_pEther.textColor = [UIColor grayColor];
    self.m_pViewGirl.hidden = YES;
    self.m_pViewBoy.hidden = NO;
    self.m_pViewEther.hidden = YES;
}
-(void) labelEtherClicked:(UITapGestureRecognizer*)gesture
{
//    self.m_pEther.textColor = [UIColor blueColor];
//    self.m_pBoy.textColor = [UIColor grayColor];
//    self.m_pGirl.textColor = [UIColor grayColor];
    self.m_pViewGirl.hidden = YES;
    self.m_pViewBoy.hidden = YES;
    self.m_pViewEther.hidden = NO;
}

#pragma mark -"付费方式label点击事件"
-(void) labelIPayClicked:(UITapGestureRecognizer*)gesture
{
    self.m_pLabelIPay.textColor = [UIColor blueColor];
    self.m_pLabelAA.textColor = [UIColor grayColor];
    self.m_pViewIpay.hidden = NO;
    self.m_pViewAA.hidden = YES;
}
-(void) labelAAClicked:(UITapGestureRecognizer*)gesture
{
    self.m_pLabelAA.textColor = [UIColor blueColor];
    self.m_pLabelIPay.textColor = [UIColor grayColor];
    self.m_pViewIpay.hidden = YES;
    self.m_pViewAA.hidden = NO;
}

#pragma mark -"tableview delegate"
//返回uitableView的行数
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
//绘制cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* strCell = nil;//idetifer
    id pCell = nil;//cell指针
    int index = indexPath.row;//序列
    switch (index)
    {
        case 0:
        {
            strCell = @"cost";
             pCell = (inviteCost*)[tableView dequeueReusableCellWithIdentifier:strCell];
            if (pCell == nil)
            {
                NSArray* aNib = [[NSBundle mainBundle] loadNibNamed:@"inviteCost" owner:self options:nil];
                for (id pObject in aNib)
                {
                    if ([pObject isKindOfClass:[inviteCost class]])
                    {
                         pCell = [(inviteCost*)pObject initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
                    }
                }
            }
        }
            break;
        case 1:
        {
            strCell = @"time";
            pCell = (inviteTime*)[tableView dequeueReusableCellWithIdentifier:strCell];
            if (pCell == nil)
            {
                NSArray* aNib = [[NSBundle mainBundle] loadNibNamed:@"inviteTime" owner:self options:nil];
                for (id pObject in aNib)
                {
                    if ([pObject isKindOfClass:[inviteTime class]])
                    {
                        pCell = [(inviteTime*)pObject initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
                    }
                }
            }
        }
            break;
        
    }
    return pCell;
}

#pragma mark "titletext代理实现"

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offSet = frame.origin.y + 40 - (self.view.frame.size.height - keybord_height);
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:0.3f];
    if(offSet > 0)
    {
        self.view.frame = CGRectMake(0.0f, -offSet, self.view.frame.size
                                     .width, self.view.frame.size.height);
    }
    [UIView commitAnimations];//动态显示键盘
}
 
//按回车键键盘收起
-(BOOL)textfieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return YES;
}
//
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}
//返回按钮点击
- (IBAction)btReturnClicked:(id)sender
{
    //跳转
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- dateActiondelegate
-(void)setDate:(NSString *)strTime
{
    [UIView animateWithDuration:1.0 animations:^{
        self.m_pDate.text = strTime;
    }];
}

@end
