//
//  GameListInteractor.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 08/11/23.
//

import Alamofire

protocol GameListInteractorProtocol {
    var gameListPresenter: GameListPresenterProtocol? { get set }

    func fetchGameList(completionHandler: @escaping (Result<RAWGGameListModel, AFError>) -> Void)
}

class GameListInteractor: GameListInteractorProtocol {
    var gameListPresenter: GameListPresenterProtocol?

    let apiKey = RAWGAPI.apiKey

    func fetchGameList(completionHandler: @escaping (Result<RAWGGameListModel, AFError>) -> Void) {
        RAWGAPI.getGameList(key: apiKey) { result in
            completionHandler(result)
        }
    }
}
