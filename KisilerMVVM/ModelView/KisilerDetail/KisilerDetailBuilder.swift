//
//  KisilerDetailBuilder.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import UIKit


final class KisilerDetailBuilder {
    
    static func make(with viewModel: KisilerDetailModelViewProtocol) -> DetailViewController {
        let storyboard = UIStoryboard(name: "KisilerDetailStoryBoard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "KisiDetail") as! DetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
   
}
