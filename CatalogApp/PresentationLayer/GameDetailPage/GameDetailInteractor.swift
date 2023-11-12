//
//  GameDetailInteractor.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 08/11/23.
//

import Alamofire

protocol GameDetailInteractorProtocol {
    var gameDetailPresenter: GameDetailPresenterProtocol? { get set }

    func fetchGameDetail(id gameID: String, completionHandler: @escaping(Result<RAWGGameDetailModel, AFError>) -> Void)
}

class GameDetailInteractor: GameDetailInteractorProtocol {
    var gameDetailPresenter: GameDetailPresenterProtocol?

    let apiKey = RAWGAPI.apiKey

    func fetchGameDetail(id gameID: String, completionHandler: @escaping(Result<RAWGGameDetailModel, AFError>) -> Void) {
        RAWGAPI.getGameDetail(key: apiKey, id: gameID) { result in
            completionHandler(result)
        }
    }
}
