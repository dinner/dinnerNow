//
//  detailInfo.m
//  dinner
//
//  Created by Apple on 14-6-23.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#define commentStartY 300
#define commentHeigth 50

#import "detailInfo.h"
#import "SVProgressHUD.h"

@interface detailInfo ()
{
    int m_comment;
}

@end

@implementation detailInfo

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
    m_comment = 0;
}
//
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [SVProgressHUD showSuccessWithStatus:@"加载完成"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
//设置详情信息
-(void)setDetailsInfo:(infoStruct*)cellInfo photo:(UIImage *)imgPhoto
{

    //添加title
    UIView* pViewTitle = [[UIView alloc] init];
    pViewTitle.frame = CGRectMake(0, 64, 320.0f, 30);
    pViewTitle.backgroundColor = [UIColor colorWithRed:190/255.0 green:234/255.0 blue:252/255.0 alpha:1];
    //
    UILabel* pLabelTitile = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 80, 30)];
    [pLabelTitile setFont:[UIFont fontWithName:@"Helvetica-BoldOblique" size:17]];
    UIImageView* pAppre = [[UIImageView alloc] initWithFrame:CGRectMake(233, 0, 16, 16)];
    pAppre.image = [UIImage imageNamed:@"grade.png"];
    UILabel* pLabelGrade = [[UILabel alloc]initWithFrame:CGRectMake(260, 0, 320, 30)];
    pLabelGrade.textColor = [UIColor redColor];
    
    [pViewTitle addSubview:pLabelTitile];
    [pViewTitle addSubview:pAppre];
    [pViewTitle addSubview:pLabelGrade];
    [self.view addSubview:pViewTitle];
    
    //设置数据
    pLabelTitile.text = cellInfo.strTitle;
    pLabelGrade.text = cellInfo.strGrade;
    self.m_pName.text = cellInfo.strName;
    self.m_pAge.text = cellInfo.strAge;
    self.m_pPay.text = cellInfo.strType;
    self.m_pTime.text = cellInfo.strTime;
    self.m_pAddress.text = cellInfo.strAddress;
    self.m_pPeaple.text = cellInfo.strType;
    self.m_pSign.text = cellInfo.stryy;
    self.m_pComment.text = cellInfo.strComment;
    self.m_pPhoto.image = imgPhoto;
    //
    for (int i = 0; i < 5; i++) {
        [self addComment:@"王二" content:@"你真是个美女哦" time:@"6月10日 14:00"];
    }
}
//添加评论
-(void)addComment:(NSString*)strName content:(NSString*)strContent time:(NSString*)strTime
{
    UIView* pViewComment = [[UIView alloc]init];
    CGRect rectComment = CGRectMake(10,commentStartY+m_comment*commentHeigth,300,50);
    pViewComment.frame = rectComment;
    //pic
    UIImageView* pImgPhoto = [[UIImageView alloc] init];
    UILabel* pLabelName = [[UILabel alloc] init];
    UILabel* pLabelTime = [[UILabel alloc] init];
    UILabel* pLabelContent = [[UILabel alloc] init];
    int nPhoto = rand()%2;
    NSString* strImg = nil;
    switch (nPhoto) {
        case 0:
        {
        strImg = @"photo1.png";
        }
        break;
        case 1:
        {
        strImg = @"photo2.png";
        }
        break;
        case 2:
        break;
        case 3:
        break;
        default:
        break;
    }
    pImgPhoto.image = [UIImage imageNamed:strImg];
    pLabelName.text = strName;
    pLabelContent.text = strContent;
    pLabelTime.text = strTime;
    pImgPhoto.frame = CGRectMake(5, 10, 30, 30);
    pLabelName.frame = CGRectMake(55, 10, 100, 15);
    pLabelTime.frame = CGRectMake(230, 10, 100, 20);
    pLabelContent.frame = CGRectMake(55, 30, 200, 20);
    //
    [pLabelName setFont:[UIFont fontWithName:@"Helvetica-BoldOblique" size:14]];
    [pLabelTime setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [pLabelContent setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    pLabelTime.textColor = [UIColor grayColor];
    pLabelContent.textColor = [UIColor grayColor];
    [pViewComment addSubview:pImgPhoto];
    [pViewComment addSubview:pLabelName];
    [pViewComment addSubview:pLabelTime];
    [pViewComment addSubview:pLabelContent];
    [self.view addSubview:pViewComment];
    //画线
    UIView* pView= [[UIView alloc] init];
    pView.frame = CGRectMake(10, 298, 300, 1);
    pView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:pView];
    
    m_comment++;//评论记数自加
}


@end
