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
    private let uid:String
    private let username:String = "Anonymous"
    private let lastnme:String?
    private let email:String?
    private let phone:String?
    
    init(){
    }
}
