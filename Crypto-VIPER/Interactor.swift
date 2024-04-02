//
//  Interactor.swift
//  Crypto-VIPER
//
//  Created by Berkay Emre Aslan on 28.03.2024.
//

import Foundation

protocol AnyInteractor {
    var presenter : AnyPresenter? {get set}
    
    func downloadCryptos()
}

class CryptoInteractor : AnyInteractor {
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.NetworkFailed))
                return
            }
            do {
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
            }catch{
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.ParsingFailed))
            }
        }
        task .resume()
        
        
    }
    
    
}
