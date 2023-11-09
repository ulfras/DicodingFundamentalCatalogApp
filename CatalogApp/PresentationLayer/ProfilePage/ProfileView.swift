//
//  ProfileView.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 08/11/23.
//

import UIKit

protocol ProfileViewProtocol {
    var profilePresenter: ProfilePresenterProtocol? { get set }
}

class ProfileViewController: UIViewController {

    var profilePresenter: ProfilePresenterProtocol?
}

extension ProfileViewController: ProfileViewProtocol {

}
