//
//  Reporter.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 05/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation
import FirebaseFirestore.FIRDocumentSnapshot

struct Reporter{
    private let ANONYMOUS = "Anonymous"
    enum Fields:String {
        case username,lastnme,email,phone
    }
    private let uid:String
    private let username:String
    private let lastnme:String?
    private let email:String?
    private let phone:String?
    
    init(snapshot:DocumentSnapshot){
        uid = snapshot.documentID
        username = snapshot.getString(Fields.username.rawValue)
        lastnme = snapshot.getString(Fields.lastnme.rawValue)
        email = snapshot.getString(Fields.email.rawValue)
        phone = snapshot.getString(Fields.phone.rawValue)
    
    }
    
    init(uid:String){
       self.uid = uid
        username = ANONYMOUS
        lastnme = ""
        email = ""
        phone = ""
    }
    
    
    
    func export()->[String:Any]{
        return [
            Fields.username.rawValue:username,
            Fields.lastnme.rawValue:lastnme ?? .empty,
            Fields.phone.rawValue:phone ?? .empty
            ] as [String:Any]
    }
}
