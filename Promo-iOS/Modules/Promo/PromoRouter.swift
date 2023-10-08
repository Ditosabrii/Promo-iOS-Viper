//
//  PromoRouter.swift
//  Promo-iOS
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit


class PromoListRouter: PromoListPresenterToRouterProtocol {
    static func createModule() -> UIViewController {
        let view = PromoListViewController()
        let presenter: PromoListViewToPresenterProtocol & PromoListInteractorToPresenterProtocol = PromoListPresenter()
        let interactor: PromoListPresenterToInteractorProtocol = PromoListInteractor()
        let router: PromoListPresenterToRouterProtocol = PromoListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
