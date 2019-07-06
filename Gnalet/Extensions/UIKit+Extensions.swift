//
//  UIKit+Extensions.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 29/06/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit


extension UIView{
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        if #available(iOS 11, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = corners
        } else {
            var cornerMask = UIRectCorner()
            if(corners.contains(.layerMinXMinYCorner)){
                cornerMask.insert(.topLeft)
            }
            if(corners.contains(.layerMaxXMinYCorner)){
                cornerMask.insert(.topRight)
            }
            if(corners.contains(.layerMinXMaxYCorner)){
                cornerMask.insert(.bottomLeft)
            }
            if(corners.contains(.layerMaxXMaxYCorner)){
                cornerMask.insert(.bottomRight)
            }
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: cornerMask, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
    
    func addShadow(_ opacity:Float = 0.45, _ color:UIColor = UIColor.black, _ radius:CGFloat = 4, _ offset:CGSize = CGSize(width: 0, height: 3)){
//        if plansRounding{
//            let layer = CALayer()
//            layer.shadowOpacity = opacity
//            layer.shadowColor = color.cgColor
//            layer.shadowRadius = radius
//            layer.shadowOffset = offset
//            self.layer.addSublayer(layer)
//        }else{
        layer.shadowOpacity = opacity
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        //}
        
    }
    
    func addCorner(hasShadow:Bool, _ radius:CGFloat = 5 ){
        if hasShadow{
            let layer = CALayer()
            clipsToBounds = true
            layer.cornerRadius = radius
            self.layer.addSublayer(layer)
        }else{
            clipsToBounds = true
            layer.cornerRadius = radius
        }
        
    }
    
    
    func layout(_ invalidatePrevious:Bool = false,using closure:(LayoutProxy) -> Void){
        if invalidatePrevious{removeConstraints(self.constraints)}
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view:self))
    }
}


extension UIColor{
    static var primary:UIColor{
        return #colorLiteral(red: 0.03542086482, green: 0.3643639088, blue: 0.6931433082, alpha: 1)
    }
}



extension UIScreen{
    
    static var height:CGFloat{
        return main.bounds.height
    }
    
    static var width:CGFloat{
        return main.bounds.width
    }
}


extension UIImage{
    
    enum ImageSizes:Int{
        case supermax = 32000000
        case max = 16000000
        case medium = 8000000
        case minlg = 4000000
        case min = 1000000
    }
    
    func dataFromJPEG()-> Data?{
        var compression:CGFloat = 1
        if let data = jpegData(compressionQuality: compression){
            if data.count < ImageSizes.min.rawValue{
                compression = 0.6
                return jpegData(compressionQuality: compression)
            }
            if data.count < ImageSizes.minlg.rawValue{
                compression = 0.5
                return jpegData(compressionQuality: compression)
            }
            if data.count < ImageSizes.medium.rawValue{
                compression = 0.4
                return jpegData(compressionQuality: compression)
            }
            if data.count < ImageSizes.max.rawValue{
                compression = 0.2
                return jpegData(compressionQuality: compression)
            }
            
            compression = 0.1
            return jpegData(compressionQuality: compression)
            
        }
        return nil
    }
}

extension UIApplication{
    static var window:UIWindow?{
        return shared.keyWindow
    }
    
    static var GMAPS_API_KEY:String{
        return "AIzaSyD0mskPw54Rw8kSCHlfNHexW2cTLzVh4Z8"
    }
}


//
