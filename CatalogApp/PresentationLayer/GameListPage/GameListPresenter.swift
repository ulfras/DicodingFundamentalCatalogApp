//
//  GameListPresenter.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 08/11/23.
//

protocol GameListPresenterProtocol {
    var gameListView: GameListViewProtocol? { get set }
    var gameListInteractor: GameListInteractorProtocol? { get set }
    var gameListRouter: GameListRouterProtocol? { get set }
}

class GameListPresenter: GameListPresenterProtocol {
    var gameListView: GameListViewProtocol?

    var gameListInteractor: GameListInteractorProtocol?

    var gameListRouter: GameListRouterProtocol?

    init(gameListView: GameListViewProtocol, gameListInteractor: GameListInteractorProtocol) {
        self.gameListView = gameListView
        self.gameListInteractor = gameListInteractor
    }
}
