//
//  UIViewController+ModalPush.m
//  TeamConnector
//
//  Created by Debasish on 13/06/14.
//  Copyright (c) 2014 Dreamztech Solutions. All rights reserved.
//

#import "UIViewController+ModalPush.h"

@implementation UIViewController (ModalPush)

- (void)pushViewControllerFromModal:(UIViewController *)VC animated:(BOOL)animated
{
    // Some neccessary iOS magic from http://www.kickasslabs.com/2009/07/03/uinavigationcontroller-tricks/
    UIViewController * parentNavVC = (UIViewController *)self.navigationController.delegate;
    [parentNavVC.navigationController pushViewController:VC animated:animated];
    // After we pushed, we can dismiss the modal view
    [self.parentViewController dismissModalViewControllerAnimated:animated];
}

@end
