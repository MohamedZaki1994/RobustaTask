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
    func reloadRow(index: Int)
    func loadMore(flag: Bool)
}
class DashboardViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var loadingIndicator = UIActivityIndicatorView()
    var loadingMoreIndicator = UIActivityIndicatorView()
    var presenter: DashboardPresenter?
    var isLoadingMore = false
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
        let minX = view.frame.midX - (40/2)
        loadingMoreIndicator = UIActivityIndicatorView(frame: CGRect(x: minX, y: view.frame.height - 50.0, width: 40.0, height: 40.0))
        view.addSubview(loadingMoreIndicator)
    }
}

extension DashboardViewController: DashboardDelegate {
    func fillUIWithData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.isLoadingMore = true
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

    func reloadRow(index: Int) {
        let indexpath = IndexPath(row: index, section: 0)
        DispatchQueue.main.async {
            self.tableView.reloadRows(at: [indexpath], with: .none)
        }
    }
    func loadMore(flag: Bool) {
        if flag {
            loadingMoreIndicator.startAnimating()
        } else {
            loadingMoreIndicator.stopAnimating()
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
//        presenter?.fetchNames(at: indexPath.row)
        return dashboardCell

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.goToDetaieldScreen(with: indexPath.row)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter?.fetchNames(at: indexPath.row)
    }

}

extension DashboardViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableView.contentOffset.y + tableView.frame.height >= tableView.contentSize.height {
            if isLoadingMore {
                presenter?.loadMore()
                isLoadingMore = false
            }
        }
    }
}
