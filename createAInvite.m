//
//  createAInvite.m
//  dinner
//
//  Created by Apple on 14-6-26.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#define cellHeight 44

#import "createAInvite.h"
#import "dateActionSheet.h"
#import "detailInfo.h"

@interface createAInvite ()
{
    UILabel* pGirl;
    UILabel* pBoy;
    UILabel* pEither;
    
    UILabel* pAA;
    UILabel* pIpay;
    
    UILabel* pTime;//吃饭时间
    UILabel* pAddress;//吃饭地点
    UIImageView* timexlPic;//时间下拉图标
    //屏幕宽度
    int screenWidth;
    dateActionSheet* pActionSheet;//actionsheet
    UITextField* textFiled;//主题textfiled
    //
    UIButton* btGril;
    UIButton* btBoy;
    UIButton* btEither;
    //
    UIButton* btAA;
    UIButton* btIPay;
    
    NSString* strTitle;
    NSString* strType;
    NSString* strTime;
    NSString* strAddress;
    NSString* strPeople;
}
@end

@implementation createAInvite

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
    //初始化tableview
    self.m_pTable = [[UITableView alloc] init];
    CGRect rectTable = CGRectMake(0,0, 320, self.view.frame.size.height);
    self.m_pTable = [[UITableView alloc]initWithFrame:rectTable style:UITableViewStyleGrouped];
    self.m_pTable.delegate = self;
    self.m_pTable.dataSource = self;
    [self.view addSubview:self.m_pTable];
    //添加按钮
    self.m_btCreate = [[UIButton alloc] init];
    [self.m_btCreate setTitle:@"创建" forState:UIControlStateNormal];
    CGRect btRect = CGRectMake(20, self.view.frame.size.height-60, self.view.frame.size.width-40, 45);
    self.m_btCreate.frame = btRect;
    [self.view addSubview:self.m_btCreate];
    UIColor * pColor = [UIColor colorWithRed:255/255.0f green:153/255.0f blue:51/255.0f alpha:1.0];
    [self.m_btCreate.layer setMasksToBounds:YES];
    [self.m_btCreate.layer setCornerRadius:5.0f];
    [self.m_btCreate.layer setBorderWidth:1.0f];
    [self.m_btCreate.layer setBorderColor:(__bridge CGColorRef)(pColor)];
    self.m_btCreate.backgroundColor = pColor;
    [self.m_btCreate setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.m_btCreate addTarget:self action:@selector(createNew) forControlEvents:UIControlEventTouchUpInside];
    //
    CGRect rectScreen = [UIScreen mainScreen].applicationFrame;
    screenWidth = rectScreen.size.width;//屏幕宽度
    pActionSheet = [[dateActionSheet alloc]init];
}
//创建新的邀请
-(void)createNew
{
    [self.navigationController popViewControllerAnimated:YES];
    infoStruct* info = [[infoStruct alloc] init];
    [info initWithInfo:textFiled.text type:strType time:pTime.text add:pAddress.text people:strPeople];
    
    [self.delegate createNew:info];//设置信息
}
//初始化一些数据
-(void)initTheData
{
    strPeople = [[NSString alloc] init];
    strTitle = [[NSString alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark tabledatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0://主题
        {
            return 1;
        }
            break;
        case 1:{//约会对象
            return 1;
        }
            break;
        case 2:{//详情
            return 3;
        }
            break;
    }
    return 0;
}
//section header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	if (tableView == self.m_pTable)
	{
		if (section == 0)
		{
			return @"主题";
		}
		else if (section == 1)
		{
			return @"约会对象";
		}
		else if(section == 2)
		{
			return @"详情";
		}
        else if(section == 3){
            return @"地点";
        }
	}
	else
	{
		return nil;
	}
    return nil;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if(indexPath.section == 0)//主题  设置编辑框
        {
            [self addTheme:cell indexPath:indexPath];
        }
        else if(indexPath.section == 1)//约会对象
        {
            [self addAppointMentObject:cell];
        }
        else if(indexPath.section == 2)//约会详情
        {
            [self addAppointMentDetail:cell indexPath:indexPath];
        }
    }
    return cell;
}

#pragma mark
//添加主题
-(void)addTheme:(UITableViewCell*)cell indexPath:(NSIndexPath*)indexPath
{
    CGRect textRect = CGRectMake(-15, 0, screenWidth, cellHeight);
    textFiled = [[UITextField alloc] initWithFrame:textRect];
    textFiled.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textFiled.returnKeyType = UIReturnKeyDone;
    textFiled.borderStyle = UITextBorderStyleNone;
    textFiled.secureTextEntry = NO;
 //   textFiled.clearButtonMode = YES;
    textFiled.tag = [indexPath row];
    textFiled.delegate = self;
    //
    [textFiled addTarget:self action:@selector(textClicked:) forControlEvents:UIControlEventEditingChanged];
    textFiled.placeholder = @"请输入主题";
    cell.accessoryView = textFiled;
}

//添加appartmentObject
-(void)addAppointMentObject:(UITableViewCell*)cell
{
    UIView* pViewObject = [[UIView alloc] init];//主view
    CGRect viewRect = CGRectMake(0, 0, screenWidth, cellHeight);
    CGRect girlRect = CGRectMake(25, 0, 30, cellHeight);
    CGRect bodyRect = CGRectMake(150, 0, 30, cellHeight);
    CGRect eitherRect = CGRectMake(260, 0, 60, cellHeight);
    CGRect girlGou = CGRectMake(55, 14, 16, 16);
    CGRect boyGou = CGRectMake(180, 14, 16, 16);
    CGRect eitherGou = CGRectMake(320, 14, 16, 16);
    btGril = [[UIButton alloc] initWithFrame:girlGou];
    btBoy = [[UIButton alloc] initWithFrame:boyGou];
    btEither = [[UIButton alloc] initWithFrame:eitherGou];
    UIImage* imgGou = [UIImage imageNamed:@"gou.png"];
    //按钮背景图
    [btGril setBackgroundImage:[UIImage imageNamed:@"gou.png"] forState:UIControlStateNormal];
    [btBoy setBackgroundImage:imgGou forState:UIControlStateNormal];
    [btEither setBackgroundImage:imgGou forState:UIControlStateNormal];
    btBoy.hidden = YES;
    btEither.hidden = YES;
    pViewObject.frame = viewRect;
    pGirl = [[UILabel alloc] initWithFrame:girlRect];
    pBoy = [[UILabel alloc] initWithFrame:bodyRect];
    pEither = [[UILabel alloc] initWithFrame:eitherRect];
    //添加事件
    UITapGestureRecognizer* pGirlEvent = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(girlClicked:)];
    UITapGestureRecognizer* pBoyEvent = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boyClicked:)];
    UITapGestureRecognizer* pEitherEvent = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(eitherClicked:)];
    pGirl.userInteractionEnabled = YES;
    [pGirl addGestureRecognizer:pGirlEvent];
    pBoy.userInteractionEnabled = YES;
    [pBoy addGestureRecognizer:pBoyEvent];
    pEither.userInteractionEnabled = YES;
    [pEither addGestureRecognizer:pEitherEvent];
    //设置字体
    pGirl.font = [UIFont fontWithName:@"Arial" size:16];
    pBoy.font = [UIFont fontWithName:@"Arial" size:16];
    pEither.font = [UIFont fontWithName:@"Arial" size:16];
    pGirl.text = @"女";
    pBoy.text = @"男";
    pEither.text = @"任意";
    [pViewObject addSubview:pGirl];
    [pViewObject addSubview:pBoy];
    [pViewObject addSubview:pEither];
    [pViewObject addSubview:btGril];
    [pViewObject addSubview:btBoy];
    [pViewObject addSubview:btEither];
    cell.accessoryView = pViewObject;
}
//添加约会详情
-(void)addAppointMentDetail:(UITableViewCell*)cell indexPath:(NSIndexPath*)indexPath
{
    switch (indexPath.row) {
        case 0:{
            UIView* pMainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, cellHeight)];
            UILabel* pLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 50, cellHeight)];
            pLabel.text = @"付费";
            pAA = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 50, cellHeight)];
            pIpay = [[UILabel alloc] initWithFrame:CGRectMake(240, 0, 80, cellHeight)];
            pAA.text = @"AA";
            pIpay.text = @"我付钱";
            [pAA setFont:[UIFont fontWithName:@"ArialMT" size:13]];
            [pIpay setFont:[UIFont fontWithName:@"ArialMT" size:13]];
            pAA.textColor = [UIColor grayColor];
            pIpay.textColor = [UIColor grayColor];
            UITapGestureRecognizer* pGesAA = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelAAClicked:)];
            pAA.userInteractionEnabled = YES;
            [pAA addGestureRecognizer:pGesAA];
            UITapGestureRecognizer* pGesIPay = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelIpayClicked:)];
            pIpay.userInteractionEnabled = YES;
            [pIpay addGestureRecognizer:pGesIPay];
            btAA = [[UIButton alloc] initWithFrame:CGRectMake(150, 14, 16, 16)];
            btIPay = [[UIButton alloc] initWithFrame:CGRectMake(320, 14, 16, 16)];
            UIImage* img = [UIImage imageNamed:@"gou.png"];
            [btAA setBackgroundImage:img forState:UIControlStateNormal];
            [btIPay setBackgroundImage:img forState:UIControlStateNormal];
            btAA.hidden = YES;
            btIPay.hidden = YES;
            [pMainView addSubview:pLabel];
            [pMainView addSubview:pAA];
            [pMainView addSubview:pIpay];
            [pMainView addSubview:btAA];
            [pMainView addSubview:btIPay];
            cell.accessoryView = pMainView;
        }
            break;
        case 1:{
            UIView* pMainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, cellHeight)];
            UILabel* pLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 50, cellHeight)];
            pLabel.text = @"时间";
            pTime = [[UILabel alloc] initWithFrame:CGRectMake(150, 0, screenWidth - 70, cellHeight)];
            pTime.textColor = [UIColor grayColor];
            UITapGestureRecognizer* pTimeGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(timeClicked:)];
            pTime.userInteractionEnabled = YES;
            [pTime addGestureRecognizer:pTimeGes];
            timexlPic = [[UIImageView alloc] init];
            timexlPic.frame = CGRectMake(screenWidth - 82,cellHeight-16, 16, 16);
            timexlPic.image = [UIImage imageNamed:@"pulldown.png"];
            [pMainView addSubview:pLabel];
            [pMainView addSubview:pTime];
            cell.accessoryView = pMainView;
        }
            break;
        case 2:{
            UIView* pMainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, cellHeight)];
            UILabel* pLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 50, cellHeight)];
            pLabel.text = @"地点";
            pAddress = [[UILabel alloc] initWithFrame:CGRectMake(150, 0, screenWidth- 70, cellHeight)];
            pAddress.textColor = [UIColor grayColor];
            UITapGestureRecognizer* pAddressGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addressClicked)];
            pAddress.userInteractionEnabled = YES;
            [pAddress addGestureRecognizer:pAddressGes];
            [pMainView addSubview:pLabel];
            [pMainView addSubview:pAddress];
            cell.accessoryView = pMainView;
        }
            break;
    }
}


#pragma mark 主题点击
//主题点击
-(void)textClicked:(UITextField *)textField
{
    
}
//收起键盘
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (![textFiled isExclusiveTouch]) {
        [textFiled resignFirstResponder];
    }
}
#pragma mark 约会对象点击
-(void)addressClicked//地址点击
{
    restaurantViewController* pView = [[restaurantViewController alloc] init];
    pView.oDelegate = self;
    [self.navigationController pushViewController:pView animated:YES];
}
-(void)girlClicked:(UITapGestureRecognizer*)gesture
{
    pGirl.textColor = [UIColor blueColor];
    pBoy.textColor = [UIColor blackColor];
    pEither.textColor = [UIColor blackColor];
    btGril.hidden = NO;
    btBoy.hidden = YES;
    btEither.hidden = YES;
    
    strPeople = @"女";
}

-(void)boyClicked:(UITapGestureRecognizer*)gesture
{
    pGirl.textColor = [UIColor blackColor];
    pBoy.textColor = [UIColor blueColor];
    pEither.textColor = [UIColor blackColor];
    btGril.hidden = YES;
    btBoy.hidden = NO;
    btEither.hidden = YES;
    
    strPeople = @"男";
}

-(void)eitherClicked:(UITapGestureRecognizer*)gesture
{
    pGirl.textColor = [UIColor blackColor];
    pBoy.textColor = [UIColor blackColor];
    pEither.textColor = [UIColor blueColor];
    btGril.hidden = YES;
    btBoy.hidden = YES;
    btEither.hidden = NO;
    
    strPeople = @"不限";
}
//
-(void)labelAAClicked:(UITapGestureRecognizer*)gesture
{
    pAA.textColor = [UIColor blueColor];
    pIpay.textColor = [UIColor blackColor];
    btAA.hidden = NO;
    btIPay.hidden = YES;
    strType = @"我付钱";
}
-(void)labelIpayClicked:(UITapGestureRecognizer*)gesture
{
    pAA.textColor = [UIColor blackColor];
    pIpay.textColor = [UIColor blueColor];
    btAA.hidden = YES;
    btIPay.hidden = NO;
    strType = @"AA";
}

#pragma mark 时间点击
-(void)timeClicked:(UITapGestureRecognizer*)gesture
{
    CGRect rectOri = pActionSheet.bounds;
    int nScreenHeight = [UIScreen mainScreen].applicationFrame.size.height;
    int nScreenWidth = [UIScreen mainScreen].applicationFrame.size.width;
    pActionSheet.frame = CGRectMake(0, nScreenHeight - rectOri.size.height, nScreenWidth, rectOri.size.height);
    [pActionSheet showInView:self.view];//显示actionsheet
    pActionSheet.date_delegate = self;
    //视图上移
    [self viewUp];
}

//点击时间时视图上移
-(void)viewUp
{
    NSTimeInterval animateDuration = 0.3f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animateDuration];
    //
    self.view.frame = CGRectMake(0, -50, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}

#pragma mark dateDelegate
//点击完成视图下移
-(void)viewDown
{
    [UIView animateWithDuration:1.0f animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}
-(void)setDate:(NSString*)strTime
{
    pTime.text = strTime;
}

#pragma mark textFiledDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];//隐藏键盘
    NSLog(@"textFieldShouldReturn");//测试用
    return YES;
}
#pragma mark delegateAddress
-(void)setTheAddress:(NSString*)strHotel{
    pAddress.text = strHotel;//设置地点
}

@end
