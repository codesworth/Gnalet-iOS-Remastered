//
//  UIKit+Extensions.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 29/06/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit


extension UIView{
    
    func addShadow(plansRounding:Bool, _ opacity:Float = 0.45, _ color:UIColor = UIColor.black, _ radius:CGFloat = 4, _ offset:CGSize = CGSize(width: 0, height: 3)){
        if plansRounding{
            let layer = CALayer()
            layer.shadowOpacity = opacity
            layer.shadowColor = color.cgColor
            layer.shadowRadius = radius
            layer.shadowOffset = offset
            self.layer.addSublayer(layer)
        }else{
            layer.shadowOpacity = opacity
            layer.shadowColor = color.cgColor
            layer.shadowRadius = radius
            layer.shadowOffset = offset
        }
        
    }
    
    func addCorner(_ radius:CGFloat = 5 ){
        clipsToBounds = true
        layer.cornerRadius = radius
    }
}