//
//  Kisiler.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import Foundation

struct Kisiler: Codable {
    
    let kisi_id: String?
    let kisi_ad: String?
    let kisi_tel: String?
    
    
    init(kisi_id: String,kisi_ad: String, kisi_tel: String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
    
}
