import IQKeyboardManagerSwift
import ProgressHUD
import SwifterSwift
import UIKit

typealias HUD = ProgressHUD

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    let appCoordinator = AppCoordinator().strongRouter

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        configure()
        return true
    }
}

// MARK: - Configure Third Party

private extension AppDelegate {
    private func configure() {
        configureIQKeyboardManager()
        configureLoadingView()
        configureRoot()
    }

    func configureRoot() {
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator.setRoot(for: window!)
    }

    func configureIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardManager.shared.enableAutoToolbar = false
    }

    func configureLoadingView() {
        HUD.animationType = .circleDotSpinFade
        HUD.colorAnimation = MyAppAsset.Colors.primary.color
    }
}
