//
//  detailInfo.h
//  dinner
//
//  Created by Apple on 14-6-23.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "infoStruct.h"

@interface detailInfo : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *m_pPhoto;
@property (weak, nonatomic) IBOutlet UILabel *m_pName;
@property (weak, nonatomic) IBOutlet UILabel *m_pAge;
@property (weak, nonatomic) IBOutlet UILabel *m_pPay;

@property (weak, nonatomic) IBOutlet UILabel *m_pTime;

@property (weak, nonatomic) IBOutlet UILabel *m_pAddress;
@property (weak, nonatomic) IBOutlet UILabel *m_pPeaple;
@property (weak, nonatomic) IBOutlet UILabel *m_pSign;
@property (weak, nonatomic) IBOutlet UILabel *m_pComment;

-(void)setDetailsInfo:(infoStruct*)cell photo:(UIImage*)imgPhoto;
@end
