import UIKit

// MARK: - MainView
final class MainView: UIView {

    // MARK: - Properties and Initializers
    private lazy var topPlateLabel: UILabel = {
        makeLabel(withText: "Which\nMegumin are\nYou today?")
    }()

    private lazy var topPlateImageView: UIImageView = {
        makeImageView(withImage: "board")
    }()

    private lazy var perimeterImageView: UIImageView = {
        makeImageView(withImage: "perimeter")
    }()

    lazy var resultImageView: UIImageView = {
        makeImageView()
    }()

    lazy var bottomPlateLabel: UILabel = {
        makeLabel(withText: "Tap to find out!")
    }()

    private lazy var bottomPlateImageView: UIImageView = {
        makeImageView(withImage: "board2")
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        toAutolayout()
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers
extension MainView {

    private func addSubviews() {
        addSubview(topPlateImageView)
        addSubview(topPlateLabel)
        addSubview(bottomPlateImageView)
        addSubview(bottomPlateLabel)
        addSubview(resultImageView)
        addSubview(perimeterImageView)
    }

    private func setupConstraints() {
        let countedSize = UIScreen.screenSize(heightDividedBy: 2.2)
        let constraints = [
            resultImageView.widthAnchor.constraint(equalToConstant: countedSize * 0.8),
            resultImageView.heightAnchor.constraint(equalToConstant: countedSize * 0.8),
            resultImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            resultImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            perimeterImageView.widthAnchor.constraint(equalToConstant: countedSize),
            perimeterImageView.heightAnchor.constraint(equalToConstant: countedSize),
            perimeterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            perimeterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            topPlateImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            topPlateImageView.bottomAnchor.constraint(equalTo: perimeterImageView.topAnchor, constant: 30),
            topPlateImageView.widthAnchor.constraint(equalToConstant: countedSize * 1.01),
            topPlateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            topPlateLabel.centerYAnchor.constraint(equalTo: topPlateImageView.centerYAnchor, constant: 24),
            bottomPlateImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomPlateImageView.topAnchor.constraint(equalTo: perimeterImageView.bottomAnchor, constant: -30),
            bottomPlateImageView.widthAnchor.constraint(equalToConstant: countedSize * 1.25),
            topPlateImageView.widthAnchor.constraint(equalToConstant: countedSize * 1.01),
            bottomPlateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomPlateLabel.centerYAnchor.constraint(equalTo: bottomPlateImageView.centerYAnchor, constant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.toAutolayout()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = text
        label.font = UIFont(name: "Chalkduster", size: 18)
        label.textColor = .mwBrown
        return label
    }

    private func makeImageView(withImage imageName: String = "") -> UIImageView {
        let imageView = UIImageView()
        imageView.toAutolayout()
        guard let image = UIImage(named: imageName) else { return imageView }
        imageView.image = image
        imageView.contentMode = .scaleToFill
        return imageView
    }
}
