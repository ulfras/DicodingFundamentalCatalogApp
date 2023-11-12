//
//  RAWGModel.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 09/11/23.
//

struct RAWGGameListModel: Decodable {
    let results: [RAWGGameListResult]
}

struct RAWGGameListResult: Decodable {
    let id: Int
    let name: String
    let released: String
    let backgroundImage: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case id, name, released
        case backgroundImage = "background_image"
        case rating
    }
}
