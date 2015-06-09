//
//  MessagesCtrl.swift
//  SensChat
//
//  Created by Enkhjargal Gansukh on 6/9/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit

class MessagesCtrl: UIViewController{
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
    }
    @IBAction func sendMessage(sender: AnyObject) {
        var username = "Jagaa"
        FireService.sharedInstance.writeFire(username, msg:textField.text)
        textField.text = ""
    }
}