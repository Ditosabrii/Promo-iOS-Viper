//
//  PromoModel.swift
//  Promo-iOS
//
//  Created by Dito on 08/10/23.
//

import Foundation


struct PromoModel: Codable {
    let id: Int?
    let nama, desc: String?
    let createdAt, lokasi: String?
    let imgId: Int?
    let imgFormartMediumUrl: String?
    let imgFormartThumbnailUrl: String?
}
