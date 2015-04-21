//
//  RootViewController.swift
//  COMP9580App
//
//  Created by Alx Barker on 2015-03-12.
//  Copyright (c) 2015 Alx Barker. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var selections: [(String, String, UIViewController)] =
        [ ( "Show iAd Banner", "View a ribbon style advertisment", AdvertBannerViewController () ),
          //( "Show iAd Rectangle", "View a smaller style advertisment", SocialSMSViewController () ),
          //( "Show iAd Video", "View a pre-rolled video advertisment", SocialSMSViewController () ),

          ( "Send SMS", "Send an example SMS to Alx", SocialSMSViewController () ),
          ( "Send Email", "Send an example email to Alx", SocialSMSViewController () ),
          //( "View Twitter Account", "View PewDiePie's Twitter account details", SocialSMSViewController () ),
          //( "Read Tweets", "Read some of PewDiePie's tweets", SocialSMSViewController () ),

          //( "View a Gigantic Image", "Look at an image that was loaded in the background", SocialSMSViewController () ),
          //( "View the Weather", "Check Toronto's Weather that was loaded in the background", SocialSMSViewController () ),

          //( "Monitor Health", "Use a Health Monitor", SocialSMSViewController () ),
          ( "Demo Multi-touch Gestures", "See some of the gesture capabilities", GesturesViewController () ),

          //( "View a Fractal", "See the Mandlebrot Set generated", SocialSMSViewController () ),
          //( "View a Sine Wave", "See a Maple Leaf generated as a sine wave", SocialSMSViewController () ),

          //( "Play a video", "Watch \"UFO\" by the Leslie Spit Treeo", SocialSMSViewController () ),
          //( "Play a song", "Listen to \"99 Luftballoons\" by Nena", SocialSMSViewController () )

        ];

  var tableView: UITableView = UITableView ();

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = "COMP 9580 App Main Screen";

    //navigationController!.navigationBar.setBackgroundImage (UIImage (named: "ribbon-clouds.jpg"),
      //                                                     forBarMetrics: .Default)

    view.backgroundColor = UIColor.whiteColor();

    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.frame = self.view.bounds;
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell");
    tableView.separatorStyle = .None;

    view.addSubview(tableView)
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selections.count
  }
   
  func tableView (tableView: UITableView,
                  cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    let selection: (String, String, UIViewController) = selections[indexPath.row];

    var cell = UITableViewCell (style: .Subtitle, reuseIdentifier: "Cell");

    cell.textLabel?.text = selection.0;
    cell.detailTextLabel?.text = selection.1;

    return cell

  }
   
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    println("You selected cell #\(indexPath.row)!")
    self.navigationController!.pushViewController(selections[indexPath.row].2, animated: true)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

} // RootViewController
