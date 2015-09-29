//
//  ImageTimelineViewController.swift
//  week2
//
//  Created by Angel Steger on 9/27/15.
//  Copyright © 2015 Angel Steger. All rights reserved.
//

import UIKit

class ImageTimelineViewController: UIViewController {
    @IBAction func tapConversations(sender: AnyObject) {
    }
    @IBAction func tapSettings(sender: AnyObject) {
    }
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 320, height: 1564)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
