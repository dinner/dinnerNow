//
//  locationCity.m
//  dinner
//
//  Created by Apple on 14-5-24.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import "locationCity.h"


@implementation locationCity
//开启定位
-(void)startLocation
{
    if(![CLLocationManager locationServicesEnabled]||[CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        NSLog(@"您关闭了定位功能，若需要定位请开启定位功能");
    }
    else
    {
        CLLocationManager* pLocationManager = [[CLLocationManager alloc] init];
        pLocationManager.delegate = self;
        pLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
        pLocationManager.distanceFilter = 1000.0f;
        [pLocationManager startUpdatingLocation];
    }
}
#pragma mark CLLocationManager delegate
//定位成功调用
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocationCoordinate2D loc = [newLocation coordinate];
    //启动地理位置定位
    MKReverseGeocoder* geocoder = [[MKReverseGeocoder alloc] initWithCoordinate:loc];
    geocoder.delegate = self;
    [geocoder start];
}
//定位出错时被调用
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog([error description]);
}

#pragma mark CLLocationManager delegate
//定位成功
-(void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
    self.m_strCity = placemark.locality;
}
//定位失败
-(void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
{
    NSLog([error description]);
}

@end
