//
//  ReportFormVC.swift
//  Gnalet
//
//  Created by Shadrach Mensah on 30/06/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class ReportFormVC: UIViewController {

    lazy var form:BasicTextInput = {
        let form = BasicTextInput(frame: .zero)
        form.placeholder = "My name is Lach"
        return form
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(form)
        let width = view.frame.width - 50
        form.layout{
            $0.centerX == view.centerXAnchor
            $0.centerY == view.centerYAnchor
            $0.height |=| 60
            $0.width |=| width
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
