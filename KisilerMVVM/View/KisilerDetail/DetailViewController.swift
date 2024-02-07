//
//  DetailViewController.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var adLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    
    var viewModel: KisilerDetailModelViewProtocol?
    var kisi: Kisiler?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        viewModel?.load()
   
    }
}


//Handle ile ViewModel'in isteklerini dinleyip ona gore hareket edildi.
extension DetailViewController: KisilerDetailModelViewDelegate {
    func handleViewModelOutPut(_ output: KisilerDetailOutput) {
        switch output {
        case .showDetails(let kisi):
            self.kisi = kisi
            showDetail(kisi: kisi)
        }
    }
    
    func showDetail(kisi: Kisiler) {
        adLabel.text = kisi.kisi_ad!
        telLabel.text = kisi.kisi_tel!
    }
      
}
