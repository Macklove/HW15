//
//  SettingsTableViewCell.swift
//  HW15
//
//  Created by  Евгений on 15.06.2022.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    static let identifier = "SettingsTableViewCell"
    
// MARK: - Views

    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let icon: UIImageView = {
        let img = UIImageView()
        img.tintColor = .white
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.tag = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var badgeContainer: UIView?
    private var additionalLabel: UILabel?
    
    private var toggle: UISwitch?
}

// MARK: - Constants
extension SettingsTableViewCell {
    
    enum Metric {
        static let horizontalOffset: CGFloat = 16
        static let spaceBetweenObjects: CGFloat = 15
        static let offsetBackgroundIcon: CGFloat = 12
        static let multiplierIcon: CGFloat = 1.5
        static let multiplierCornerRadiusBadge: CGFloat = 0.8
    }
}
