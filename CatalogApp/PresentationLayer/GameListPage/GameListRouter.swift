//
//  GameListRouter.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 08/11/23.
//

import UIKit

protocol GameListRouterProtocol {

}

class GameListRouter: GameListRouterProtocol {
    weak var gameListViewController: UIViewController?

    init(gameListViewController: UIViewController) {
        self.gameListViewController = gameListViewController
    }
}
