
//  AppService.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 05/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import FirebaseAuth



class AppService {
    
    typealias Completion = (_ success:Bool, _ error:Error?)->()
    
    static var uid:String{
        return Auth.auth().currentUser!.uid
    }
    
    static func validateAuthentication(_ completion:@escaping Completion){
        
        
        if let _  = Auth.auth().currentUser{}else{
            Auth.auth().signInAnonymously { (result, err) in
                if result != nil{
                    completion(true,nil)
                }
                completion(false,err)
            }
        }
        
    }
    
    static func saveUserToDatabase(){
        let 
    }
}
