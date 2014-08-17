//
//  mainTableController.m
//  dinner
//
//  Created by Apple on 14-7-7.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "mainTableController.h"
#import "detailInfo.h"
#import "mainTableCell.h"
#import "settingViewController.h"

@interface mainTableController ()
{
    NSMutableArray* m_pTableArray;
    BOOL m_bReloading;//是否读取
}
@end

@implementation mainTableController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
//
-(void)addHeader
{
    //添加刷新头
    float fOriginY = 0.0f - self.tableView.bounds.size.height;
    self.m_pView= [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, fOriginY, self.view.frame.size.width, self.tableView.bounds.size.height)];
    [self.tableView addSubview:self.m_pView];
    self.m_pView.delegate = self;
    //
    [self.m_pView refreshLastUpdatedDate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addHeader];
    [self createNavItem];
    [self initTheArray];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

//初始化数据
//初始化数组
-(void)initTheArray
{
    m_pTableArray = [[NSMutableArray alloc] init];
    infoStruct* st_info = [[infoStruct alloc] init];
    [st_info initWithInfo:@"找个好妹纸" grade:@"2" name:@"张三" age:@"22" type:@"我请客" time:@"2014-07-01 14:00" address:@"天府大道" condition:@"女" call:@"18380224286" comment:@"2" yy:@"3"];
    [m_pTableArray addObject:st_info];
}
//创建navitem
-(void)createNavItem
{
    UIBarButtonItem* pCreate = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createBtClicked)];
    pCreate.title = @"发布";
    
    UIBarButtonItem* pSetting = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(settingClicked)];
    pSetting.title = @"设置";
    
    self.navigationItem.rightBarButtonItem = pCreate;
    self.navigationItem.leftBarButtonItem = pSetting;
}
//创建新的信息
-(void)createBtClicked
{
    createAInvite* pMakeNew = [[createAInvite alloc] init];
    pMakeNew.delegate = self;
    [self.navigationController pushViewController:pMakeNew animated:YES];
}
-(void)settingClicked{
    settingViewController* pView = [[settingViewController alloc] init];
    [self.navigationController pushViewController:pView animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [m_pTableArray count];
}
//table信息设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* strCell = @"mainCell";
    [tableView registerNib:[UINib nibWithNibName:@"mainTableCell" bundle:nil] forCellReuseIdentifier:strCell];
    mainTableCell* pCell = (mainTableCell*)[tableView dequeueReusableCellWithIdentifier:strCell];
    //设置信息
    [pCell setInfo:[m_pTableArray objectAtIndex:[indexPath row]]];
    return pCell;
}
//高度设置
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150.0f;
}
//
-(void)createNew:(infoStruct*)st
{
    [m_pTableArray addObject:st];
    [self.tableView reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	[self.m_pView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//	[self.m_pView egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
}
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	return m_bReloading; // should return if data source model is reloading
}
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	return [NSDate date]; // should return date data source was last changed
}

- (void)reloadTableViewDataSource{
	m_bReloading = YES;
}
- (void)doneLoadingTableViewData{
	m_bReloading = NO;
	[self.m_pView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [m_pTableArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
