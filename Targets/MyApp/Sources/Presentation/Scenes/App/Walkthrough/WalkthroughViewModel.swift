import NSObject_Rx
import RxCocoa
import RxSwift
import XCoordinator

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
        let finishTrigger = PublishSubject<Void>()

        input.continueTrigger
            .withLatestFrom(currentIndex.asDriver())
            .drive(onNext: { [unowned self] index in
                if index < items.count - 1 {
                    currentIndex.accept(index + 1)
                } else {
                    finishTrigger.onNext(())
                }
            })
            .disposed(by: disposeBag)

        Driver.merge(finishTrigger.asDriverOnErrorJustComplete(), input.skipTrigger)
            .drive(onNext: { [unowned self] _ in
                router.trigger(.welcome)
            })
            .disposed(by: disposeBag)

        let output = Output(items: Driver.just(items),
                            currentIndex: currentIndex.asDriver())
        return output
    }
}
