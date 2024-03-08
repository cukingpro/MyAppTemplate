import ProjectDescription

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
        Target.target(
            name: "MyApp",
            destinations: .iOS,
            product: .app,
            bundleId: "com.thehuytong.myapp",
            deploymentTargets: .iOS("15.0"),
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
                .external(name: "ScrollStackController"),
                .external(name: "SnapKit"),
            ]
        ),
    ]
)
