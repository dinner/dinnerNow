//
//  dateActionSheet.h
//  dinner
//
//  Created by Apple on 14-6-24.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol dateDelegate <NSObject>

-(void)setDate:(NSString*)strTime;
-(void)viewDown;//view下落
@end

@interface dateActionSheet : UIActionSheet<UIActionSheetDelegate>
@property(retain,nonatomic) UIDatePicker* m_pDatePicker;
@property(unsafe_unretained,nonatomic) id<dateDelegate> date_delegate;
@end
