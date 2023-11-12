//
//  GameDetailView.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 08/11/23.
//

import UIKit

protocol GameDetailViewProtocol {
    var gameDetailPresenter: GameDetailPresenterProtocol? { get set }

    func showGameDetailData(_ gameData: GameListEntity, gameDetailData: RAWGGameDetailModel)

    func failedToFetchGameDetail(_ errorString: String)
}

class GameDetailViewController: UIViewController {

    var gameDetailPresenter: GameDetailPresenterProtocol?
    var gameWebsite: String?

    @IBOutlet weak var gameImageViewOutlet: UIImageView!
    @IBOutlet weak var developerNameLabelOutlet: UILabel!
    @IBOutlet weak var publisherNameLabelOutlet: UILabel!
    @IBOutlet weak var releaseDateLabelOutlet: UILabel!
    @IBOutlet weak var ratingLabelOutlet: UILabel!
    @IBOutlet weak var gameDescTextViewOutlet: UITextView!
    @IBOutlet weak var visitWebsiteButtonOutlet: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gameDetailPresenter?.willFetchGameDetail()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        gameImageViewOutlet.layer.cornerRadius = 15
        gameImageViewOutlet.layer.borderWidth = 1
        gameImageViewOutlet.layer.borderColor = UIColor.black.cgColor

        visitWebsiteButtonOutlet.layer.cornerRadius = 10
        visitWebsiteButtonOutlet.layer.borderWidth = 1
        visitWebsiteButtonOutlet.layer.borderColor = UIColor.systemBlue.cgColor
    }

    @IBAction func visitGameWebTapIn(_ sender: Any) {
        guard let gameWebsite = gameWebsite else { return }

        if gameWebsite == "" {
            CustomToast.show(message: "No Website Provided", bgColor: .systemRed, controller: self)
        } else {
            gameDetailPresenter?.willGoToGameWebsite(gameWebsite)
        }
    }
}

extension GameDetailViewController: GameDetailViewProtocol {
    func failedToFetchGameDetail(_ errorString: String) {
        let alert = UIAlertController(title: "Error", message: "Failed to fetch game detail: \(errorString)", preferredStyle: .alert)

        let retryButton = UIAlertAction(title: "Retry", style: .default) { _ in
            self.gameDetailPresenter?.willFetchGameDetail()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)

        alert.addAction(retryButton)
        alert.addAction(cancelButton)

        self.present(alert, animated: true)
    }

    func showGameDetailData(_ gameData: GameListEntity, gameDetailData: RAWGGameDetailModel) {

        gameWebsite = gameDetailData.website

        gameImageViewOutlet.setImageFrom(gameData.backgroundImage)

        let gameDev = gameDetailData.developers.map { $0.name }.joined(separator: ", ")
        developerNameLabelOutlet.text = "Developer: \(gameDev)"

        let gamePub = gameDetailData.publishers.map { $0.name }.joined(separator: ", ")
        publisherNameLabelOutlet.text = "Publisher: \(gamePub)"

        releaseDateLabelOutlet.text = "Release Date: \(gameData.released.formattedDate())"
        ratingLabelOutlet.text = "Game Rating: \(gameDetailData.esrbRating.name)"
        gameDescTextViewOutlet.text = gameDetailData.descriptionRaw
    }
}
