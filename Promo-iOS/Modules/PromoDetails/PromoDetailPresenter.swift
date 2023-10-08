//
//  PromoDetailPresenter.swift
//  Promo-iOS
//
//  Created by Dito on 08/10/23.
//

import Foundation

class PromoDetailPresenter: PromoDetailViewToPresenterProtocol {
    // MARK: - Properties
    var view: PromoDetailPresenterToViewProtocol?
    var interactor: PromoDetailPresenterToInteractorProtocol?
    var router: PromoDetailPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView() {
        interactor?.fetchPromo()
    }
    
    func getPromo() -> PromoModel? {
        return interactor?.promoDetail
    }
}

// MARK: - PromoDetailInteractorToPresenterProtocol
extension PromoDetailPresenter: PromoDetailInteractorToPresenterProtocol {
    func promoFetched() {
        view?.showPromo()
    }
    
    func promoFetchedFailed() {
        view?.showError()
    }
}
