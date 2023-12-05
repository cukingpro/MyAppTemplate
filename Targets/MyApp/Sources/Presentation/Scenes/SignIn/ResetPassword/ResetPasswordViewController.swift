import UIKit

class ResetPasswordViewController: BaseViewController<ResetPasswordViewModel> {
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTextfield: AppTextField!
    
    @IBOutlet private weak var continueButton: AppPrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        super.configureUI()
        title = "Reset your password 🔑"
        
        descriptionLabel.do {
            $0.font = MyAppFontFamily.Urbanist.regular.font(size: 18)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.text = "Please enter your email and we will send an OTP code in the next step to reset your password."
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
        
        continueButton.setTitle("Continue")
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        let input = ResetPasswordViewModel.Input(continueTrigger: continueButton.rx.tap.asDriver())
        _ = viewModel.transform(input)
    }
}
