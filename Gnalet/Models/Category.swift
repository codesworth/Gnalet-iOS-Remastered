//
//  Category.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 29/06/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import Foundation

struct Category {
    let title:String
    let info:String
    
    var header:String{
        if title == ABANDONED_ACCIDENT{
            return VEHICULAR
        }
        
        if title == GSA{
            return "GSA"
        }
        
        if title == INDESCIPLINE_BEHAVIOUR{
            return "INDISCIPLINE"
        }
        
        return title
    }
    
    static let allCategories = [
        Category(title: ABANDONED_ACCIDENT, info: INFO_VEHICULAR),
        Category(title: INDESCIPLINE_BEHAVIOUR, info: INFO_INDISCIPLINE),
        Category(title: SANITATION, info: INFO_SANITATION),
        Category(title: CRIMES, info: INFO_CRIMES),
        Category(title: WATER, info: INFO_WATER),
        Category(title: POTHOLES, info: INFO_POTHOLES),
        Category(title: ECG, info: INFO_ECG),
        Category(title: FDA, info: INFO_HFDA),
        Category(title: GSA, info: INFO_GSA),
        Category(title: OTHERS, info: INFO_OTHER)
        
    ]
}


let ABANDONED_ACCIDENT = "ABANDONED/ACCIDENT VEHICLE";
let VEHICULAR = "VEHICULAR";

let FDA = "HEALTH/FDA";
let GSA = "GHANA STANDARDS AUTHORITY";
let SANITATION = "SANITATION";
let POTHOLES = "POTHOLES";
let ECG = "ELECTRICAL/ECG";
let OTHERS = "OTHERS";
let WATER = "PIPES/WATER ISSUES";
let CRIMES = "PUBLIC CRIMES";
let UNSOLVED = "Unsolved";
let INDESCIPLINE_BEHAVIOUR = "INDISCIPLINE BEHAVIOUR";
//public static final String EMPTY_CHARSET = "";

let INFO_INDISCIPLINE = "Report issues of indiscipline behavior or conducts of citizens around you."
let INFO_VEHICULAR = "Report Issues on roads and public transport safety. Vehicular issues such as abandoned cars, careless driving and cars that are not road worthy and dangerous to the road users and the environment";

let INFO_SANITATION = "Report issues on sanitation, general public hygiene, inappropriate sewage and refuse disposal and general issues regarding cleanliness in the surrounding";

let INFO_CRIMES = "Report Issues and situations can be described as criminal or potential for crime, such as suspicious activities in an area, drug use, theft, destruction of property and all issues you can adress to the Police service";


let INFO_WATER = "Report Issues of broken pipes, water shortage and damaged and poor conditions of Ghana Water System. Issues will be addressed to Ghana Water Company";

let INFO_POTHOLES = "Report Potholes on roads and roads in bad shape";

let INFO_ECG = "Report issues on electricity such as unannounced blackouts, elctric poles in poor condition, damaged electrical equipment that the ECG is in charge of";

let INFO_HFDA = "Report issues on health and medicines such as expired food and drugs on the market and suspicious food products and drugs that may not have been approved for the consumption";

let INFO_GSA = "Report issues on suspicious and uncertified services and products in the country to the Ghana Standard Authority";

let INFO_OTHER = "Report any issue that is of social concern that doesn't fall into any of the above categories, such as excessive noise making and local disturbances";
