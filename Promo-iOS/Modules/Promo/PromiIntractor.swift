//
//  PromiIntractor.swift
//  Promo-iOS
//
//  Created by Dito on 08/10/23.
//

import Foundation
import Alamofire

class PromoListInteractor: PromoListPresenterToInteractorProtocol {
    // MARK: - Properties
    var presenter: PromoListInteractorToPresenterProtocol?
    var promo: [PromoModel]?
    
    // MARK: - Methods
    func fetchPromo() {
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjc1OTE0MTUwLCJleHAiOjE2Nzg1MDYxNTB9.TcIgL5CDZYg9o8CUsSjUbbUdsYSaLutOWni88ZBs9S8"
        ]
        let url = Constants.url + "/promos"
        AF.request(url, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: [PromoModel].self) { response in
                switch response.result {
                case .success(let value):
                    self.promo = value
                    self.presenter?.promoFetched()
                case .failure(let error):
                    print(error)
                    self.presenter?.promoFetchedFailed()
                }
            }
    }
}
