//
//  Presenter.swift
//  Crypto-VIPER
//
//  Created by Berkay Emre Aslan on 28.03.2024.
//

import Foundation


enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto],Error>)
}

class CryptoPresenter : AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            view?.upload(with: cryptos)
        case .failure(_):
            view?.upload(with: "Something went wrong!")
        }
    }
    
    
}
