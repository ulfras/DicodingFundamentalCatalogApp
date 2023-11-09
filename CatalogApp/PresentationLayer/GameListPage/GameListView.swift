//
//  GameListViewController.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 08/11/23.
//

import UIKit

protocol GameListViewProtocol {
    var gameListPresenter: GameListPresenterProtocol? { get set }
}

class GameListViewController: UIViewController {

    var gameListPresenter: GameListPresenterProtocol?

    @IBOutlet weak var gameListTableViewOutlet: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Game List"

        gameListTableViewOutlet.delegate = self
        gameListTableViewOutlet.dataSource = self

        gameListTableViewOutlet.register(UINib(nibName: "GameListCell", bundle: Bundle.main), forCellReuseIdentifier: "GameListCell")
    }
}

extension GameListViewController: GameListViewProtocol {

}

extension GameListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: "GameListCell", for: indexPath)

        guard let cell = reusableCell as? GameListCell else { return reusableCell }

        return cell
    }
}

extension GameListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
