//
//  ViewController.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//

import UIKit

protocol KisilerOutPut {
    func verileriKaydet(value: [Kisiler])
}

class ViewController: UIViewController {
    
    
    var myArray = [Kisiler]()
    
    @IBOutlet weak var myTableView: UITableView!
    
    var service: KisilerService?
    var modelView: KisilerModelView?

    override func viewDidLoad() {
        super.viewDidLoad()
        service = KisilerService()
        modelView = KisilerModelView(service: service!)
        modelView?.setDelegate(output: self)
        guard let modelView = self.modelView else { return }
        
        modelView.load()
        
        myArray = modelView.resultsKisiler
        
        myTableView.dataSource = self
        myTableView.delegate = self
    }
}

extension ViewController: KisilerOutPut {
    func verileriKaydet(value: [Kisiler]) {
        myArray = value
        myTableView.reloadData()
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
    
    
}

