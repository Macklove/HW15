//
//  ViewController.swift
//  HW15
//
//  Created by  Евгений on 15.06.2022.
//

import UIKit

class SettingsController: UIViewController {

    var model: SettingsModel?

    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }

// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view = SettingsView()
        model = SettingsModel()
    }

}


