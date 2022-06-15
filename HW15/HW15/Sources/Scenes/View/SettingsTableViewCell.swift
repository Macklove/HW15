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

    var settingItem: Setting? {
        didSet {
            guard let item = settingItem else { return }
            
            label.text = item.name
            
            if let bgColor = item.iconBackground {
                iconContainer.backgroundColor = bgColor
            }
            
            if let iconItem = item.icon {
                icon.image = iconItem
            }
            
            if let toggleItem = item.isChecked {
                if toggle == nil {
                    toggle = UISwitch()
                    toggle?.translatesAutoresizingMaskIntoConstraints = false
                    toggle?.setOn(toggleItem, animated: true)
                    toggle?.addTarget(self, action: #selector(switchTap), for: .valueChanged)
                    if let toggle = toggle {
                        contentView.addSubview(toggle)
                    }
                }
            } else {
                accessoryType = .disclosureIndicator // стрелочка справа
            }
            if let badge = item.badge {
                badgeContainer = UIView()
                badgeContainer?.clipsToBounds = true
                badgeContainer?.layer.cornerRadius = (additionalLabel?.font.pointSize ?? 17) * Metric.multiplierCornerRadiusBadge
                badgeContainer?.backgroundColor = .systemRed
                badgeContainer?.translatesAutoresizingMaskIntoConstraints = false
                
                additionalLabel = UILabel()
                additionalLabel?.textAlignment = .center
                additionalLabel?.textColor = .white
                additionalLabel?.backgroundColor = .systemRed
                additionalLabel?.text = String(badge)
                additionalLabel?.translatesAutoresizingMaskIntoConstraints = false
                
                if let additionalLabel = additionalLabel {
                    badgeContainer?.addSubview(additionalLabel)
                }
                if let badgeContainer = badgeContainer {
                    contentView.addSubview(badgeContainer)
                }
            } else if let text = item.rightText {
                additionalLabel = UILabel()
                additionalLabel?.textAlignment = .right
                additionalLabel?.tintColor = .systemGray
                additionalLabel?.text = text
                additionalLabel?.translatesAutoresizingMaskIntoConstraints = false
                if let additionalLabel = additionalLabel {
                    contentView.addSubview(additionalLabel)
                }
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        icon.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
    }
    
    private func setupLayout() {
    }
    //MARK: - Actions
    
    @objc func switchTap(_ sender: UISwitch) {
        if let label = (sender.superview?.viewWithTag(1) as? UILabel) {
            print("\(label.text ?? "Unknown switch") changed to \(sender.isOn)")
        }
    }
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

