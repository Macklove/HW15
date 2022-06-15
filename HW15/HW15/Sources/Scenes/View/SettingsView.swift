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
            
            table.delegate = self
            table.dataSource = self

            return table
        }()
}

// MARK: - UITableViewDataSource

extension SettingsView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].settings.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = models[indexPath.section].settings[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier,
                                                 for: indexPath) as! SettingsTableViewCell
        cell.settingItem = setting
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SettingsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Нажата ячейка \(models[indexPath.section].settings[indexPath.item].name)")
    }
}
