//
//  PromoDetailRouter.swift
//  Promo-iOS
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

class PromoDetailRouter: PromoDetailPresenterToRouterProtocol {
    static func createModule(with promo: PromoModel) -> UIViewController {
        let view = PromoDetailViewController()
        let presenter: PromoDetailViewToPresenterProtocol & PromoDetailInteractorToPresenterProtocol = PromoDetailPresenter()
        let interactor: PromoDetailPresenterToInteractorProtocol = PromoDetailInteractor(promo: promo)
        let router: PromoDetailPresenterToRouterProtocol = PromoDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
