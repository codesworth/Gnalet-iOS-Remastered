//
//  HomeOptions.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 29/06/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation


struct Options {
    var name:String
    var icon:String
    
    static var defaultOptions = [
        Options(name: "NEW REQUEST", icon: "addissue"),
        Options(name: "MY REQUESTS", icon: "myrequests"),
        Options(name: "ISSUES NEARBY", icon: "nearbyreq"),
        Options(name: "REPORTER", icon: "reporter"),
        Options(name: "HOW TO", icon: "how_to_ic")
    ]
}
