import RxDataSources
import UIKit

final class WalkthroughViewController: BaseViewController<WalkthroughViewModel> {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var skipButton: AppSecondaryButton!
    @IBOutlet private weak var nextButton: AppPrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        super.configureUI()
        configureCollectionView()
        configurePageControl()
        configureButtons()
    }
    
    private func configureButtons() {
        skipButton.setTitle("Skip")
        nextButton.setTitle("Next")
    }
    
    private func configurePageControl() {
        pageControl.do {
            $0.currentPageIndicatorTintColor = MyAppAsset.Colors.primary.color
            $0.pageIndicatorTintColor = MyAppAsset.Colors.greyscale300.color
        }
    }
    
    private func configureCollectionView() {
        collectionView.do {
            $0.register(nibWithCellClass: WalkthroughCollectionViewCell.self)
            $0.isPagingEnabled = true
            $0.isScrollEnabled = false
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
            ($0.collectionViewLayout as! UICollectionViewFlowLayout).scrollDirection = .horizontal
            $0.contentInsetAdjustmentBehavior = .never
            $0.rx.setDelegate(self).disposed(by: rx.disposeBag)
        }
    }
    
    override func bindViewModel() {
        let input = WalkthroughViewModel.Input(
            skipTrigger: skipButton.rx.tap.asDriver(),
            continueTrigger: nextButton.rx.tap.asDriver()
        )
        let output = viewModel.transform(input)
        output.items.drive(collectionView.rx.items) { collectionView, row, element in
            let indexPath = IndexPath(row: row, section: 0)
            let cell = collectionView.dequeueReusableCell(withClass: WalkthroughCollectionViewCell.self, for: indexPath)
            cell.bind(element)
            return cell
        }
        .disposed(by: rx.disposeBag)
        
        output.items
            .map { $0.count }
            .drive(pageControl.rx.numberOfPages)
            .disposed(by: rx.disposeBag)
        
        output.currentIndex.drive(onNext: { [weak self] index in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.collectionView.scrollToItem(at: IndexPath(item: index, section: 0),
                                                 at: .centeredHorizontally,
                                                 animated: true)
                self.pageControl.currentPage = index
            }
        })
        .disposed(by: rx.disposeBag)
    }
}

extension WalkthroughViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}
