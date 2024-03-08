//
//  SettingsViewController.swift
//  MyApp
//
//  Created by HuyTNH on 09/03/2024.
//  Copyright © 2024 com.thehuytong. All rights reserved.
//

import ScrollStackController
import UIKit

class SettingsViewController: UIViewController, ScrollStackContainableController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
    }

    func scrollStackRowSizeForAxis(_ axis: NSLayoutConstraint.Axis, row: ScrollStackController.ScrollStackRow, in stackView: ScrollStackController.ScrollStack) -> ScrollStackController.ScrollStack.ControllerSize? {
        return .fitLayoutForAxis
    }

    func reloadContentFromStackView(stackView: ScrollStackController.ScrollStack, row: ScrollStackController.ScrollStackRow, animated: Bool) {}

    override func updateViewConstraints() {
        tableViewHeightConstraint.constant = tableView.contentSize.height // the size of the table as the size of its content
        view.height(constant: nil) // cancel any height constraint already in place in the view
        super.updateViewConstraints()
    }
}

extension SettingsViewController: UITableViewDelegate {
}

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .systemRed
        var config = UIListContentConfiguration.cell()
        config.text = "Test 1"
        config.secondaryText = "Test 2"
        cell.contentConfiguration = config
        return cell
    }
    
    
}
