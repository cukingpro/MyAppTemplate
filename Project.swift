import MyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

/*
                +-------------+
                |             |
                |     App     | Contains MyApp App target and MyApp unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
//let project = Project.app(name: "MyApp",
//                          platform: .iOS,
//                          additionalTargets: ["MyAppKit", "MyAppUI"])

let infoPlist: [String: Plist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen",
]

let project = Project(
    name: "MyApp",
    organizationName: "com.thehuytong",
    targets: [
        Target(
            name: "MyApp",
            platform: .iOS,
            product: .app,
            bundleId: "com.thehuytong.myapp",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: "Targets/MyApp/Sources/**",
            resources: [
                "Targets/MyApp/Resources/**",
                "Targets/MyApp/Sources/**/*.xib",
            ],
            dependencies: [
                .external(name: "XCoordinator"),
                .external(name: "RxSwift"),
                .external(name: "SwifterSwift"),
                .external(name: "RxDataSources"),
                .external(name: "RxSwiftExt"),
                .external(name: "RxViewController"),
                .external(name: "RxReachability"),
                .external(name: "Moya"),
                .external(name: "IQKeyboardManagerSwift"),
                .external(name: "NSObject-Rx"),
                .external(name: "ProgressHUD"),
                .external(name: "Then"),
                .external(name: "BEMCheckBox"),
                .external(name: "PhoneNumberKit"),
                .external(name: "CHIOTPField"),
            ]
        ),
    ]
)
