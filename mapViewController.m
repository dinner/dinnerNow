//
//  mapViewController.m
//  dinner
//
//  Created by Apple on 14-7-18.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "mapViewController.h"

@interface mapViewController ()

@end

@implementation mapViewController

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
    self.m_pView = [[BMKMapView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.m_pView.mapType = BMKMapTypeStandard;
    self.view = self.m_pView;
    self.m_pService = [[BMKLocationService alloc] init];
    //
    _routesearch = [[BMKRouteSearch alloc] init];
}

-(void)viewWillAppear:(BOOL)animated
{
 //   [super viewWillAppear:animated];
    [self.m_pView viewWillAppear];
    self.m_pView.delegate = self;
    self.m_pService.delegate = self;
    _routesearch.delegate =self;
    
    [self.m_pService startUserLocationService];
    self.m_pView.showsUserLocation = NO;
    self.m_pView.userTrackingMode = BMKUserTrackingModeFollow;
    self.m_pView.showsUserLocation = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
    [self.m_pView viewWillDisappear];
    self.m_pView.delegate = nil;
    self.m_pService.delegate = nil;
    _routesearch.delegate = self;
}

#pragma mark 用户方向更新后，会调用此函数
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [self.m_pView updateLocationData:userLocation];
    
    //物理地址
    BMKGeoCodeSearch *search = [[BMKGeoCodeSearch alloc]init];
    search.delegate=self;
    BMKReverseGeoCodeOption *rever = [[BMKReverseGeoCodeOption alloc]init];
    rever.reverseGeoPoint = userLocation.location.coordinate;
    NSLog(@"%d",[search reverseGeoCode:rever]);
    [self.m_pService stopUserLocationService];
}
#pragma mark 用户位置更新后，会调用此函数
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    [self.m_pView updateLocationData:userLocation];
}

#pragma mark 
-(void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
 //   NSLog(@"%@",result.address);
    self.strStartAddress = result.address;
    //路线显示
    [self showRouter];
}
//显示路线
-(void)showRouter
{
    BMKPlanNode* start = [[BMKPlanNode alloc]init];
	start.name = self.strStartAddress;
	BMKPlanNode* end = [[BMKPlanNode alloc]init];
	end.name = self.strEndAddress;
    NSLog(@"%@",self.strStartAddress);
    NSLog(@"%@",self.strEndAddress);
    
    BMKTransitRoutePlanOption *transitRouteSearchOption = [[BMKTransitRoutePlanOption alloc]init];
    transitRouteSearchOption.city= @"成都市";
    transitRouteSearchOption.from = start;
    transitRouteSearchOption.to = end;
    BOOL flag = [_routesearch transitSearch:transitRouteSearchOption];
    if (flag) {
        NSLog(@"检索成功");
    }
    else{
        NSLog(@"检索失败");
    }
  //  [transitRouteSearchOption release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)onGetTransitRouteResult:(BMKRouteSearch*)searcher result:(BMKTransitRouteResult*)result errorCode:(BMKSearchErrorCode)error
{
    NSArray* array = [NSArray arrayWithArray:self.m_pView.annotations];
	[self.m_pView removeAnnotations:array];
	array = [NSArray arrayWithArray:self.m_pView.overlays];
	[self.m_pView removeOverlays:array];
    if (error == BMK_SEARCH_NO_ERROR) {
		BMKTransitRouteLine* plan = (BMKTransitRouteLine*)[result.routes objectAtIndex:0];
        // 计算路线方案中的路段数目
		int size = [plan.steps count];
		int planPointCounts = 0;
		for (int i = 0; i < size; i++) {
            BMKTransitStep* transitStep = [plan.steps objectAtIndex:i];
            if(i==0){
                RouteAnnotation* item = [[RouteAnnotation alloc]init];
                item.coordinate = plan.starting.location;
                item.title = @"起点";
                item.type = 0;
                [self.m_pView addAnnotation:item]; // 添加起点标注
           //     [item release];
                
            }else if(i==size-1){
                RouteAnnotation* item = [[RouteAnnotation alloc]init];
                item.coordinate = plan.terminal.location;
                item.title = @"终点";
                item.type = 1;
                [self.m_pView addAnnotation:item]; // 添加起点标注
           //     [item release];
            }
            RouteAnnotation* item = [[RouteAnnotation alloc]init];
            item.coordinate = transitStep.entrace.location;
            item.title = transitStep.instruction;
            item.type = 3;
            [self.m_pView addAnnotation:item];
           // [item release];
            
            //轨迹点总数累计
            planPointCounts += transitStep.pointsCount;
        }
        
        //轨迹点
        BMKMapPoint * temppoints = new BMKMapPoint[planPointCounts];
        int i = 0;
        for (int j = 0; j < size; j++) {
            BMKTransitStep* transitStep = [plan.steps objectAtIndex:j];
            int k=0;
            for(k=0;k<transitStep.pointsCount;k++) {
                temppoints[i].x = transitStep.points[k].x;
                temppoints[i].y = transitStep.points[k].y;
                i++;
            }
            
        }
        // 通过points构建BMKPolyline
		BMKPolyline* polyLine = [BMKPolyline polylineWithPoints:temppoints count:planPointCounts];
		[self.m_pView addOverlay:polyLine]; // 添加路线overlay
		delete []temppoints;
	}

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
