//
//  SignInViewController.swift
//  week2
//
//  Created by Angel Steger on 9/26/15.
//  Copyright © 2015 Angel Steger. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var EmailTextField: UITextField!
    var initialY: CGFloat!
    let offset: CGFloat = -80
    
    @IBOutlet weak var PWTextField: UITextField!
    @IBOutlet weak var BtnSignIn: UIButton!
    @IBOutlet weak var BtnForgotPassword: UIButton!
    @IBOutlet weak var thinkingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textFieldContainer: UIView!

    @IBAction func onTap(sender: AnyObject) {
        textFieldContainer.endEditing(true)
    }
    @IBAction func tapBack(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initialY = textFieldContainer.frame.origin.y
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    //Define methods to call when keyboard is shown or hidden
   func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation

        //var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            self.textFieldContainer.frame.origin = CGPoint(x: self.textFieldContainer.frame.origin.x, y: self.initialY + self.offset)
            }, completion: nil)
    }
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        //var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            self.textFieldContainer.frame.origin = CGPoint(x: self.textFieldContainer.frame.origin.x, y: self.initialY)
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        //Add OK button
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            //handle response here
        }
        //Add the OK action to the alert controller
        alertController.addAction(OKAction)
        //Show the UIAlertController
        presentViewController(alertController, animated:true) {
            //optional code for what happens after the alert controller has finished presenting
        }
    }
   
    
    @IBAction func didPressSignUp(sender: AnyObject) {
        if EmailTextField.text == "" {
            self.showAlert("Email Required", message: "Please enter your email address")
        }
        else if PWTextField.text == "" {
            self.showAlert("Password Required", message: "Please enter your password")
        }
        else if EmailTextField.text == "angel@pinterest.com" && PWTextField.text == "hello" {
            thinkingIndicator.startAnimating()
            delay(2, closure: { () -> () in
                self.thinkingIndicator.stopAnimating()
                self.performSegueWithIdentifier("signinSegue", sender: nil)
            })
        }
        else {
            thinkingIndicator.startAnimating()
            delay(2, closure: { () -> () in
                self.thinkingIndicator.stopAnimating()
                self.showAlert("Incorrect email or password", message: "Please check your login info and try again.")
            })
        }
    }
    
    //@IBAction func didPressForgotPassword(sender: AnyObject) {
            
    //}

        
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