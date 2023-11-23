import RxCocoa
import IHProgressHUD
import RxSwift
import UIKit

extension Reactive where Base: IHProgressHUD {
    static var isAnimating: Binder<Bool> {
        return Binder(UIApplication.shared) { _, isVisible in
            if isVisible {
                IHProgressHUD.show()
            } else {
                IHProgressHUD.dismiss()
            }
        }
    }
    
    static var status: Binder<String?> {
        return Binder(UIApplication.shared) { _, value in
            IHProgressHUD.show(withStatus: value)
        }
    }
    
    static func status(withImage image: UIImage) -> Binder<String?> {
        return Binder(UIApplication.shared) { _, value in
            IHProgressHUD.showImage(image, status: value)
        }
    }
    
    static var infoStatus: Binder<String?> {
        return Binder(UIApplication.shared) { _, value in
            IHProgressHUD.showInfowithStatus(value)
        }
    }
    
    static var error: Binder<Error> {
        return Binder(UIApplication.shared) { _, value in
            IHProgressHUD.showError(withStatus: value.localizedDescription)
        }
    }
    
    static var errorStatus: Binder<String?> {
        return Binder(UIApplication.shared) { _, value in
            IHProgressHUD.showError(withStatus: value)
        }
    }
    
    static var successStatus: Binder<String?> {
        return Binder(UIApplication.shared) { _, value in
            IHProgressHUD.showSuccesswithStatus(value)
        }
    }
    
    static var progress: Binder<CGFloat> {
        return Binder(UIApplication.shared) { _, value in
            IHProgressHUD.show(progress: value)
        }
    }

    static func progress(withStatus status: String) -> Binder<CGFloat> {
        return Binder(UIApplication.shared) { _, value in
            IHProgressHUD.show(progress: value, status: status)
        }
    }
}
