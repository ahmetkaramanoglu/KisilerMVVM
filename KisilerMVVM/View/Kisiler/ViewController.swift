//
//  ViewController.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import UIKit

protocol KisilerOutPut {
    func verileriKaydet(value: [Kisiler])
    func isIndicatorLoading(isLoading: Bool)
}

class ViewController: UIViewController {
    
    
    var myArray = [Kisiler]()
    
    var isIndicatorLoading = false
    
    @IBOutlet weak var myTableView: UITableView!
    
    var service: KisilerService?
    var modelView: KisilerModelView? 
       
    

    override func viewDidLoad() {
        super.viewDidLoad()
        service = KisilerService()
        modelView = KisilerModelView(service: service!)
       
        guard let modelView = self.modelView else { return }
        modelView.delegate = self
        modelView.load()
        
        myArray = modelView.resultsKisiler
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        
    }
}



extension ViewController: KisilerModelViewDelegate {
    func navigate(to route: KisilerViewRoute) {
        switch route {
        case .detail(let viewModel):
            let viewController = KisilerDetailBuilder.make(with: viewModel)
            showDetailViewController(viewController, sender: nil)
        }
        
    }
    
    
    func handleViewModelOutPut(_ output: KisilerViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            print("Indicator durumu \(bool)")
        case .showKisiler(let kisiler):
            self.myArray = kisiler
            myTableView.reloadData()
        }
    }
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell",for: indexPath)
        
        cell.textLabel?.text = "\(myArray[indexPath.row].kisi_ad!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        //Detaya gitmek istedigim zaman secili olan satirin indexini Bu sayfanin ViewModel'na veriyorum.
        modelView?.selectKisi(at: indexPath.row)
        
    }
    
    
}

/*
 Bu projeden ogrendiklerim:
 
 1- ViewModel'de verileri aldik fakat bunu View'da nasil gostericez? Bunun icin biraz dusundukten sonra View nesnesi ile View'da ki dizime veri aktarmamin dogru olacagini dusundum. Bu yapiyi arastirdiktan sonra aslinda buna "Delegate" pattern denildigini ogrendim.
 2- Service katmaninda sadece ve sadece verileri cekmek gondermek vs. gibi islemler ile ugrasmaliyiz. Yani ViewModel katmanindaki verileri tuttugumuz diziyi service katmaninda tutmamaliyiz. Cunku herkes kendi isini yapmali.
 3-Her View'in bir ViewModel'i var. Kisiler Tablosundan bir veriye tikladik diyelim. Detail'e gecis yapicaz.Bunun icin Detail'in ViewModel'na veriyi aktarmamiz gerekiyor. Cunku biz verileri ViewModel'da tutuyoruz. Bu yuzden Detail'in ViewModel'nda ki verimi tutan nesnesine aktardim. Bunu'da selectKisi methoduyla gerceklestirdim.
 
 
 
 */
