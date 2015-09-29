//
//  HomescreenViewController.swift
//  week2
//
//  Created by Angel Steger on 9/26/15.
//  Copyright © 2015 Angel Steger. All rights reserved.
//

import UIKit

class HomescreenViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var homescreenImage: UIImageView!
    @IBOutlet weak var BtnSignIn: UIButton!
    @IBOutlet weak var BtnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //scrollView.contentSize = CGSize(width: 320, height: 1136)
        scrollView.contentSize = homescreenImage.image!.size
        
        //scrollView.delegate = self
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
