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
    
    func writeFire(username:String, msg:String){
        var data:NSDictionary = ["username":username, "msg":msg]
//        firebase_msg.setValue(data)
        var firebase_messages = firebase.childByAppendingPath("messages")
        var messages = firebase_messages.childByAutoId();
        messages.setValue(data)
        
        self.readFire()
    }
    func readFire(){
        var messages:AnyObject?
        firebase.observeEventType(.Value, withBlock: {
            res in
//            println("\(res.key) -> \(res.value)")
            messages = res
            println(messages)
            
        })
    }
    
    
    
//================ Register User ======================
    func registerUser(username:String, password:String){
        var data:NSDictionary = ["username":username, "password":password]
        var userdb = firebase.childByAppendingPath("users")
        var tmp = userdb.childByAutoId()
        tmp.setValue(data)
    }
    
//================ Login User ======================
    func loginUser(username:String, password:String){
        var data:NSDictionary = ["username":username, "password":password]
        var userdb = firebase.childByAppendingPath("users")
        userdb.authUser(username, password: password) { (err, data) in
            println("Login is complete! >> \(data)")
        }
    }
    
    func loginUser(username: String, password:String, completion: (result: String) -> Void) {
        var data:NSDictionary = ["username":username, "password":password]
        var userdb = firebase.childByAppendingPath("users")
        userdb.authUser(username, password: password) { (err, data) in
            println("Login is complete! >> \(data)")
            completion(result: "OK")
        }
    }
    
}
