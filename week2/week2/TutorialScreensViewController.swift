//
//  TutorialScreensViewController.swift
//  week2
//
//  Created by Angel Steger on 9/27/15.
//  Copyright © 2015 Angel Steger. All rights reserved.
//

import UIKit

class TutorialScreensViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var pageViewcontroller: UIPageControl!
    @IBOutlet weak var horizontalScrollView: UIScrollView!
    @IBOutlet weak var btn_TakeCarousel: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        horizontalScrollView.delegate = self
        horizontalScrollView.contentSize = CGSize(width: 1280, height: 568)

    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageViewcontroller.currentPage = page
        
        if page == 3 {
            UIView.animateWithDuration(0.3, animations: {
                self.btn_TakeCarousel.alpha = 1
            })
        }
        else if page == 2 {
            UIView.animateWithDuration(0.3, animations: {
                self.btn_TakeCarousel.alpha = 0
            })
        }
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
