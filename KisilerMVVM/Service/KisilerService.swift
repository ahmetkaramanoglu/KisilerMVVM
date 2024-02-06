//
//  KisilerService.swift
//  KisilerMVVM
//
//  Created by Ahmet Karamanoğlu on 7.02.2024.
//
import Foundation
import Alamofire

enum KisilerServiceEndPoint: String {
    case BASE_URL = "http://kasimadalan.pe.hu/"
    case PATH = "kisiler/tum_kisiler.php"
    
    //Bu method bir instance method oldugu icin bir tane enum nesnen lazim ulasabilmen icin. ancak o sekilde kullanabilirsin.
    //    func getBilmem() -> String{
    //        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    //    }
    
    
    
    //Ama bu method bir static method oldugu icin direkt enum uzerinden ulasabilirsin.
    static func getTumKisilerPath() -> String{
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}


final class KisilerService: KisilerServiceProtocol {
    
    
    
    func fetchById(at index: Int) {
        
    }
    
    func fetchKisiler(response: @escaping ([Kisiler]?) -> Void) {
 
        AF.request(KisilerServiceEndPoint.getTumKisilerPath()).responseDecodable(of: KisiCevap.self, completionHandler: { (model) in
            
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.kisiler)
            
        })
    
        
//        AF.request(KisilerServiceEndPoint.getTumKisilerPath(), method: .get).response { response in
//            print("response cevap \(response.response!)")
//            guard let data = response.data else { return }
//
//            do {
//                let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
//                if let kisiler = cevap.kisiler {
//
//                    for kisi in kisiler {
//
//                        print("karakter ad: \(kisi.kisi_ad!)")
//                    }
//
//                }
//            }catch {
//                print(error.localizedDescription)
//            }
//        }
        
        
        
    }
    
    
}
