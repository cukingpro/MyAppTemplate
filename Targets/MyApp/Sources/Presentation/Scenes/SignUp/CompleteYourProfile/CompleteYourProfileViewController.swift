import UIKit

class CompleteYourProfileViewController: BaseViewController<CompleteYourProfileViewModel> {
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var editAvatarButton: AppPrimaryButton!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nameTextfield: AppTextField!
    
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var phoneTextfield: AppPhoneNumberTextField!
    
    @IBOutlet private weak var genderLabel: UILabel!
    @IBOutlet private weak var genderTextfield: AppPickerTextField!
    
    @IBOutlet private weak var skipButton: AppTertiaryButton!
    @IBOutlet private weak var continueButton: AppPrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        super.configureUI()
        title = "Complete your profile"
        
        descriptionLabel.do {
            $0.font = MyAppFontFamily.Urbanist.regular.font(size: 18)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.text = "Please enter your profile. Don't worry, only you can see your personal data. No one else will be able to see it. Or you can skip it for now."
            $0.numberOfLines = 0
        }
        
        editAvatarButton.do {
            $0.configuration = $0.configuration?.with {
                $0.cornerStyle = .small
            }
        }
        
        nameLabel.do {
            $0.font = MyAppFontFamily.Urbanist.bold.font(size: 16)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.text = "Full name"
        }
        
        nameTextfield.do {
            $0.setPlaceHolder(text: "Full name")
        }
        
        phoneLabel.do {
            $0.font = MyAppFontFamily.Urbanist.bold.font(size: 16)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.text = "Phone number"
        }
        
//        phoneTextfield.do {
//            $0.setPlaceHolder(text: "Phone number")
//        }
//        phoneTextfield.do {
//            $0.withFlag = true
//            $0.withExamplePlaceholder = true
//            $0.withDefaultPickerUI = true
//            $0.withPrefix = false
//            
//        }
        
        genderLabel.do {
            $0.font = MyAppFontFamily.Urbanist.bold.font(size: 16)
            $0.textColor = MyAppAsset.Colors.greyscale900.color
            $0.text = "Gender"
        }
        
        genderTextfield.do {
            $0.setPlaceHolder(text: "Gender")
            $0.items = ["Male", "Female", "Other"]
        }
        
        
        skipButton.setTitle("Skip")
        continueButton.setTitle("Continue")
    }
}
