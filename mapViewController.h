//
//  mapViewController.h
//  dinner
//
//  Created by Apple on 14-7-18.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMKGeocodeSearch.h"
#import "BMKMapView.h"
#import "BMKLocationService.h"
#import "BMapKit.h"

@interface RouteAnnotation : BMKPointAnnotation
{
	int _type; ///<0:起点 1：终点 2：公交 3：地铁 4:驾乘 5:途经点
	int _degree;
}

@property (nonatomic) int type;
@property (nonatomic) int degree;
@end
@implementation RouteAnnotation

@synthesize type = _type;
@synthesize degree = _degree;
@end

@interface mapViewController : UIViewController<BMKGeoCodeSearchDelegate,BMKLocationServiceDelegate,BMKMapViewDelegate,BMKRouteSearchDelegate>{
    BMKRouteSearch* _routesearch;
}

@property(nonatomic,retain) BMKGeoCodeSearch* m_pSearch;
@property(nonatomic,retain) BMKMapView * m_pView;
@property(nonatomic,retain) BMKLocationService* m_pService;
@property(nonatomic,retain)NSString* strStartAddress;
@property(nonatomic,retain)NSString* strEndAddress;


-(void)initDW;
@end
