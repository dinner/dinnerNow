//
//  makeInvite.h
//  dinner
//
//  Created by 张 凌翔 on 14-4-23.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dateActionSheet.h"

@interface makeInvite : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,dateDelegate>
{
   // UITapGestureRecognizer* pTimeGes;
}

@property (strong, nonatomic) IBOutlet UITextField *m_pTitle;
@property (strong, nonatomic) IBOutlet UILabel *m_pTheme;

@property (strong, nonatomic) IBOutlet UILabel *m_pGirl;
@property (strong, nonatomic) IBOutlet UILabel *m_pBoy;
@property (strong, nonatomic) IBOutlet UILabel *m_pEther;
@property (strong, nonatomic) IBOutlet UILabel *m_pLabelIPay;
@property (strong, nonatomic) IBOutlet UILabel *m_pLabelAA;

//邀请图标
@property (strong, nonatomic) IBOutlet UIImageView *m_pViewGirl;
@property (strong, nonatomic) IBOutlet UIImageView *m_pViewBoy;
@property (strong, nonatomic) IBOutlet UIImageView *m_pViewEther;
//消费图标
@property (strong, nonatomic) IBOutlet UIImageView *m_pViewIpay;
@property (strong, nonatomic) IBOutlet UIImageView *m_pViewAA;
@property (weak, nonatomic) IBOutlet UILabel *m_pDate;
@property (weak, nonatomic) IBOutlet UILabel *m_pAddress;


@end
