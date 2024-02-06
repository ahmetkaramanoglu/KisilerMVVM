//
//  ViewController.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var service: KisilerService?
    var modelView: KisilerModelView?

    override func viewDidLoad() {
        super.viewDidLoad()
        service = KisilerService()
        modelView = KisilerModelView(service: service!)
        
        modelView?.load()
    }


}

