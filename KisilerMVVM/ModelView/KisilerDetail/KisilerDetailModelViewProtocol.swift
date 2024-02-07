//
//  KisilerDetailModelViewProtocol.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import Foundation

protocol KisilerDetailModelViewProtocol {
    //sen sadece Ekranda verileri gosterticeksin. Bunu delegate ile yapacaksin
    
    var delegate: KisilerDetailModelViewDelegate? { get set}
    
    func load()
    
}
enum KisilerDetailOutput {
    
    case showDetails(Kisiler)
    
}

protocol KisilerDetailModelViewDelegate {
    
    func handleViewModelOutPut(_ output: KisilerDetailOutput)
    func showDetail(kisi: Kisiler)
    
}
