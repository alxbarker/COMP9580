//
//  SocialSMSViewController.swift
//  COMP9580App
//
//  Created by Alx Barker on 2015-03-12.
//  Copyright (c) 2015 Alx Barker. All rights reserved.
//

import UIKit
import MessageUI

class SocialSMSViewController: UIViewController, MFMessageComposeViewControllerDelegate {

  override func viewDidLoad() {
    super.viewDidLoad();
    view.backgroundColor = UIColor.whiteColor();
  }

  func sendMessage(sender: AnyObject) {
    var messageView = MFMessageComposeViewController()
    
    messageView.body = "Enter an SMS message";
    messageView.recipients = ["Enter telephone number"];
    messageView.body = "Hello world!";
    messageView.messageComposeDelegate = self;
    
    self.presentViewController (messageView, animated: false, completion: nil);
  }

  func messageComposeViewController (controller: MFMessageComposeViewController!,
                                     didFinishWithResult result: MessageComposeResult) {
    switch (result.value) {
      case MessageComposeResultFailed.value:
        var alert = UIAlertController (title: "Error",
                                       message: "Failed to send SMS",
                                       preferredStyle: UIAlertControllerStyle.Alert);
        alert.addAction (UIAlertAction (title: "Dismiss",
                                        style: UIAlertActionStyle.Default,
                                        handler: nil))
        self.presentViewController (alert, animated: true, completion: nil);
        break;
      case MessageComposeResultCancelled.value: break;
      case MessageComposeResultSent.value: break;
      default: break;
    } // switch

    self.dismissViewControllerAnimated (true, completion: nil);
  } // messageComposeViewController:didFinishWithResult
  
  func sendSMS (sender: AnyObject?) {
    if (MFMessageComposeViewController.canSendText() == false) {
      var alert = UIAlertController(title: "Error",
                                    message: "Device does not support SMS",
                                    preferredStyle: UIAlertControllerStyle.Alert)
      alert.addAction (UIAlertAction (title: "Dismiss",
                                      style: UIAlertActionStyle.Default,
                                      handler: nil))
      self.presentViewController (alert, animated: true, completion: nil)
    } // if
  } // sendSMS

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
