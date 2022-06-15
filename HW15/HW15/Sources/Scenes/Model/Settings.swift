//
//  Settings.swift
//  HW15
//
//  Created by  Евгений on 15.06.2022.
//

import UIKit

struct SettingsGroup {
    let id: Int
    let settings: [Setting]
}

struct Setting {
    let name: String
    let icon: UIImage?
    let iconBackground: UIColor?
    let isChecked: Bool?
    let rightText: String?
    let badge: Int?
}
