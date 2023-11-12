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

    func willFetchGameDetail()

    func willGoToGameWebsite(_ gameWebsite: String)
}

class GameDetailPresenter: GameDetailPresenterProtocol {
    var gameDetailView: GameDetailViewProtocol?

    var gameDetailInteractor: GameDetailInteractorProtocol?

    var gameDetailRouter: GameDetailRouterProtocol?

    var gameData: GameListEntity?

    init(gameDetailView: GameDetailViewProtocol, gameDetailInteractor: GameDetailInteractorProtocol, gameData: GameListEntity) {
        self.gameDetailView = gameDetailView
        self.gameDetailInteractor = gameDetailInteractor
        self.gameData = gameData
    }

    func willFetchGameDetail() {

        guard let gameData = gameData else { return }

        gameDetailInteractor?.fetchGameDetail(id: String(gameData.id), completionHandler: { result in
            switch result {
            case .success(let gameDetailData):
                self.gameDetailView?.showGameDetailData(gameData, gameDetailData: gameDetailData)
            case .failure(let error):
                self.gameDetailView?.failedToFetchGameDetail(error.localizedDescription)
            }
        })
    }

    func willGoToGameWebsite(_ gameWebsite: String) {
        gameDetailRouter?.goToGameWebsite(gameWebsite)
    }
}
