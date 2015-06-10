//
//  RegisterCtrl.swift
//  SensChat
//
//  Created by Enkhjargal Gansukh on 6/9/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit

class RegisterCtrl: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerClicked(sender: AnyObject) {
        if(!usernameTextField.text.isEmpty && !passwordTextField.text.isEmpty){
            if(repasswordTextField.text == passwordTextField.text){
                self.registerUser(usernameTextField.text, password: passwordTextField.text)
            }else{
                var alert = UIAlertView(title: "Error", message: "Password is wrong!!!", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
        }else{
            var alert = UIAlertView(title: "Error", message: "Please insert all field", delegate: self, cancelButtonTitle: "OK")
            alert.show();
        }
    }
    
    func registerUser(username:String, password:String){
        FireService.sharedInstance.registerUser(username, password: password)
    }
}