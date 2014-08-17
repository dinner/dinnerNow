//
//  settingViewController.m
//  dinner
//
//  Created by Apple on 14-7-16.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "settingViewController.h"

@interface settingViewController ()

@end

@implementation settingViewController

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
    [self addTable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//添加table
-(void)addTable
{
    self.m_pTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:self.m_pTable];
    UITableView* pTable = self.m_pTable;
    pTable.delegate = self;
    pTable.dataSource = self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if(section == 1){
        return 3;
    }
    else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString* strCell = @"cell";
        UITableViewCell* pCell = [tableView dequeueReusableCellWithIdentifier:strCell];
        if (!pCell) {
            pCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
            return pCell;
        }
    }
    if (indexPath.section == 1) {
        static NSString* strCell = @"cell";
        UITableViewCell* pCell = [tableView dequeueReusableCellWithIdentifier:strCell];
        if (!pCell) {
            pCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
            switch (indexPath.row) {
                case 0:
                {
                    pCell.imageView.image = [UIImage imageNamed:@"sina.png"];
                    pCell.textLabel.text = @"新浪微博";
                    pCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    break;
                }
                case 1:{
                    pCell.imageView.image = [UIImage imageNamed:@"tencent.png"];
                    pCell.textLabel.text = @"腾讯微博";
                    pCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    break;
                }
                case 2:{
                    pCell.imageView.image = [UIImage imageNamed:@"renren.png"];
                    pCell.textLabel.text = @"人人网";
                    pCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    break;
                }
                  
            }
        }
        return pCell;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

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
