//
//  module.swift
//  ProjectDescriptionHelpers
//
//  Created by HuyTNH on 08/11/2023.
//

import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let moduleTemplate = Template(
    description: "Module template",
    attributes: [nameAttribute],
    items: {
        var items: [Template.Item] = []
        let folderPath = "Targets/MyApp/Sources/Presentation/Scenes/\(nameAttribute)"
        let viewController = Template.Item.file(path: "\(folderPath)/\(nameAttribute)ViewController.swift", templatePath: "../stencils/viewController.stencil")
        let xib = Template.Item.file(path: "\(folderPath)/\(nameAttribute)ViewController.xib", templatePath: "../stencils/xib.stencil")
        let viewModel = Template.Item.file(path: "\(folderPath)/\(nameAttribute)ViewModel.swift", templatePath: "../stencils/viewModel.stencil")
        items.append(contentsOf: [viewController, xib, viewModel])
        return items
    }()
)
