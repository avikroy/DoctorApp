//
//  MapViewController.h
//
//  Created by sugartin.info on 2/7/10.
//  Copyright 2010 http://www.sugartin.info. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Place.h"
#import "PlaceMark.h"

@interface MapView : UIView<MKMapViewDelegate> {

	MKMapView* mapView;
	UIImageView* routeView;
	
	NSArray* routes;
	
	UIColor* lineColor;
    
    MKPolyline* _routeLine;
    MKPolylineView* _routeLineView;
    MKMapRect _routeRect;

    
}

@property (nonatomic, retain) UIColor* lineColor;
@property(nonatomic,retain)NSString *latitude1,*longitude1,*latitude2,*longitude2;
@property (nonatomic, retain) MKPolyline* routeLine;
@property (nonatomic, retain) MKPolylineView* routeLineView;

-(void) showRouteFrom: (Place*) f to:(Place*) t;
- (id) initWithFrame:(CGRect) frame :lati1 :longi1:lati2:longi2;
-(void) loadRoute;
-(void) zoomInOnRoute;

@end
