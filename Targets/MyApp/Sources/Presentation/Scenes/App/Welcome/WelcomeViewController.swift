import UIKit

class WelcomeViewController: BaseViewController<WelcomeViewModel> {
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var socialLabel: UILabel!
    
    @IBOutlet private weak var loginButton: AppPrimaryButton!
    @IBOutlet private weak var signupButton: AppSecondaryButton!
    
    @IBOutlet private weak var googleButton: AppSecondaryButton!
    @IBOutlet private weak var appleButton: AppSecondaryButton!
    @IBOutlet private weak var facebookButton: AppSecondaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        super.configureUI()
        
        welcomeLabel.do {
            $0.textAlignment = .center
            $0.numberOfLines = 0
            $0.font = MyAppFontFamily.Urbanist.bold.font(size: 40)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.text = MyAppStrings.welcome
        }
        
        socialLabel.do {
            $0.numberOfLines = 0
            $0.font = MyAppFontFamily.Urbanist.medium.font(size: 18)
            $0.textColor = MyAppAsset.Colors.greyscale700.color
            $0.text = MyAppStrings.continueWith
        }
        
        loginButton.do {
            $0.setTitle(MyAppStrings.login)
        }
        
        signupButton.do {
            $0.setTitle(MyAppStrings.signup)
        }
        
        googleButton.setImageForAllStates(MyAppAsset.Images.google.image)
        appleButton.setImageForAllStates(MyAppAsset.Images.apple.image)
        facebookButton.setImageForAllStates(MyAppAsset.Images.facebook.image)
    }
}
