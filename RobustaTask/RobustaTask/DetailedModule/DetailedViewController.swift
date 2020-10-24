//
//  DetailedViewController.swift
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/23/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import UIKit
import Kingfisher

protocol DetailedDelegate {
    func updateUI()
}
class DetailedViewController: UIViewController {

    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var numberOfFollowers: UILabel!
    @IBOutlet weak var numberOfFollowing: UILabel!
    @IBOutlet weak var publicRepos: UILabel!
    @IBOutlet weak var ownerImage: UIImageView!
    var presenter: DetailedPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigationBar()
        setupGradientLayer()
        presenter?.delegate = self
        presenter?.fetchData()
    }

    func prepareNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func downloadImage(imageURL: String) {
           let url = URL(string: imageURL)
           ownerImage.kf.setImage(with: url)
       }
    
}

extension DetailedViewController: DetailedDelegate {
    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.repoName.text = self?.presenter?.repoName()
            self?.ownerName.text = self?.presenter?.onwerName()
            self?.city.text = self?.presenter?.getCity()
            self?.numberOfFollowers.text = self?.presenter?.getNumberOfFollowers()
            self?.numberOfFollowing.text = self?.presenter?.getNumberOfFollowing()
            self?.publicRepos.text = self?.presenter?.getNumberOfPublicRepos()
            self?.desc.text = self?.presenter?.repo?.desc
            if let url = self?.presenter?.repo?.owner.avatarImageURL {
                self?.downloadImage(imageURL: url)
            }
        }
    }
}
