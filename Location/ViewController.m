//
//  ViewController.m
//  Location
//
//  Created by Nate Lundie on 5/5/14.
//  Copyright (c) 2014 Lundie Sutton Industries. All rights reserved.
//

#import "ViewController.h"
#import "CoreLocation/CoreLocation.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize locationManager;
@synthesize latitude;
@synthesize longitude;
@synthesize horizontalAccuracy;
@synthesize verticalAccuracy;
@synthesize altitude;
@synthesize startLocation;
@synthesize distance;
@synthesize latArray;
@synthesize longArray;
@synthesize altArray;


- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    startLocation = nil;
    altArray = [[NSMutableArray alloc] init];
    latArray = [[NSMutableArray alloc] init];
    longArray = [[NSMutableArray alloc] init];
    NSInteger *count;
    count = 0;
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation
          fromLocation:(CLLocation *)oldLocation
{
    NSString *currentLatitude = [[NSString alloc]
                                 initWithFormat:@"%+.6f",
                                 newLocation.coordinate.latitude];
    latitude.text = currentLatitude;
    
    NSString *currentLongitude = [[NSString alloc]
                                  initWithFormat:@"%+.6f",
                                  newLocation.coordinate.longitude];
    longitude.text = currentLongitude;
    
    NSString *currentHorizontalAccuracy =
    [[NSString alloc]
     initWithFormat:@"%+.6f",
     newLocation.horizontalAccuracy];
    horizontalAccuracy.text = currentHorizontalAccuracy;
    
    NSString *currentAltitude = [[NSString alloc]
                                 initWithFormat:@"%+.6f",
                                 newLocation.altitude];
    altitude.text = currentAltitude;
    //altArray = [[NSMutableArray alloc] init];
    //[altArray addObject:currentAltitude];
    //NSLog(@"altArray: %@", altArray);
    
    NSString *currentVerticalAccuracy =
    [[NSString alloc]
     initWithFormat:@"%+.6f",
     newLocation.verticalAccuracy];
    verticalAccuracy.text = currentVerticalAccuracy;
    
    if (startLocation == nil)
        startLocation = newLocation;
    
    CLLocationDistance distanceBetween = [newLocation
                                          distanceFromLocation:startLocation];
    
    NSString *tripString = [[NSString alloc]
                           initWithFormat:@"%f",
                            distanceBetween];
    distance.text = tripString;
    [latArray addObject:currentLatitude];
    NSLog(@"latArray: %@", latArray);
    [longArray addObject:currentLongitude];
    NSLog(@"longArray: %@", longArray);
}
- (IBAction)buttonstuff:(id)sender {
    //altArray = [[NSMutableArray alloc] init];
    [altArray addObject:altitude.text];
    
    NSLog(@"altArray: %@", altArray);
    
    
}

@end
