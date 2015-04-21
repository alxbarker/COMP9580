//
//  AdvertBannerViewController.swift
//  COMP9580App
//
//  Created by Alx Barker on 2015-03-25.
//  Copyright (c) 2015 Alx Barker. All rights reserved.
//

import UIKit
import iAd

class AdvertBannerViewController: UIViewController, ADBannerViewDelegate {

  /* Note: In order for a UIViewController to not require an init method
          all variables in class scope must be known (var x!) Alx */

  var adBannerView: ADBannerView!;
  var adBannerViewIsVisible: Bool!;

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.whiteColor();
  }

  override func viewDidAppear (animated: Bool) {
    super.viewDidAppear(animated);
    let screenBounds: CGRect = UIScreen.mainScreen().bounds
    adBannerView = ADBannerView (frame: CGRectMake (0, 0, screenBounds.width, 66));
    adBannerView.center = CGPoint (x: screenBounds.width/2, y: screenBounds.height-(adBannerView.frame.height/2));
    adBannerView.hidden = false;
    view.addSubview (adBannerView);
  }

}

