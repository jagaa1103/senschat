//
//  fireService.swift
//  SensChat
//
//  Created by Enkhjargal Gansukh on 6/9/15.
//  Copyright (c) 2015 Enkhjargal Gansukh. All rights reserved.
//

import Foundation

class FireService: NSObject {
    
    var firebase:Firebase = Firebase(url:"https://senschat.firebaseio.com")
    
    class var sharedInstance: FireService {
        struct Static {
            static var instance: FireService?
        }
        if (Static.instance == nil) {
            Static.instance = FireService()
        }
        return Static.instance!
    }
    
    override init(){
        super.init()
    }
    
    func startFireService() {
        println("started FireService")
    }
    
    func writeFire(msg:String){
        firebase.setValue("Do you have data? You'll love Firebase.")
    }
    func readFire(){
        firebase.observeEventType(.Value, withBlock: {
            snapshot in
            println("\(snapshot.key) -> \(snapshot.value)")
        })
    }
}
