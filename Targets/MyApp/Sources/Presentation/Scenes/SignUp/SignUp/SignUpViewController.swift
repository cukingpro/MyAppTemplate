import UIKit
import BEMCheckBox

final class SignUpViewController: BaseViewController<SignUpViewModel> {
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTextfield: AppTextField!
    
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextfield: AppTextField!
    
    @IBOutlet private weak var checkBox: BEMCheckBox!
    @IBOutlet private weak var termsLabel: UILabel!
    
    @IBOutlet private weak var haveAccountLabel: UILabel!
    @IBOutlet private weak var logInButton: AppTextButton!
    
    @IBOutlet private weak var continueWithLabel: UILabel!
    
    @IBOutlet private weak var googleButton: AppSecondaryButton!
    @IBOutlet private weak var appleButton: AppSecondaryButton!
    @IBOutlet private weak var facebookButton: AppSecondaryButton!
    
    @IBOutlet private weak var continueButton: AppPrimaryButton!
    
    var group: BEMCheckBoxGroup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        super.configureUI()
        title = "Hello there 👋"
        
        descriptionLabel.do {
            $0.font = MyAppFontFamily.Urbanist.regular.font(size: 18)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.text = "Please enter your email & password to create an account."
            $0.numberOfLines = 0
        }
        
        emailLabel.do {
            $0.font = MyAppFontFamily.Urbanist.bold.font(size: 16)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.text = "Email address"
        }
        
        emailTextfield.do {
            $0.setPlaceHolder(text: "Email")
            $0.textType = .emailAddress
        }
        
        passwordLabel.do {
            $0.font = MyAppFontFamily.Urbanist.bold.font(size: 16)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.text = "Password"
        }
        
        passwordTextfield.do {
            $0.setPlaceHolder(text: "Password")
            $0.textType = .password
        }
        
        checkBox.configureUI()
        
        termsLabel.do {
            $0.font = MyAppFontFamily.Urbanist.semiBold.font(size: 16)
            $0.textColor = MyAppAsset.Colors.primary.color
            $0.text = "I agree to Qubiko AI Public Agreement, Terms, & Privacy Policy."
            $0.numberOfLines = 0
        }
        
        haveAccountLabel.do {
            $0.numberOfLines = 1
            $0.font = MyAppFontFamily.Urbanist.medium.font(size: 16)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.text = "Already have an account?"
        }
        
        logInButton.setTitle(MyAppStrings.login)
        
        continueWithLabel.do {
            $0.numberOfLines = 0
            $0.font = MyAppFontFamily.Urbanist.medium.font(size: 18)
            $0.textColor = MyAppAsset.Colors.greyscale700.color
            $0.text = MyAppStrings.continueWith
            $0.textAlignment = .center
        }
        
        googleButton.setImageForAllStates(MyAppAsset.Images.google.image)
        appleButton.setImageForAllStates(MyAppAsset.Images.apple.image)
        facebookButton.setImageForAllStates(MyAppAsset.Images.facebook.image)
        
        continueButton.setTitle("Continue")
        
    }
}
