//
//  RAWGGameDetailModel.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 09/11/23.
//

struct RAWGGameDetailModel: Decodable {
    let website: String
    let publishers: [PublisherName]
    let developers: [GameDeveloper]
    let esrbRating: EsrbRating
    let descriptionRaw: String

    enum CodingKeys: String, CodingKey {
        case website, publishers
        case esrbRating = "esrb_rating"
        case developers
        case descriptionRaw = "description_raw"
    }
}

struct PublisherName: Decodable {
    let name: String
}

struct GameDeveloper: Decodable {
    let name: String
}

struct EsrbRating: Decodable {
    let name: String
}
