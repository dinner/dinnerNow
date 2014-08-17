//
//  locationCity.h
//  dinner
//
//  Created by Apple on 14-5-24.
//  Copyright (c) 2014年 张 凌翔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>
#import <CoreLocation/CLLocationManager.h>
#import <MapKit/MKReverseGeocoder.h>
#import <MapKit/MKPlacemark.h>

@interface locationCity : NSObject<CLLocationManagerDelegate,MKReverseGeocoderDelegate>

@property(retain,nonatomic)NSString* m_strCity;
//开启定位
-(void)startLocation;
@end
