//
//  GameListRouter.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 08/11/23.
//

import UIKit

protocol GameListRouterProtocol {
    func goToGameDetailPage(gameData: GameListEntity)
}

class GameListRouter: GameListRouterProtocol {
    weak var gameListViewController: UIViewController?

    init(gameListViewController: UIViewController) {
        self.gameListViewController = gameListViewController
    }

    func goToGameDetailPage(gameData: GameListEntity) {
        let gameDetailPage = GameDetailBuilder.build(gameData: gameData)
        gameDetailPage.title = gameData.name
        gameListViewController?.navigationController?.pushViewController(gameDetailPage, animated: true)
    }
}
