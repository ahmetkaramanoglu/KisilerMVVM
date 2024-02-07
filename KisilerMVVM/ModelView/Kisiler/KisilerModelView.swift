//
//  KisilerModelView.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import Foundation




final class KisilerModelView: KisilerModelViewProtocol {
   
    
   
    var delegate: KisilerModelViewDelegate?
    private var isLoading = false
    private var service: KisilerServiceProtocol
    
     var resultsKisiler: [Kisiler] = []
    
    init(service: KisilerServiceProtocol) {
        self.service = service
        
    }
    
    func load() {
        
        notify(.setLoading(true))
        service.fetchKisiler(response: { resp in
            self.notify(.setLoading(false))
            self.resultsKisiler = resp ?? []
            self.notify(.showKisiler(self.resultsKisiler))
        })
        
    }
    
    //Her View'in bir ViewModel'i var. Detail'in ViewModel'na veriyi aktarmamiz gerekiyor. Cunku Verilerimiz ViewModel'da. Bu yuzden Detail'in ViewModel'nda ki verimi tutan nesnesine aktardim.
    func selectKisi(at index: Int) {
        let kisi = resultsKisiler[index]
        let modelView = KisilerDetailModelView()
        modelView.kisi = kisi
        delegate?.navigate(to: .detail(modelView))
    }

    
    private func notify(_ output: KisilerViewModelOutput) {
        //TODO: View'a beklemesini veya kisileri gostermesini vericem.
        delegate?.handleViewModelOutPut(output)
    }
}
