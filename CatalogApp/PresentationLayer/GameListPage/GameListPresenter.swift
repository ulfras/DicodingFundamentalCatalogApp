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

    func willFetchGameList()

    func willGoToGameDetailPage(gameData: GameListEntity)
}

class GameListPresenter: GameListPresenterProtocol {
    var gameListView: GameListViewProtocol?

    var gameListInteractor: GameListInteractorProtocol?

    var gameListRouter: GameListRouterProtocol?

    init(gameListView: GameListViewProtocol, gameListInteractor: GameListInteractorProtocol) {
        self.gameListView = gameListView
        self.gameListInteractor = gameListInteractor
    }

    func willFetchGameList() {
        gameListInteractor?.fetchGameList { result in
            switch result {
            case .success(let resultData):

                var gameListData: [GameListEntity] = []

                for resultDatum in resultData.results {
                    gameListData.append(
                        GameListEntity(
                            id: resultDatum.id,
                            name: resultDatum.name,
                            released: resultDatum.released,
                            backgroundImage: resultDatum.backgroundImage,
                            rating: resultDatum.rating)
                    )
                }

                self.gameListView?.showGameList(gameListData)
            case .failure(let error):
                self.gameListView?.failedToFetchGameList(error.localizedDescription)
            }
        }
    }

    func willGoToGameDetailPage(gameData: GameListEntity) {
        gameListRouter?.goToGameDetailPage(gameData: gameData)
    }
}
