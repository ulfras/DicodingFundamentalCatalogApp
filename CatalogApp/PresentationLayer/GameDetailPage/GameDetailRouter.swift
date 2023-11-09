//
//  GameDetailRouter.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 08/11/23.
//

import UIKit

protocol GameDetailRouterProtocol {

}

class GameDetailRouter: GameDetailRouterProtocol {

    weak var gameDetailViewController: UIViewController?

    init(gameDetailViewController: UIViewController) {
        self.gameDetailViewController = gameDetailViewController
    }
}
