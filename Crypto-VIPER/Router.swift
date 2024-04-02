//
//  Router.swift
//  Crypto-VIPER
//
//  Created by Berkay Emre Aslan on 28.03.2024.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry : EntryPoint? {get}
    static func startExecution() -> AnyRouter
}

class CryptoRouter : AnyRouter {
    var entry: EntryPoint?
    static func startExecution() -> AnyRouter {
        
        let router = CryptoRouter()
        
        var view : AnyView = CryptoVC()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
