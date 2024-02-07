//
//  KisilerModelView.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import Foundation




final class KisilerModelView: KisilerModelViewProtocol {
    var kisilerOutput: KisilerOutPut?
    
    func setDelegate(output: KisilerOutPut) {
        self.kisilerOutput = output
    }
    
    
    
    
    
    private var isLoading = false
    private var service: KisilerServiceProtocol
    
    
     var resultsKisiler: [Kisiler] = []
    
    init(service: KisilerServiceProtocol) {
        self.service = service
        
    }
    
    func load() {
        //yuklenirken bir indicator ile yukleniyor ekrani yapalim.
        changeLoading()
        service.fetchKisiler(response: { resp in
            self.changeLoading()
            self.resultsKisiler = resp ?? []
            
            self.kisilerOutput?.verileriKaydet(value: self.resultsKisiler ?? [])
            
        })
        
    }
    
    func getKisiById(at index: Int) {
        service.fetchById(at: index)
    }
    
    func changeLoading() {
        isLoading = !isLoading
        kisilerOutput?.isIndicatorLoading(isLoading: isLoading)

    }
    
    
}
