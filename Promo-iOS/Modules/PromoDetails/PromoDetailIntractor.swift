//
//  PromoDetailIntractor.swift
//  Promo-iOS
//
//  Created by Dito on 08/10/23.
//

import Foundation


class PromoDetailInteractor: PromoDetailPresenterToInteractorProtocol {
    // MARK: - Properties
    var presenter: PromoDetailInteractorToPresenterProtocol?
    var promoDetail: PromoModel?
    
    init(promo: PromoModel) {
        self.promoDetail = promo
    }
    
    // MARK: - Methods
    func fetchPromo() {
        if promoDetail != nil {
            self.presenter?.promoFetched()
        } else {
            self.presenter?.promoFetchedFailed()
        }
    }
}
