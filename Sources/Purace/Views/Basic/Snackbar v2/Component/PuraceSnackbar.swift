//
//  PuraceSnackbar.swift
//  
//
//  Created by Juan Hurtado on 19/11/22.
//

import UIKit

class PuraceSnackbar: UIView, NibLoadable {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
        translatesAutoresizingMaskIntoConstraints = false
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        titleLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        titleLabel.textColor = .white
        actionButton.titleLabel?.textColor = .white
        actionButton.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 14)
        contentView.layer.cornerRadius = 10
    }
    
    func setup(with title: String, type: PuraceSnackbarType) {
        switch type {
        case .info:
            contentView.backgroundColor = .init(PuraceStyle.Color.G1)
        case .alert:
            contentView.backgroundColor = .init(PuraceStyle.Color.B1)
        case .error:
            contentView.backgroundColor = .init(PuraceStyle.Color.R1)
        }
        titleLabel.text = title
    }
}

// MARK: - Config constants
extension PuraceSnackbar {
    static let height: CGFloat = 60
    static let padding: CGFloat = 20
}
