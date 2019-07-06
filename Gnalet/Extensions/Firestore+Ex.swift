//
//  Firestore+Ex.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 05/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import FirebaseFirestore

enum References:String{
    case Reporters = "GN-REPORTERS"
    case Reports = "GN-REPORTS"
    case Locations = "GN-Locations"
    case Devices = "GN-DEVICES"
    case TOKENS = "TOKENS"
    case Feedback = "USERFEEDBACK"
}


extension DocumentReference{
    func collection(_ ref:References)->CollectionReference{
        return collection(ref.rawValue)
    }
}

extension DocumentSnapshot{
    
    func getString(_ id:String)->String{
        if let field = get(id) as? String{
            return field
        }
        return ""
    }
    
//    func getLocation(_ id:String)->CLLocation?{
//        if let field = get(id) as? GeoPoint{
//            let location = CLLocation(latitude: field.latitude, longitude: field.longitude)
//            return location
//        }
//        return nil
//    }
    
    func getDate(_ id:String)->Date{
        
        if let field = get(id) as? Timestamp{
            return field.dateValue()
        }
        return Date()
        
        
    }
    
    func getArray(_ id:String)->[Any]{
        if let field = get(id) as? [Any]{
            return field
        }
        return []
    }
    
    func getDictionary(_ id:String)->[String:Any]{
        if let field = get(id) as? [String:Any]{
            return field
        }
        return [:]
        
    }
    
    func getDouble(id:String)->Double{
        if let field = get(id) as? Double{
            return field
        }
        return 0.000001
    }
    
    func getInt(_ id:String)->Int{
        if let field = get(id) as? Int{
            return field
        }
        return 0
    }
    
    func getInt64(_ id:String)->Int64{
        if let field = get(id) as? Int64{
            return field
        }
        return 0
    }
    
    
    func getBoolena(_ id:String)->Bool{
        if let field = get(id) as? Bool{
            return field
        }
        return false
    }
    
    
}


//extension GeoPoint{
//
//    convenience init(coordinate:CLLocationCoordinate2D){
//        self.init(latitude: coordinate.latitude, longitude: coordinate.longitude)
//    }
//}


extension Firestore{
    

    
    func collection(_ ref:References)->CollectionReference{
        return collection(ref.rawValue)
    }
    
    
}





