import XCoordinator
import NSObject_Rx
import RxCocoa

final class WalkthroughViewModel: ViewModelType, HasDisposeBag {
    private let router: UnownedRouter<AppRoute>
    private let items: [WalkthroughModel] = [
        .init(image: MyAppAsset.Images.walkthrough0.image,
              title: MyAppStrings.walkthroughTitle0,
              subtitle: MyAppStrings.walkthroughSubtitle0),
        .init(image: MyAppAsset.Images.walkthrough1.image,
              title: MyAppStrings.walkthroughTitle1,
              subtitle: MyAppStrings.walkthroughSubtitle1),
        .init(image: MyAppAsset.Images.walkthrough2.image,
              title: MyAppStrings.walkthroughTitle2,
              subtitle: MyAppStrings.walkthroughSubtitle2),
    ]
    private let currentIndex = BehaviorRelay(value: 0)
    
    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }
}

extension WalkthroughViewModel {
    struct Input {
        let skipTrigger: Driver<Void>
        let continueTrigger: Driver<Void>
    }

    struct Output {
        let items: Driver<[WalkthroughModel]>
        let currentIndex: Driver<Int>
    }

    func transform(_ input: Input) -> Output {
        let continueTrigger = input.continueTrigger
            .withLatestFrom(currentIndex.asDriver())
            .filter({ $0 < self.items.count - 1 })
        
        continueTrigger
            .map({ $0 + 1 })
            .drive(currentIndex)
            .disposed(by: disposeBag)
        
        let finishTrigger = input.continueTrigger
            .withLatestFrom(currentIndex.asDriver())
            .filter({ $0 == self.items.count - 1 })
            .mapTo(())
        
        Driver.merge(finishTrigger, input.skipTrigger)
            .drive(onNext: { _ in
                // Go to welcome screen
            })
            .disposed(by: disposeBag)
        
        let output = Output(items: Driver.just(items),
                            currentIndex: currentIndex.asDriver())
        return output
    }
}
