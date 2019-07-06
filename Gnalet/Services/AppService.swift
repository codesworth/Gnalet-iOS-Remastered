
//  AppService.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 05/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import FirebaseAuth
import FirebaseFirestore
let _TS = "ts"

class AppService {
    
    typealias Completion = (_ success:Bool, _ error:Error?)->()
    
    static var store:Firestore{
        return Firestore.firestore()
    }
    
    static var uid:String{
        return Auth.auth().currentUser!.uid
    }
    
    static func validateAuthentication(_ completion:@escaping Completion){
        
        
        if let _  = Auth.auth().currentUser{}else{
            Auth.auth().signInAnonymously { (result, err) in
                if result != nil{
                    saveUserToDatabase(uid: result!.user.uid, x: completion)
                }
                completion(false,err)
            }
        }
        
    }
    
    static func saveUserToDatabase(uid:String, x:@escaping Completion){
        let user = Reporter(uid: uid)
        let ts = TimeInterval.currentMillis
        var exp = user.export()
        exp.updateValue(ts, forKey: _TS)
        store.collection(.Reporters).document(uid).setData(exp, merge: true) { err in
            if err != nil{
                x(false,err)
            }
        }
    }
}
