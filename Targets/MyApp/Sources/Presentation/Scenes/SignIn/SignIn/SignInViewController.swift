import BEMCheckBox
import UIKit

final class SignInViewController: BaseViewController<SignInViewModel> {
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTextfield: AppTextField!
    
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextfield: AppTextField!
    
    @IBOutlet private weak var checkBox: BEMCheckBox!
    @IBOutlet private weak var rememberMeLabel: UILabel!
    
    @IBOutlet private weak var forgotPasswordButton: AppTextButton!
    @IBOutlet private weak var dontHaveAccountLabel: UILabel!
    @IBOutlet private weak var signUpButton: AppTextButton!
    
    @IBOutlet private weak var continueWithLabel: UILabel!
    
    @IBOutlet private weak var googleButton: AppSecondaryButton!
    @IBOutlet private weak var appleButton: AppSecondaryButton!
    @IBOutlet private weak var facebookButton: AppSecondaryButton!
    
    @IBOutlet private weak var loginButton: AppPrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        super.configureUI()
        title = "Welcome back 👋"
        
        descriptionLabel.do {
            $0.font = MyAppFontFamily.Urbanist.regular.font(size: 18)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.text = "Please enter your email & password to log in."
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
        
        rememberMeLabel.do {
            $0.font = MyAppFontFamily.Urbanist.semiBold.font(size: 16)
            $0.textColor = MyAppAsset.Colors.primary.color
            $0.text = "Remember me"
            $0.numberOfLines = 0
        }
        
        forgotPasswordButton.setTitle("Forgot password?")
        
        dontHaveAccountLabel.do {
            $0.numberOfLines = 1
            $0.font = MyAppFontFamily.Urbanist.medium.font(size: 16)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.text = "Don’t have an account?"
        }
        
        signUpButton.setTitle(MyAppStrings.signup)
        
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
        
        loginButton.setTitle(MyAppStrings.login)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        let input = SignInViewModel.Input(forgotPasswordTrigger: forgotPasswordButton.rx.tap.asDriver(),
                                          signUpTrigger: signUpButton.rx.tap.asDriver(),
                                          loginTrigger: loginButton.rx.tap.asDriver())
        _ = viewModel.transform(input)
    }
}
