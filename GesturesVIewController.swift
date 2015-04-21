//
//  GesturesVIewController.swift
//  COMP9580App
//
//  Created by Alx Barker on 2015-03-27.
//  Copyright (c) 2015 Alx Barker. All rights reserved.
//

import Foundation
import UIKit

class GesturesViewController: UIViewController, UIGestureRecognizerDelegate {

  var gestureLabel: UILabel!;

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.whiteColor();

    gestureLabel = UILabel (frame: CGRectMake (50, 50, 500, 100));
    gestureLabel.text = "Tap, swipe, hold, etc";
    view.addSubview(gestureLabel);

    let tapGestureRec = UITapGestureRecognizer (target: self, action: Selector("handleTap:"));
    tapGestureRec.delegate = self;
    view.addGestureRecognizer(tapGestureRec);

    let swipeRight = UISwipeGestureRecognizer(target: self, action: "handleSwipe:");
    swipeRight.direction = UISwipeGestureRecognizerDirection.Right;
    view.addGestureRecognizer(swipeRight);

    let swipeDown = UISwipeGestureRecognizer(target: self, action: "handleSwipe:");
    swipeDown.direction = UISwipeGestureRecognizerDirection.Down;
    view.addGestureRecognizer(swipeDown);

  } // viewDidLoad

  func handleTap (sender: UITapGestureRecognizer!) {
    if (sender.state == .Ended) {
      let location: CGPoint = sender.locationInView(self.view);
      gestureLabel.text = "Tap @ " + NSStringFromCGPoint(location);
    } // if
  } // handleTap

  func handleSwipe (sender: UISwipeGestureRecognizer!) {
    switch sender.direction {
      case UISwipeGestureRecognizerDirection.Right:
        gestureLabel.text = "Swiped right";
      case UISwipeGestureRecognizerDirection.Down:
        gestureLabel.text = "Swiped down";
      default:
        break;
    } // switch
  } // handleSwipe

} // GesturesViewController