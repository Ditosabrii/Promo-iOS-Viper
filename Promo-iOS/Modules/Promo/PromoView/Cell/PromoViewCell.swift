//
//  PromoViewCell.swift
//  Promo-iOS
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit
import Kingfisher


class PromoTableViewCell: UITableViewCell {
    // MARK: - Properties
    var containerView: UIView!
    var promoImageView: UIImageView!
    var promoNameLabel: UILabel!
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Methods
    private func configureViews() {
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        
        promoImageView = UIImageView()
        promoImageView.translatesAutoresizingMaskIntoConstraints = false
        promoImageView.contentMode = .scaleAspectFill
        promoImageView.layer.cornerRadius = 12
        promoImageView.layer.masksToBounds = true
        containerView.addSubview(promoImageView)
        
        promoNameLabel = UILabel()
        promoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        promoNameLabel.textColor = .black
        promoNameLabel.font = UIFont.systemFont(ofSize: 16)
        containerView.addSubview(promoNameLabel)
        
        // Constraints
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            promoImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            promoImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            promoImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            promoImageView.heightAnchor.constraint(equalToConstant: 150), // Adjust the height as needed
            
            promoNameLabel.topAnchor.constraint(equalTo: promoImageView.bottomAnchor, constant: 8),
            promoNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            promoNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            promoNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
    }
    
    func configureContent(promo: PromoModel?) {
        if let imageUrl = promo?.imgFormartMediumUrl, let url = URL(string: imageUrl) {
            self.promoImageView.loadImage(fromURL: url)
        } else {
            self.promoImageView.backgroundColor = .darkGray
        }
        promoNameLabel.text = promo?.nama ?? "-"
    }
}


extension UIImageView {
    func loadImage(fromURL url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
