import UIKit
import ScrollStackController
import SnapKit

class AccountViewController: BaseViewController<AccountViewModel> {
    private let scrollStackController = ScrollStackViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        super.configureUI()
        navigationController?.navigationBar.prefersLargeTitles = false
        title = MyAppStrings.tabbarAccount
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: MyAppAsset.Images.logo.image,
//                                                           style: .plain,
//                                                           target: nil,
//                                                           action: nil)
        
        
        
        
        view.addSubview(scrollStackController.view)
        scrollStackController.view.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        scrollStackController.scrollStack.hideSeparators = true
        
        
        let personalInfoView = UIView.loadFromNib(withClass: PersonalInfoView.self)
        personalInfoView.backgroundColor = .green
        scrollStackController.scrollStack.addRow(view: personalInfoView)
        
        let upgradeToProView = UIView.loadFromNib(withClass: UpgradeToProView.self)
        upgradeToProView.backgroundColor = .systemGreen
        scrollStackController.scrollStack.addRow(view: upgradeToProView)
        
        let settingsViewController = SettingsViewController()
        scrollStackController.scrollStack.addRow(controller: settingsViewController)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
    }
    
}
