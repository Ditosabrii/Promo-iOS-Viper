//
//  PromoViewController.swift
//  Promo-iOS
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

class PromoListViewController: UIViewController {
    // MARK: - Properties
    var presenter: PromoListViewToPresenterProtocol?
    var promoListTableView: UITableView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Promo"
        setupTableView()
        presenter?.updateView()
    }

    // MARK: - Methods
    private func setupTableView() {
        promoListTableView = UITableView()
        promoListTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(promoListTableView)
        
        NSLayoutConstraint.activate([
            promoListTableView.topAnchor.constraint(equalTo: view.topAnchor),
            promoListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            promoListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            promoListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        promoListTableView.dataSource = self
        promoListTableView.delegate = self
        promoListTableView.register(UINib(nibName: "PromoTableViewCell", bundle: .main), forCellReuseIdentifier: "PromoTableViewCell")
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension PromoListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getPromoListCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PromoTableViewCell", for: indexPath) as? PromoTableViewCell else {
            return UITableViewCell()
        }
        let promo = presenter?.getPromo(index: indexPath.row)
        cell.configureContent(promo: promo)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedPromo = presenter?.getPromo(index: indexPath.row) else {
            return
        }
        let promoDetailViewController = PromoDetailRouter.createModule(with: selectedPromo)
        navigationController?.pushViewController(promoDetailViewController, animated: true)
    }
}

// MARK: - PromoPresenterToViewProtocol
extension PromoListViewController: PromoListPresenterToViewProtocol {
    func showPromo() {
        promoListTableView.reloadData()
    }

    func showError() {
        let alert = UIAlertController(title: "Oops!", message: "Failed fetching promo", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

