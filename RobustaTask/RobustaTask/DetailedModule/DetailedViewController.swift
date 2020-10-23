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
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var ownerImage: UIImageView!
    var presenter: DetailedPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self
        presenter?.fetchData()
    }

    func downloadImage(imageURL: String) {
           let url = URL(string: imageURL)
           ownerImage.kf.setImage(with: url)
       }
    
}

extension DetailedViewController: DetailedDelegate {
    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.repoName.text = self?.presenter?.repo?.name
            self?.ownerName.text = self?.presenter?.repo?.owner.ownerName
            self?.desc.text = self?.presenter?.repo?.desc
            if let url = self?.presenter?.repo?.owner.avatarImageURL {
                self?.downloadImage(imageURL: url)
            }
        }
    }
}
