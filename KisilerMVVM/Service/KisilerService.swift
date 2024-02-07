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
        //once verinin varligi kontrol edilmeli.
        //eger veri varsa ekrani loading'e sokmaliyiz.
        //acaba tum verileri cekmemiz gerekiyor mu oncesinde? hayir direkt gidip api'ye index gonderip cekeceksin.
        
        
    }
    
    //eger escaping yapmasaydik biz verimizi gonderemezdik. cunku escaping demek fonk bitse bile sonucu hemen gelmeyen demek.
    func fetchKisiler(response: @escaping ([Kisiler]?) -> Void) {
 

        AF.request(KisilerServiceEndPoint.getTumKisilerPath(), method: .get).response { resp in
            
            guard let data = resp.data else { return }

            do {
                let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
                if let kisiler = cevap.kisiler {

                    for kisi in kisiler {

                        print("kisi ad: \(kisi.kisi_ad!)")
                    }
                    response(cevap.kisiler)
                }
                
            }catch {
                print(error)
            }
            
        }
        
        
        
    }
    
    
}
