//
//  KisilerModelViewProtocol.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import Foundation

protocol KisilerModelViewProtocol {
    
    var delegate: KisilerModelViewDelegate? { get set}
    
    func load()
    
    func selectKisi(at index: Int)
    

}

enum KisilerViewModelOutput {
    case setLoading(Bool)
    case showKisiler([Kisiler])
}

/*
 Neden enum route olusturduk? Cunku ben belki Kisiler sayfasindan baska sayfalara da gecis yapacagim. Ileriyi dusunerek hareket etmen gerekiyor. eger o navigate methodunu sadece KisilerDetailModelViewProtocol yapsaydin sadece KisilerDetail'e ve onu conform eden sayfalara gidecektin.
 Ama ben belki bambaska bir dunya olan image sayfasina gidip sadece resim goruntuleyecegim belki? Bu durum icin bir tane enum olusturup her case icin baska sayfalarin protokollerini parametre olarak verdik. Ve func'da sadece bu enuma bagimli ettigimiz icin baska sayfalara da gidebiliriz.
 */
enum KisilerViewRoute {
    case detail(KisilerDetailModelViewProtocol)
}

protocol KisilerModelViewDelegate {
    func handleViewModelOutPut(_ output: KisilerViewModelOutput)
    func navigate(to route: KisilerViewRoute)
}
