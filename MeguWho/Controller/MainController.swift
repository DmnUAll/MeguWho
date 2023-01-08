import UIKit

// MARK: - MainController
final class MainController: UIViewController {

    // MARK: - Properties and Initializers
    private var presenter: MainPresenter?
    lazy var mainView: MainView = {
        let view = MainView()
        return view
    }()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mwPurpleDark
        UIImageView.setAsBackground(withImage: "background", to: self)
        view.addSubview(mainView)
        setupConstraints()
        presenter = MainPresenter(viewController: self)
        presenter?.fireTimer()

        let tap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        self.view.addGestureRecognizer(tap)
    }
}

// MARK: - Helpers
extension MainController {

    @objc private func tapDetected() {
        let tapResult = presenter?.userHaveTapped(withCurrentImage: mainView.resultImageView.image)
        mainView.bottomPlateLabel.text = tapResult
    }

    private func setupConstraints() {
        let constraints = [
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
