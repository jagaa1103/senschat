//
//  ViewController.swift
//  SensChat
//
//  Created by Enkhjargal Gansukh on 6/9/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        FireService.sharedInstance.startFireService()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func startClicked(sender: AnyObject) {
        var vc = self.storyboard?.instantiateViewControllerWithIdentifier("MainTabView") as! MainTabView
        self.presentViewController(vc, animated: true, completion: nil)
    }
}

