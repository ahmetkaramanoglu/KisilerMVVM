//
//  KisilerModelView.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import Foundation




final class KisilerModelView: KisilerModelViewProtocol {
    
    private var isLoading = false
    private var service: KisilerServiceProtocol
    
    //bunu neden burda olusturduk? Cunku sen zaten serviste fetch ediyorsun. Bir daha niye orda dizi olusturup esitleyesin. servis sadece servis islerini yapsin. Sen burda bunu fetch data icinde zaten esitleyip veriyi vereceksin.
    private var resultsKisiler: [Kisiler] = []
    
    init(service: KisilerServiceProtocol) {
        self.service = service
    }
    
    func load() {
        //yuklenirken bir indicator ile yukleniyor ekrani yapalim.
        changeLoading()
        
        //Internet baglantisi yapilacak. Bunun icin bir servise ihtiyacimiz var.
        service.fetchKisiler(response: { resp in
            self.changeLoading()
            self.resultsKisiler = resp ?? []
        })
        
    }
    
    func getKisiById(at index: Int) {
        service.fetchById(at: index)
    }
    
    func changeLoading() {
        isLoading = !isLoading
        if isLoading {
            print("Ekran yukleniyor.")
        }else{
            print("Ekran yuklendi.")
        }
        
    }
    
    
}
