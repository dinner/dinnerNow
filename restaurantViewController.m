//
//  restaurantViewController.m
//  dinner
//
//  Created by Apple on 14-7-10.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

/*
 
 餐馆列表viewcontorller
*/

#define cellHeight 99.0f

#import "restaurantViewController.h"
#import "restaurantCell.h"
#import "detailOfRes.h"
#import "detailOfRestaurant.h"

@interface restaurantViewController ()
{
    CGRect screenRect;//屏幕的rect
    NSMutableArray* m_pArrayRestaurant;
    
    NSMutableArray* m_pArrayName;
    NSMutableArray* m_pArrayAddr;
    NSMutableArray* m_pArrayNumber;
    NSMutableArray* m_pArrayPic;
    
    int startNum;
    int count;
    float fLongitude;//精度
    float fLatitude;//纬度
}
@end

@implementation restaurantViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initData];
    [self initThekj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
//初始化数据
-(void)initData{
    UIImage* image = [UIImage imageNamed:@"hotel.png"];
    m_pArrayPic = [[NSMutableArray alloc] initWithObjects:image, nil];
    m_pArrayNumber = [[NSMutableArray alloc] initWithObjects:@"028-8888888",@"33333",@"344444",@"5555555",@"666666",@"777777",@"888800",@"9999999", nil];
    m_pArrayAddr = [[NSMutableArray alloc] initWithObjects:@"科华北路",@"贝森东路",@"双华桥",@"天府广场",@"桐梓林",@"高新",@"世纪城",@"骡马市", nil];
    m_pArrayName = [[NSMutableArray alloc] initWithObjects:@"希尔顿酒店",@"新华客栈",@"布依客栈",@"烧鸡公",@"烧鹅饭",@"红尘客栈",@"沱牌酒店",@"沙湾酒店", nil];
    startNum = 0;
    fLongitude = 121.0f;
    fLatitude = 121.0f;
}

//初始化控件
-(void)initThekj{
    screenRect = [UIScreen mainScreen].applicationFrame;
    UITableView* pTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    pTable.delegate = self;
    pTable.dataSource = self;
    [self.view addSubview:pTable];
    //
    [self sendInfo];
}
#pragma mark datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [m_pArrayAddr count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* strCell = @"restCell";
    [tableView registerNib:[UINib nibWithNibName:@"restaurantCell" bundle:nil] forCellReuseIdentifier:strCell];
    restaurantCell* pCell = (restaurantCell*)[tableView dequeueReusableCellWithIdentifier:strCell];
    pCell.delegate = self;
    
    [pCell setNumber:[m_pArrayNumber objectAtIndex:[indexPath row]]];
    [pCell setName:[m_pArrayName objectAtIndex:[indexPath row]]];
    [pCell setAddress:[m_pArrayAddr objectAtIndex:[indexPath row]]];
    [pCell setPic:[UIImage imageNamed:@"hotel.png"]];
    return pCell;
}
//设置高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}
//点击事件   查看饭店详情
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    restaurantCell* cell = (restaurantCell*)[tableView cellForRowAtIndexPath:indexPath];
    detailsInfos info;
    info.strName = cell.m_pName.text;
    info.strTel = cell.m_pNumber.text;
    info.strAddress = cell.m_pAddress.text;
    detailOfRestaurant* viewDetails = [[detailOfRestaurant alloc] initWithStyle:UITableViewStyleGrouped];
    [viewDetails setInfo:info];
    
    [self.navigationController pushViewController:viewDetails animated:YES];
//    [self.oDelegate setTheAddress:strHotel];
//    [self.navigationController popViewControllerAnimated:YES];//退出
}

//发送请求
-(void)sendInfo
{
    NSString* strUrl = @"http://www.globalhexi.com/hexishop/android/bus!list.action?callback=?";//请求url
    NSURL* pUrl = [NSURL URLWithString:strUrl];
    NSString* strPost = [NSString stringWithFormat:@"startNum=%@&count=%@&location=%@,%@&city=%@&tag=%@&r_i=%@",[NSString stringWithFormat:@"%d",startNum],[NSString stringWithFormat:@"%d",count],[NSString stringWithFormat:@"%f",fLongitude],[NSString stringWithFormat:@"%f",fLatitude],@"成都",@"",@"5"];
    NSData* postData = [strPost dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* pRequest = [[NSMutableURLRequest alloc] initWithURL:pUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [pRequest setValue:[NSString stringWithFormat:@"%u",[postData length]] forHTTPHeaderField:@"Content-Length"];
    [pRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [pRequest setHTTPMethod:@"POST"];
    [pRequest setHTTPBody:postData];
    [NSURLConnection connectionWithRequest:pRequest delegate:self];
}
#pragma mark urlConnection
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)aResponse{
    NSLog(@"请求成功！");
}
//接收到数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"didFailWithError");
}
//连接失败
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
}
#pragma mark chooseThis delegate
-(void)choose:(NSString *)str{
    [self.oDelegate setTheAddress:str];
    [self.navigationController popViewControllerAnimated:YES];//退出
}

@end
