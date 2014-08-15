//
//  FirebaseModel.swift
//  firebasetest
//
//  Created by John Doty on 8/14/14.
//  Copyright (c) 2014 John Doty. All rights reserved.
//

import Foundation

class FirebaseModel {
    let myRootRef = Firebase(url:"https://swiftexample.firebaseio.com/")
    let messages: Firebase
    
    init(){
        messages = myRootRef.childByAppendingPath("messages")
    }
    
    func sendMessage(message:String){
        var postRef = messages.childByAutoId()
        postRef.setValue(message)
    }
}
