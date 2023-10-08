//
//  PromoDetailView.swift
//  Promo-iOS
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

class PromoDetailViewController: UIViewController {
    // MARK: - Properties
    var presenter: PromoDetailViewToPresenterProtocol?
    var promoImageView: UIImageView!
    var promoNameLabel: UILabel!
    var promoDescriptionLabel: UILabel!
    var promoLocationLabel: UILabel!
    var promoCreatedAtLabel: UILabel!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.updateView()
    }

    // MARK: - Methods
    private func setupUI() {
        promoImageView = UIImageView()
        promoImageView.translatesAutoresizingMaskIntoConstraints = false
        promoImageView.contentMode = .scaleAspectFill
        view.addSubview(promoImageView)
        
        promoNameLabel = UILabel()
        promoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        promoNameLabel.textColor = .black
        promoNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(promoNameLabel)
        
        promoDescriptionLabel = UILabel()
        promoDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        promoDescriptionLabel.textColor = .black
        promoDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        promoDescriptionLabel.numberOfLines = 0
        view.addSubview(promoDescriptionLabel)
        
        promoLocationLabel = UILabel()
        promoLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        promoLocationLabel.textColor = .black
        promoLocationLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(promoLocationLabel)
        
        promoCreatedAtLabel = UILabel()
        promoCreatedAtLabel.translatesAutoresizingMaskIntoConstraints = false
        promoCreatedAtLabel.textColor = .black
        promoCreatedAtLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(promoCreatedAtLabel)
        
        NSLayoutConstraint.activate([
            promoImageView.topAnchor.constraint(equalTo: view.topAnchor),
            promoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            promoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            promoImageView.heightAnchor.constraint(equalToConstant: 200), // Adjust the height as needed
            
            promoNameLabel.topAnchor.constraint(equalTo: promoImageView.bottomAnchor, constant: 16),
            promoNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            promoNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            promoDescriptionLabel.topAnchor.constraint(equalTo: promoNameLabel.bottomAnchor, constant: 16),
            promoDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            promoDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            promoLocationLabel.topAnchor.constraint(equalTo: promoDescriptionLabel.bottomAnchor, constant: 16),
            promoLocationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            promoLocationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            promoCreatedAtLabel.topAnchor.constraint(equalTo: promoLocationLabel.bottomAnchor, constant: 16),
            promoCreatedAtLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            promoCreatedAtLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}

// MARK: - PromoDetailPresenterToViewProtocol
extension PromoDetailViewController: PromoDetailPresenterToViewProtocol {
    func showPromo() {
        let promo = presenter?.getPromo()
        if let imageUrl = promo?.imgFormartMediumUrl, let url = URL(string: imageUrl) {
            self.promoImageView.loadImage(fromURL: url)
        } else {
            self.promoImageView.backgroundColor = .darkGray
        }
        promoNameLabel.text = promo?.nama
        promoDescriptionLabel.text = promo?.desc
        promoLocationLabel.text = promo?.lokasi
        promoCreatedAtLabel.text = promo?.createdAt
    }

    func showError() {
        let alert = UIAlertController(title: "Oops!", message: "Failed fetching promo", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
