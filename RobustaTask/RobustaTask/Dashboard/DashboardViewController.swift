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
    func fillUIWithData()
}
class DashboardViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var loadingIndicator = UIActivityIndicatorView()
    var presenter: DashboardPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupLoadingIndicator()
        presenter = DashboardPresenter(viewController: self)
        presenter?.fetchDataService()
    }

    func registerCell() {
        let nib = UINib(nibName: "DashboardTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DashboardTableViewCell")
    }

    func setupLoadingIndicator() {
        loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: (view.frame.width/2)-25, y: (view.frame.height/2)-25 , width: 50, height: 50))
        view.addSubview(loadingIndicator)
    }
}

extension DashboardViewController: DashboardDelegate {
    func fillUIWithData() {
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
        return presenter?.numberOfDataSource() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardTableViewCell", for: indexPath)
        guard let dashboardCell = cell as? DashboardTableViewCell else {
            return cell
        }
        dashboardCell.repoName.text = presenter?.repoNameAtIndex(index: indexPath.row)
        dashboardCell.ownerName.text = presenter?.OwnerNameAtIndex(index: indexPath.row)
        dashboardCell.downloadImage(imageURL: presenter?.imageURLAtIndex(index: indexPath.row) ?? "")
        return dashboardCell

    }

}
