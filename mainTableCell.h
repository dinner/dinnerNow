//
//  mainTableCell.h
//  dinner
//
//  Created by Apple on 14-7-11.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "infoStruct.h"

@interface mainTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *m_pPhoto;
@property (weak, nonatomic) IBOutlet UILabel *m_pTitle;
@property (weak, nonatomic) IBOutlet UILabel *m_pTime;//时间
@property (weak, nonatomic) IBOutlet UILabel *m_pAddress;//约会地点
@property (weak, nonatomic) IBOutlet UILabel *m_pPeople;//约会的人
@property (weak, nonatomic) IBOutlet UILabel *m_pType;//约会类型


-(void)setInfo:(infoStruct*)st;
@end
