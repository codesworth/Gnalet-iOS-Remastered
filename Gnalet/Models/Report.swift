//
//  Report.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 01/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation
import CoreLocation



struct Report {
    
    typealias Extras = [String:Any]
    
    enum Types {
        case general
        case vehicular
    }
    
    enum Status:Int {
        case unsolved = 1
        case pending = 2
        case solved = 3
    }
    
    let id:String
    let location:String
    let coordinate:CLLocationCoordinate2D
    let category:String
    let description:String
    let imageLink:String
    let region:String
    let supCode:Int
    let subAdminArea:String
    let status:Status
    let reporter:String
    let reporterUid:String
    let extras:Extras
    let dateCreated:Date
    

}


extension Report{
    
    enum Fields:String {
        case id
        case location
        case coordinate
        case category
        case description
        case imageLink
        case region
        case supCode
        case subAdminArea
        case status
        case reporter
        case reporterUid
        case extras
        case dateCreated
    }
}



extension Report{
    
    static let Regions = [
        "Ahafo Region",
        "Ashanti Region",
        "Bono East Region",
        "Bono Region",
        "Central Region",
        "Eastern Region",
        "Greater Accra Region",
        "North East Region",
        "Northern Region",
        "Oti Region",
        "Savannah Region",
        "Upper East Region",
        "Upper West Region",
        "Volta Region",
        "Western North Region",
        "Western Region"
    ]
    
    static let SupCodes = [
        "AHR",
        "AR",
        "BER",
        "BR",
        "CR",
        "ER",
        "GAR",
        "NER",
        "NR",
        "OR",
        "SR",
        "UER",
        "UWR",
        "VR",
        "WNR",
        "WR",
    ]
    
    static func getSupCode(at index:Int)->String{
        guard index < SupCodes.endIndex else{
            return "GAR"
        }
        return SupCodes[index]
    }
    
    static func getSupCode(for region:String)->String{
        guard let index = Regions.firstIndex(of: region) else {return "GAR"}
        return SupCodes[index]
    }
    
    static func getSupBody(for code:String)->String{
        guard let index = SupCodes.firstIndex(of: code) else {return "Greater Accra Region"}
        return Regions[index]
    }
    
    
    static func getSupbody(at index:Int)->String{
        guard index < Regions.endIndex else{
            return "Greater Accra Region"
        }
        return Regions[index]
    }

}
