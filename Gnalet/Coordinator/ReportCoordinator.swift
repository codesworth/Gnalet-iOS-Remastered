//
//  ReportComposer.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 03/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation
import GoogleMaps
import MaterialComponents
import FirebaseFirestore

public class ReportCoordinator:NSObject{
    
    private var report:Report?
    
//    var category:String?
//    var address:GMSAddress?
//    var coordinate:CLLocationCoordinate2D?
//    var image:UIImage?
//    var reporter:String?
//    var region:String?
//    var reporterId:String?,
//    var reportDescription:String = ""
    
    public override init() {
        super.init()
    }
    
    func compose(category:String,
        address:GMSAddress,
        coordinate:CLLocationCoordinate2D,
        image:UIImage?,
        reporter:String?,
        region:String,
        extras:Report.Extras?,
        reporterId:String?,
        reportDescription:String)->[String:Any]{
        
        let report:[String:Any] = [
            Report.Fields.category.rawValue: category,
            Report.Fields.location.rawValue:address.locality,
            Report.Fields.regionCode.rawValue:Report.getRegionCode(for: region),
            Report.Fields.latitude.rawValue:coordinate.latitude,
            Report.Fields.longitude.rawValue:coordinate.longitude,
            Report.Fields.supBody.rawValue:region,
            Report.Fields.extras.rawValue:extras,
            Report.Fields.date.rawValue:FieldValue.serverTimestamp(),
            Report.Fields.Reporter.rawValue:"",
            Report.Fields.description.rawValue:reportDescription,
            Report.Fields.week.rawValue:Calendar.current.component(.weekOfYear, from: Date()),
            Report.Fields.uid.rawValue:AppService.uid,
            Report.Fields.link.rawValue:String.empty,
            Report.Fields.subAdminArea.rawValue:address.administrativeArea
            
            
        ]
    }
    
    
}
