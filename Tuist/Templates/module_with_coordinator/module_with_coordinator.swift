//
//  module_with_coordinator.swift
//  Templates
//
//  Created by HuyTNH on 08/11/2023.
//

import ProjectDescription

let moduleWithCoordinator_nameAttribute: Template.Attribute = .required("name")

let moduleWithCoordinatorTemplate = Template(
    description: "Module with coordinator template",
    attributes: [moduleWithCoordinator_nameAttribute],
    items: {
        var items: [Template.Item] = []
        let folderPath = "Targets/MyApp/Sources/Presentation/Scenes/\(moduleWithCoordinator_nameAttribute)"
        let viewController = Template.Item.file(path: "\(folderPath)/\(moduleWithCoordinator_nameAttribute)ViewController.swift", templatePath: "../stencils/viewController.stencil")
        let xib = Template.Item.file(path: "\(folderPath)/\(moduleWithCoordinator_nameAttribute)ViewController.xib", templatePath: "../stencils/xib.stencil")
        let viewModel = Template.Item.file(path: "\(folderPath)/\(moduleWithCoordinator_nameAttribute)ViewModel.swift", templatePath: "../stencils/viewModel.stencil")
        let coordinator = Template.Item.file(path: "\(folderPath)/\(moduleWithCoordinator_nameAttribute)Coordinator.swift", templatePath: "../stencils/coordinator.stencil")
        items.append(contentsOf: [viewController, xib, viewModel, coordinator])
        return items
    }()
)
