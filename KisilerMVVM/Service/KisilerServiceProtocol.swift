//
//  KisilerService.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import Foundation

protocol KisilerServiceProtocol {
    
    func fetchKisiler(response: @escaping ([Kisiler]?) -> Void)
    func fetchById(at index: Int)
    
}
