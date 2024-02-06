//
//  KisilerModelViewProtocol.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import Foundation

protocol KisilerModelViewProtocol {
    
    func load()
    
    func getKisiById(at index: Int)
    
    func changeLoading()
    
}
