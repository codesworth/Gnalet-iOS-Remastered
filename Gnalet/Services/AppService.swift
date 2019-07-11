
//  AppService.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 05/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage



class AppService {
    
    typealias Completion = (_ success:Bool, _ error:Error?)->()
    
    static var store:Firestore{
        return Firestore.firestore()
    }
    
    static var storage:Storage{
        return Storage.storage()
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
    
    static func uploadReport(report:[String:Any], image:UIImage?,category:String, completion:@escaping Completion){
        if image != nil{
            store.collection(.Reports).document().setData(report, merge: true) { (err) in
                if let err = err{
                    completion(false,err)
                }else{
                    completion(true,err)
                }
            }
        }else{
            let id = store.collection(.Reporters).document()
            guard let data = image?.dataFromJPEG() else {return}
            storage.reference().child(category).child(id.documentID.appending(_JPG)).putData(data, metadata: nil) { (meta, err) in
                if err != nil{
                    id.setData(report, merge: true, completion: { (err) in
                        if let err = err{
                            completion(false,err)
                        }else{
                            completion(true,err)
                        }
                    })
                }
            }
            
        }
    }
    
    static func updateLocationOnStart(){
        UIDevice.current
    }
}
