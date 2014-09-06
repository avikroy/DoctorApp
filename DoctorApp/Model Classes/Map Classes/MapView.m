//
//  MapViewController.m
//
//  Created by sugartin.info on 2/7/10.
//  Copyright 2010 http://www.sugartin.info. All rights reserved.
//

#import "MapView.h"

@interface MapView()

-(NSMutableArray *)decodePolyLine: (NSMutableString *)encoded;
-(void) updateRouteView;
-(NSArray*) calculateRoutesFrom:(CLLocationCoordinate2D) from to: (CLLocationCoordinate2D) to;
-(void) centerMap;

@end

@implementation MapView

@synthesize lineColor;
@synthesize latitude1,longitude1,latitude2,longitude2;
@synthesize routeLine = _routeLine;
@synthesize routeLineView = _routeLineView;

//URL to find the JSON direction from one place to other place
//http://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&sensor=false
- (id) initWithFrame:(CGRect) frame :lati1 :longi1:lati2:longi2
{
	self = [super initWithFrame:frame];
	if (self != nil) {
		if(mapView) {
			mapView.delegate=nil;
			[mapView release];
			mapView=nil;
		}
		mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
//		mapView.showsUserLocation = YES;
		[mapView setDelegate:self];
		[self addSubview:mapView];
		routeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, mapView.frame.size.width, mapView.frame.size.height)];
		routeView.userInteractionEnabled = NO;
		[mapView addSubview:routeView];
		NSLog(@"latimap1=%@,longimap1=%@",lati1,longi1);
        NSLog(@"latimap2=%@,longimap2=%@",lati2,longi2);
        self.latitude1=lati1;
        self.longitude1=longi1;
        self.latitude2=lati2;
        self.longitude2=longi2;
		//self.lineColor = [UIColor colorWithWhite:0.2 alpha:0.5];
        self.lineColor=[UIColor colorWithRed:0 green:0 blue:1 alpha:0.6];
	}
	return self;
}



-(NSMutableArray *)decodePolyLine: (NSMutableString *)encoded {
	[encoded replaceOccurrencesOfString:@"\\\\" withString:@"\\"
								options:NSLiteralSearch
								  range:NSMakeRange(0, [encoded length])];
	NSInteger len = [encoded length];
	NSInteger index = 0;
	NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
	NSInteger lat=0;
	NSInteger lng=0;
	while (index < len) {
		NSInteger b;
		NSInteger shift = 0;
		NSInteger result = 0;
		do {
			b = [encoded characterAtIndex:index++] - 63;
			result |= (b & 0x1f) << shift;
			shift += 5;
		} while (b >= 0x20);
		NSInteger dlat = ((result & 1) ? ~(result >> 1) : (result >> 1));
		lat += dlat;
		shift = 0;
		result = 0;
		do {
			b = [encoded characterAtIndex:index++] - 63;
			result |= (b & 0x1f) << shift;
			shift += 5;
		} while (b >= 0x20);
		NSInteger dlng = ((result & 1) ? ~(result >> 1) : (result >> 1));
		lng += dlng;
		NSNumber *latitude = [[[NSNumber alloc] initWithFloat:lat * 1e-5] autorelease];
		NSNumber *longitude = [[[NSNumber alloc] initWithFloat:lng * 1e-5] autorelease];
		//printf("[%f,", [latitude doubleValue]);
		//printf("%f]", [longitude doubleValue]);
		CLLocation *loc = [[[CLLocation alloc] initWithLatitude:[latitude floatValue] longitude:[longitude floatValue]] autorelease];
		[array addObject:loc];
	}
	
	return array;
}

-(NSArray*) calculateRoutesFrom:(CLLocationCoordinate2D) f to: (CLLocationCoordinate2D) t {
//	NSString* saddr = [NSString stringWithFormat:@"%f,%f", f.latitude, f.longitude];
//	NSString* daddr = [NSString stringWithFormat:@"%f,%f", t.latitude, t.longitude];
    
  //  NSString* saddr = [NSString stringWithFormat:@"%f,%f", 38.99357205820946, -97.99804687];
	//NSString* daddr = [NSString stringWithFormat:@"%f,%f", 38.685509760012, -94.339599609375];
    NSString* saddr = [NSString stringWithFormat:@"%@,%@",  self.latitude1,self.longitude1];
	NSString* daddr = [NSString stringWithFormat:@"%@,%@",  self.latitude2,self.longitude2];
   
	NSString* apiUrlStr = [NSString stringWithFormat:@"http://maps.google.com/maps?output=dragdir&saddr=%@&daddr=%@", saddr, daddr];
	NSURL* apiUrl = [NSURL URLWithString:apiUrlStr];
	//NSLog(@"api url: %@", apiUrl);
	NSString *apiResponse = [NSString stringWithContentsOfURL:apiUrl];
	NSString* encodedPoints = [apiResponse stringByMatching:@"points:\\\"([^\\\"]*)\\\"" capture:1L];
	
	return [self decodePolyLine:[encodedPoints mutableCopy]];
    //return [self decodePolyLine:[apiResponse mutableCopy]];
}

-(void) centerMap {
	if(routes.count==0) return;
	MKCoordinateRegion region;

	CLLocationDegrees maxLat = -90;
	CLLocationDegrees maxLon = -180;
	CLLocationDegrees minLat = 90;
	CLLocationDegrees minLon = 180;
	for(int idx = 0; idx < routes.count; idx++)
	{
		CLLocation* currentLocation = [routes objectAtIndex:idx];
		if(currentLocation.coordinate.latitude > maxLat)
			maxLat = currentLocation.coordinate.latitude;
		if(currentLocation.coordinate.latitude < minLat)
			minLat = currentLocation.coordinate.latitude;
		if(currentLocation.coordinate.longitude > maxLon)
			maxLon = currentLocation.coordinate.longitude;
		if(currentLocation.coordinate.longitude < minLon)
			minLon = currentLocation.coordinate.longitude;
	}
	region.center.latitude     = (maxLat + minLat) / 2;
	region.center.longitude    = (maxLon + minLon) / 2;
	region.span.latitudeDelta  = maxLat - minLat;
	region.span.longitudeDelta = maxLon - minLon;
	
	[mapView setRegion:region animated:YES];
}

-(void) showRouteFrom: (Place*) f to:(Place*) t {
	
	if(routes) {
		[mapView removeAnnotations:[mapView annotations]];
		[routes release];
	}
	
	PlaceMark* from = [[[PlaceMark alloc] initWithPlace:f] autorelease];
	PlaceMark* to = [[[PlaceMark alloc] initWithPlace:t] autorelease];
	
	[mapView addAnnotation:from];
	[mapView addAnnotation:to];
	
	routes = [[self calculateRoutesFrom:from.coordinate to:to.coordinate] retain];
	
//	[self updateRouteView];
//	[self centerMap];
    [self loadRoute];
    if (nil != self.routeLine) {
		[mapView addOverlay:self.routeLine];
	}
    else
    {
    [[[[UIAlertView alloc] initWithTitle:@"Message" message:@"Path is not possible for these locations" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease] show];
	}
    [self zoomInOnRoute];
}

-(void) loadRoute
{
	
	NSArray* pointStrings = routes;
	
	
	// while we create the route points, we will also be calculating the bounding box of our route
	// so we can easily zoom in on it. 
	MKMapPoint northEastPoint; 
	MKMapPoint southWestPoint; 
	
	// create a c array of points. 
	MKMapPoint* pointArr = malloc(sizeof(CLLocationCoordinate2D) * pointStrings.count);
	
	for(int idx = 0; idx < pointStrings.count; idx++)
	{
		// break the string down even further to latitude and longitude fields. 
		CLLocation *aLocation=[pointStrings objectAtIndex:idx];
        
//		CLLocationDegrees latitude  = [[latLonArr objectAtIndex:0] doubleValue];
//		CLLocationDegrees longitude = [[latLonArr objectAtIndex:1] doubleValue];
        
        
		// create our coordinate and add it to the correct spot in the array 
		CLLocationCoordinate2D coordinate = [aLocation coordinate];
        
		MKMapPoint point = MKMapPointForCoordinate(coordinate);
        
		
		//
		// adjust the bounding box
		//
		
		// if it is the first point, just use them, since we have nothing to compare to yet. 
		if (idx == 0) {
			northEastPoint = point;
			southWestPoint = point;
		}
		else 
		{
			if (point.x > northEastPoint.x) 
				northEastPoint.x = point.x;
			if(point.y > northEastPoint.y)
				northEastPoint.y = point.y;
			if (point.x < southWestPoint.x) 
				southWestPoint.x = point.x;
			if (point.y < southWestPoint.y) 
				southWestPoint.y = point.y;
		}
        
		pointArr[idx] = point;
        
	}
	
	// create the polyline based on the array of points. 
	self.routeLine = [MKPolyline polylineWithPoints:pointArr count:pointStrings.count];
    
	_routeRect = MKMapRectMake(southWestPoint.x, southWestPoint.y, northEastPoint.x - southWestPoint.x, northEastPoint.y - southWestPoint.y);
    
	// clear the memory allocated earlier for the points
	free(pointArr);
	
}


-(void) updateRouteView {
	
	if (routes.count==0)
    {
         [[[[UIAlertView alloc] initWithTitle:@"Message" message:@"Path is not possible for these locations" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease] show];
        routeView.image=nil;
		return;
	}
	
	CGContextRef context = 	CGBitmapContextCreate(nil, 
												  routeView.frame.size.width, 
												  routeView.frame.size.height, 
												  8, 
												  4 * routeView.frame.size.width,
												  CGColorSpaceCreateDeviceRGB(),
												  kCGImageAlphaPremultipliedLast);
	
	CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
	CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 0.6);
	CGContextSetLineWidth(context, 10.0);
	
	for(int i = 0; i < routes.count; i++) {
		CLLocation* location = [routes objectAtIndex:i];
		CGPoint point = [mapView convertCoordinate:location.coordinate toPointToView:routeView];
		
		if(i == 0) {
			CGContextMoveToPoint(context, point.x, routeView.frame.size.height - point.y);
		} else {
			CGContextAddLineToPoint(context, point.x, routeView.frame.size.height - point.y);
		}
	}
	
	CGContextStrokePath(context);
	
	CGImageRef image = CGBitmapContextCreateImage(context);
	UIImage* img = [UIImage imageWithCGImage:image];
	
	routeView.image = img;
	CGContextRelease(context);

}

#pragma mark mapView delegate functions
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
	routeView.hidden = YES;
}

//- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
//{
//	[self updateRouteView];
//	routeView.hidden = NO;
//	[routeView setNeedsDisplay];
//}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView *dropPin=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"venues"];
    
//    UIButton *disclosureButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//    [disclosureButton addTarget:self action:@selector(mapCallOutPressed:) forControlEvents:UIControlEventTouchUpInside];
//    
//    dropPin.rightCalloutAccessoryView = disclosureButton;
    dropPin.animatesDrop = YES;
    dropPin.canShowCallout = YES;
    
    return dropPin;
}
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
	MKOverlayView* overlayView = nil;
	
	if(overlay == self.routeLine)
	{
		//if we have not yet created an overlay view for this overlay, create it now. 
		if(nil == self.routeLineView)
		{
			self.routeLineView = [[[MKPolylineView alloc] initWithPolyline:self.routeLine] autorelease];
			self.routeLineView.fillColor = [UIColor blueColor];
			self.routeLineView.strokeColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:255.0/255.0 alpha:0.5];
			self.routeLineView.lineWidth = 5;
		}
		
		overlayView = self.routeLineView;
		
	}
	
	return overlayView;
	
}

-(void) zoomInOnRoute
{
	[mapView setVisibleMapRect:_routeRect];
}


-(void)mapCallOutPressed:(id)sender
{
    NSLog(@"abc");
}
- (void)dealloc {
	if(routes) {
		[routes release];
	}
	[mapView release];
	[routeView release];
    [super dealloc];
}

@end
