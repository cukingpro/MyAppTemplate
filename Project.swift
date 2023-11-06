import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

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
    "UILaunchStoryboardName": "LaunchScreen"
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
            infoPlist: .extendingDefault(with: infoPlist),
            sources: "Targets/MyApp/Sources/**",
            resources: ["Targets/MyApp/Resources/**"],
            dependencies: [
                .external(name: "Alamofire")
            ]
        ),
    ]
)
