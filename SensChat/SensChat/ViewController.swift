//
//  ViewController.swift
//  SensChat
//
//  Created by Enkhjargal Gansukh on 6/9/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        FireService.sharedInstance.startFireService()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginClicked(sender: AnyObject) {
        if(!username.text.isEmpty && !password.text.isEmpty){
            FireService.sharedInstance.loginUser(username.text, password: password.text){
                (result) in
                if(result == "OK"){
                    var vc = self.storyboard?.instantiateViewControllerWithIdentifier("MainTabView") as! MainTabView
                    self.presentViewController(vc, animated: true, completion: nil)
                }else{
                    var alert = UIAlertView(title: "Error", message: "Login is Failed!!!", delegate: self, cancelButtonTitle: "OK")
                    alert.show();
                }
            }
            
        }else{
            var alert = UIAlertView(title: "Error", message: "Please insert all field", delegate: self, cancelButtonTitle: "OK")
            alert.show();
        }
        
    }
    @IBAction func registerClicked(sender: AnyObject) {
        var vc = self.storyboard?.instantiateViewControllerWithIdentifier("RegisterView") as! RegisterCtrl
        self.presentViewController(vc, animated: true, completion: nil)
    }
}

