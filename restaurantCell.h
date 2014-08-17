//
//  restaurantCell.h
//  dinner
//
//  Created by Apple on 14-7-10.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol chooseThisDelegate <NSObject>
-(void)choose:(NSString*)str;
@end

@interface restaurantCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *m_pImage;
@property (weak, nonatomic) IBOutlet UILabel *m_pName;
@property (weak, nonatomic) IBOutlet UILabel *m_pAddress;
@property (weak, nonatomic) IBOutlet UILabel *m_pNumber;
@property (weak, nonatomic) IBOutlet UIImageView *m_pComment;
@property (weak, nonatomic) IBOutlet UIButton *m_btChoose;

@property(weak,nonatomic)id<chooseThisDelegate> delegate;

- (IBAction)chooseThisClicked:(id)sender;

-(void)setPic:(UIImage*) image;
-(void)setName:(NSString*)strName;
-(void)setAddress:(NSString*)strAddress;
-(void)setNumber:(NSString*)strNumber;
@end
