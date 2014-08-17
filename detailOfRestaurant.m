//
//  detailOfRestaurant.m
//  dinner
//
//  Created by Apple on 14-7-15.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "detailOfRestaurant.h"
#import "restaurantCell.h"
#import "mapViewController.h"

@interface detailOfRestaurant ()
{
    detailsInfos resInfo;
}
@end

@implementation detailOfRestaurant

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if(section == 1){
        return 1;
    }
    else if(section == 2){
        return 2;
    }
    else{
        return 0;
    }
}
//设置高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100.0f;
    }
    else if(indexPath.section == 1){
        return 44.0f;
    }
    else if(indexPath.section == 2){
        return 44.0f;
    }
    return 0.0f;
}
//section header高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 22.0f;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString* cellIdenty = @"restCell";
        [tableView registerNib:[UINib nibWithNibName:@"restaurantCell" bundle:nil] forCellReuseIdentifier:cellIdenty];
        restaurantCell* pCell = (restaurantCell*)[tableView dequeueReusableCellWithIdentifier:cellIdenty];
        [pCell setPic:[UIImage imageNamed:@"hotel.png"]];
        [pCell setName:resInfo.strName];
        [pCell setNumber:resInfo.strTel];
        return pCell;
    }
    else if(indexPath.section == 1){
        static NSString* strIdenty = @"cell";
        UITableViewCell* pCell = [tableView dequeueReusableCellWithIdentifier:strIdenty];
        if(!pCell){
            pCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strIdenty];
            pCell.imageView.image = [UIImage imageNamed:@"address.png"];
            pCell.textLabel.text = resInfo.strAddress;
            pCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return pCell;
    }
    else if(indexPath.section == 2){
        static NSString* strIdenty = @"cell";
        UITableViewCell* pCell = [tableView dequeueReusableCellWithIdentifier:strIdenty];
        if(!pCell){
            pCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strIdenty];
            pCell.imageView.image = [UIImage imageNamed:@"head.png"];
            if (indexPath.row == 0) {
                pCell.textLabel.text = @"完成的约会";
            }
            else{
                pCell.textLabel.text = @"正在进行的约会";
            }
            pCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return pCell;
    }
    return nil;
}

//点击事件   查看饭店详情
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        mapViewController* pView = [[mapViewController alloc] init];
        UITableViewCell* pCell = [tableView cellForRowAtIndexPath:indexPath];
        NSString* strEnd = pCell.textLabel.text;
        [pView setStrEndAddress:strEnd];
        [self.navigationController pushViewController:pView animated:YES];
    }
}

-(void)setInfo:(detailsInfos)info{
    resInfo.strName = info.strName;
    resInfo.strTel = info.strTel;
    resInfo.strAddress = info.strAddress;
    [self.tableView reloadData];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
