//
//  GameListInteractor.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 08/11/23.
//

protocol GameListInteractorProtocol {
    var gameListPresenter: GameListPresenterProtocol? { get set }
}

class GameListInteractor: GameListInteractorProtocol {
    var gameListPresenter: GameListPresenterProtocol?
}
