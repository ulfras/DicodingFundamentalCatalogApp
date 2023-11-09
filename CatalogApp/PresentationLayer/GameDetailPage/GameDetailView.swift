//
//  GameDetailView.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 08/11/23.
//

import UIKit

protocol GameDetailViewProtocol {
    var gameDetailPresenter: GameDetailPresenterProtocol? { get set }
}

class GameDetailViewController: UIViewController {

    var gameDetailPresenter: GameDetailPresenterProtocol?
}

extension GameDetailViewController: GameDetailViewProtocol {

}
