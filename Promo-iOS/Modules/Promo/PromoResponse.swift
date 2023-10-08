//
//  PromoResponse.swift
//  Promo-iOS
//
//  Created by Dito on 08/10/23.
//

import Foundation

struct PromoResponse: Codable {
    let id: Int?
    let title: String?
    let publishedAt, promoCreatedAt, updatedAt: String?
    let namePromo, descPromo: String?
    let nama, desc, latitude, longitude: String?
    let alt, createdAt, lokasi: String?
    let count: Int?
    let img: Img?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "Title"
        case publishedAt = "published_at"
        case promoCreatedAt = "created_at"
        case updatedAt = "updated_at"
        case namePromo = "name_promo"
        case descPromo = "desc_promo"
        case nama, desc, latitude, longitude, alt, createdAt, lokasi, count, img
    }
    
    struct Img: Codable {
        let id: Int?
        let name, alternativeText, caption: String?
        let width, height: Int?
        let formats: Formats?
        let hash, ext, mime: String?
        let size: Double?
        let url: String?
        let previewURL: String?
        let provider: String?
        let providerMetadata: String?
        let createdAt, updatedAt: String?
        
        enum CodingKeys: String, CodingKey {
            case id, name, alternativeText, caption, width, height, formats, hash, ext, mime, size, url
            case previewURL = "previewUrl"
            case provider
            case providerMetadata = "provider_metadata"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
        
        struct Formats: Codable {
            let small, medium, thumbnail: Medium?
            
            struct Medium: Codable {
                let ext: String?
                let url: String?
                let hash, mime, name: String?
                let path: String?
                let size: Double?
                let width, height: Int?
            }
        }
    }
}
