//
//  GameDetailPresenter.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 08/11/23.
//

protocol GameDetailPresenterProtocol {
    var gameDetailView: GameDetailViewProtocol? { get set }
    var gameDetailInteractor: GameDetailInteractorProtocol? { get set }
    var gameDetailRouter: GameDetailRouterProtocol? { get set }
}

class GameDetailPresenter: GameDetailPresenterProtocol {
    var gameDetailView: GameDetailViewProtocol?

    var gameDetailInteractor: GameDetailInteractorProtocol?

    var gameDetailRouter: GameDetailRouterProtocol?

    init(gameDetailView: GameDetailViewProtocol, gameDetailInteractor: GameDetailInteractorProtocol) {
        self.gameDetailView = gameDetailView
        self.gameDetailInteractor = gameDetailInteractor
    }
}
