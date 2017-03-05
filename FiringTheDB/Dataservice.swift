//
//  Dataservice.swift
//  FiringTheDB
//
//  Created by LokeshReddy Pothapu on 3/5/17.
//  Copyright © 2017 LokeshReddy Pothapu. All rights reserved.
//

import Foundation
import Firebase

//will get the uri of db
let DB_BASE = FIRDatabase.database().reference()

class Dataservice{
    
    static let ds = Dataservice()
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE :FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS :FIRDatabaseReference {
        return _REF_POSTS
    }
    var REF_USERS:FIRDatabaseReference {
        return _REF_USERS
    }
    
    
    func firebasedbuser(uid:String ,userdata:Dictionary<String,String>) {
        REF_USERS.child(uid).updateChildValues(userdata)
    }
}
