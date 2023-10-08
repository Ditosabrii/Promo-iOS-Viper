//
//  PromoPresenter.swift
//  Promo-iOS
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

class PromoListPresenter: PromoListViewToPresenterProtocol {
    // MARK: - Properties
    weak var view: PromoListPresenterToViewProtocol?
    var interactor: PromoListPresenterToInteractorProtocol?
    var router: PromoListPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView() {
        interactor?.fetchPromo()
    }
    
    func getPromoListCount() -> Int? {
        return interactor?.promo?.count
    }
    
    func getPromo(index: Int) -> PromoModel? {
        return interactor?.promo?[index]
    }
}

// MARK: - PromoInteractorToPresenterProtocol
extension PromoListPresenter: PromoListInteractorToPresenterProtocol {
    func promoFetched() {
        view?.showPromo()
    }
    
    func promoFetchedFailed() {
        view?.showError()
    }
}
