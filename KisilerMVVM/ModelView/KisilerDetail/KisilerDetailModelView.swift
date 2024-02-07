//
//  KisilerDetailModelView.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import Foundation

final class KisilerDetailModelView: KisilerDetailModelViewProtocol {
  
    var delegate: KisilerDetailModelViewDelegate?
    var kisi: Kisiler?
    
    func load() {
        notify(.showDetails(kisi!))
    }
    
    
    private func notify(_ output: KisilerDetailOutput) {
        delegate?.handleViewModelOutPut(output)
    }
    
}
