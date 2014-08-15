//
//  ViewController.swift
//  firebasetest
//
//  Created by John Doty on 8/14/14.
//  Copyright (c) 2014 John Doty. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITextFieldDelegate {
    
    var count: Int = 0
    
    let messages = FirebaseModel()

    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func sendTapped(sender: AnyObject) {
        messages.sendMessage(textField.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil)
    }
    
    //observer callbacks for resizing view when keyboard appears
    func keyboardWillShow(sender: NSNotification) {
        let s:NSValue = sender.userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue
        let rect :CGRect = s.CGRectValue()
        self.view.frame.size.height -= rect.size.height
    }
    
    //observer callbacks for resizing view when keyboard dismissed
    func keyboardWillHide(sender: NSNotification) {
        let s:NSValue = sender.userInfo[UIKeyboardFrameBeginUserInfoKey] as NSValue
        let rect :CGRect = s.CGRectValue()
        self.view.frame.size.height += rect.size.height
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        //textField.resignFirstResponder()  //this is equivalent
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

