import UIKit

class OtpCodeVerificationViewController: BaseViewController<OtpCodeVerificationViewModel> {
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var otpFieldContainer: UIView!
    private lazy var otpField = AppOTPField()
    
    @IBOutlet private weak var didntReceiveEmailLabel: UILabel!
    @IBOutlet private weak var resendLabel: UILabel!
    
    @IBOutlet private weak var continueButton: AppPrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        super.configureUI()
        title = "OTP code verification 🔐"
        
        descriptionLabel.do {
            $0.font = MyAppFontFamily.Urbanist.regular.font(size: 18)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.text = "We have sent an OTP code to your email and********ley@yourdomain.com. Enter the OTP code below to verify."
            $0.numberOfLines = 0
        }
        
        otpFieldContainer.addSubview(otpField)
        otpField.fillToSuperview()
        
        didntReceiveEmailLabel.do {
            $0.numberOfLines = 1
            $0.font = MyAppFontFamily.Urbanist.medium.font(size: 16)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.textAlignment = .center
            $0.text = "Didn't receive email?"
        }
        
        resendLabel.do {
            $0.numberOfLines = 1
            $0.font = MyAppFontFamily.Urbanist.medium.font(size: 16)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.textAlignment = .center
            $0.text = "You can resend code in 55 s"
        }
        
        continueButton.setTitle("Continue")
    }
    
    override func bindViewModel() {
        super.bindViewModel()
    }
}
