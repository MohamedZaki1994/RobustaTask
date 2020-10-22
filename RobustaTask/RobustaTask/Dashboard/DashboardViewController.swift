//
//  DashboardViewController.swift
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/22/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import UIKit

protocol DashboardDelegate {
    func isLoading(flag: Bool)
    func fillUIWithData(data: [RepositoryModel])
}
class DashboardViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var loadingIndicator = UIActivityIndicatorView()
    var dataModel: [RepositoryModel]?
    var presenter: DashboardPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "DashboardTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DashboardTableViewCell")
        loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: (view.frame.width/2)-25, y: (view.frame.height/2)-25 , width: 50, height: 50))
        presenter = DashboardPresenter(viewController: self)
        presenter?.fetchDataService()
        view.addSubview(loadingIndicator)
    }
}

extension DashboardViewController: DashboardDelegate {
    func fillUIWithData(data: [RepositoryModel]) {
        dataModel = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func isLoading(flag: Bool) {
        DispatchQueue.main.async {
            if flag {
                self.loadingIndicator.startAnimating()
            } else {
                self.loadingIndicator.stopAnimating()
            }
        }
    }

}
extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardTableViewCell", for: indexPath)
        guard let dashboardCell = cell as? DashboardTableViewCell else {
            return cell
        }
        dashboardCell.repoName.text = dataModel?[indexPath.row].name
        dashboardCell.ownerName.text = dataModel?[indexPath.row].owner.onwerName
        dashboardCell.downloadImage(imageURL: dataModel?[indexPath.row].owner.avatarImageURL ?? "")
        return dashboardCell

    }

}
