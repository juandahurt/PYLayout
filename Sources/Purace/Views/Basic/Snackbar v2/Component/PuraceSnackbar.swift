//
//  PuraceSnackbar.swift
//  
//
//  Created by Juan Hurtado on 19/11/22.
//

import UIKit

// TODO: update name to `PuraceSnackbarView`
class PuraceSnackbar: UIView, NibLoadable {
    @IBOutlet var contentView: UIView!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var actionHandler: (() -> Void)?
    
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
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setType(_ type: PuraceSnackbarType) {
        switch type {
        case .info:
            contentView.backgroundColor = .init(PuraceStyle.Color.G1)
        case .alert:
            contentView.backgroundColor = .init(PuraceStyle.Color.B1)
        case .error:
            contentView.backgroundColor = .init(PuraceStyle.Color.R1)
        }
    }
    
    func setAction(withTitle title: String?, _ handler: (() -> Void)?) {
        actionButton.setTitle(title, for: .normal)
        if title != nil {
            actionHandler = handler
        }
    }
    
    @IBAction private func onActionButtonTap(_ sender: UIButton) {
        actionHandler?()
    }
}

// MARK: - Config constants
extension PuraceSnackbar {
    static let height: CGFloat = 60
    static let padding: CGFloat = 20
}
