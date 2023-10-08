//
//  PromoDetailProtocol.swift
//  Promo-iOS
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

protocol PromoDetailPresenterToViewProtocol: AnyObject {
    func showPromo()
    func showError()
}

protocol PromoDetailInteractorToPresenterProtocol: AnyObject {
    func promoFetched()
    func promoFetchedFailed()
}

protocol PromoDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: PromoDetailInteractorToPresenterProtocol? { get set }
    var promoDetail: PromoModel? { get }
    
    func fetchPromo()
}

protocol PromoDetailPresenterToRouterProtocol: AnyObject {
    static func createModule(with promo: PromoModel) -> UIViewController
}

protocol PromoDetailViewToPresenterProtocol: AnyObject {
    var view: PromoDetailPresenterToViewProtocol? { get set }
    var interactor: PromoDetailPresenterToInteractorProtocol? { get set }
    var router: PromoDetailPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getPromo() -> PromoModel?
}
