//
//  RoomsCtrl.swift
//  SensChat
//
//  Created by Enkhjargal Gansukh on 6/9/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit

class RoomsCtrl: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func goMessagesClicked(sender: AnyObject) {
        var vc = self.storyboard?.instantiateViewControllerWithIdentifier("MessagesView") as! MessagesCtrl
        self.presentViewController(vc, animated: true, completion: nil)
    }
}