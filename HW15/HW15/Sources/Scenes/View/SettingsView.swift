//
//  SettingsView.swift
//  HW15
//
//  Created by  Евгений on 15.06.2022.
//

import UIKit

final class SettingsView: UIView {

        // MARK: - Configuration
        func configureView(with models: [SettingsGroup]) {
            self.models = models
            settingsTable.reloadData()
        }

        // MARK: - Private properties
        private var models = [SettingsGroup]()

        // MARK: - Views
        private lazy var settingsTable: UITableView = {
            let table = UITableView(frame: .zero, style: .grouped)
            table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
            table.translatesAutoresizingMaskIntoConstraints = false
            


            return table
        }()
}
