//
//  PromoListProtocol.swift
//  Promo-iOS
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

protocol PromoListPresenterToViewProtocol: AnyObject {
    func showPromo()
    func showError()
}

protocol PromoListInteractorToPresenterProtocol: AnyObject {
    func promoFetched()
    func promoFetchedFailed()
}

protocol PromoListPresenterToInteractorProtocol: AnyObject {
    var presenter: PromoListInteractorToPresenterProtocol? { get set }
    var promo: [PromoModel]? { get }
    
    func fetchPromo()
}

protocol PromoListPresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

protocol PromoListViewToPresenterProtocol: AnyObject {
    var view: PromoListPresenterToViewProtocol? { get set }
    var interactor: PromoListPresenterToInteractorProtocol? { get set }
    var router: PromoListPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getPromoListCount() -> Int?
    func getPromo(index: Int) -> PromoModel?
}
