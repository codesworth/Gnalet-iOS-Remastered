//
//  ImagePickerView.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 01/07/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit
import MaterialComponents.MDCCard

class ImagePickerView: MDCCard {

    // MARK: - Components
    
    private lazy var imageview:UIImageView = { [unowned self] by in
        let imgv = UIImageView(frame: .zero)
        imgv.contentMode = .scaleAspectFill
        imgv.image = #imageLiteral(resourceName: "tp")
        imgv.clipsToBounds = true
        imgv.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedgesture(_:)))
        tap.numberOfTapsRequired = 1
        imgv.addGestureRecognizer(tap)
        return imgv
    }(())
    
    var image:UIImage?{
        didSet{
            if image != nil{imageview.image = image}
        }
    }
    
    //MARK:- Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initialize(){
        cornerRadius = 5
        setShadowElevation(ShadowElevation(rawValue: 4), for: .normal)
        addSubview(imageview)
        backgroundColor = .white
    }
    
    //MARK: - LAYOUT
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageview.layout{
            $0.top == topAnchor
            $0.bottom == bottomAnchor
            $0.trailing == trailingAnchor
            $0.leading == leadingAnchor
        }
    }
    
    //MARK: - SELECTORS
    @objc func tappedgesture(_ recognizer:UITapGestureRecognizer){
        let picker = UIImagePickerController()
        picker.delegate = self
        UIApplication.window?.rootViewController?.present(picker, animated: true, completion: nil)
    }

}


extension ImagePickerView:UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage{
            self.image = image
        }
    }
}
