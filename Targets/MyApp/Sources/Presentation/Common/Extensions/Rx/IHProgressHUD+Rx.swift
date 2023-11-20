import RxCocoa
import RxSwift
import UIKit

extension Reactive where Base: HUD {
    static var isAnimating: Binder<Bool> {
        return Binder(UIApplication.shared) { _, isVisible in
            if isVisible {
                HUD.show()
            } else {
                HUD.dismiss()
            }
        }
    }
    
    static var status: Binder<String?> {
        return Binder(UIApplication.shared) { _, value in
            HUD.show(withStatus: value)
        }
    }
    
    static func status(withImage image: UIImage) -> Binder<String?> {
        return Binder(UIApplication.shared) { _, value in
            HUD.showImage(image, status: value)
        }
    }
    
    static var infoStatus: Binder<String?> {
        return Binder(UIApplication.shared) { _, value in
            HUD.showInfowithStatus(value)
        }
    }
    
    static var error: Binder<Error> {
        return Binder(UIApplication.shared) { _, value in
            HUD.showError(withStatus: value.localizedDescription)
        }
    }
    
    static var errorStatus: Binder<String?> {
        return Binder(UIApplication.shared) { _, value in
            HUD.showError(withStatus: value)
        }
    }
    
    static var successStatus: Binder<String?> {
        return Binder(UIApplication.shared) { _, value in
            HUD.showSuccesswithStatus(value)
        }
    }
    
    static var progress: Binder<CGFloat> {
        return Binder(UIApplication.shared) { _, value in
            HUD.show(progress: value)
        }
    }

    static func progress(withStatus status: String) -> Binder<CGFloat> {
        return Binder(UIApplication.shared) { _, value in
            HUD.show(progress: value, status: status)
        }
    }
}
