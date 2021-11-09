import SnapKit
import UIKit

class CodeCreatedView: UIView {

    // MARK: - Constants -
    private enum Layout {
        static let insets = UIEdgeInsets(top: 16, left: 8, bottom: 32, right: 8)
        static let rectangleCircleVerticalSpacing: CGFloat = 30

        //
        static let backgroundColor = UIColor.white
        static let circleColor = UIColor.red
        static let squareColor = UIColor.purple
        static let rectangleColor = UIColor.green
        static let borderColor = UIColor.black

        //
        static let borderWidth: Double = 2.0
        static let circleWidth: Double = 100
        static let squareWidth: Double = 100
    }

    // MARK: - Variables -
    private let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = Layout.circleColor
        view.layer.maskedCorners = [.layerMaxXMaxYCorner,
                                    .layerMaxXMinYCorner,
                                    .layerMinXMaxYCorner,
                                    .layerMinXMinYCorner]

        view.layer.cornerRadius = Layout.circleWidth / 2.0
        return view
    }()

    private let squareView: UIView = {
        let view = UIView()
        view.backgroundColor = Layout.squareColor
        return view
    }()

    private let rectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = Layout.rectangleColor
        view.layer.borderColor = Layout.borderColor.cgColor
        view.layer.borderWidth = Layout.borderWidth
        return view
    }()


    // MARK: - Initialization -

    public init() {
        super.init(frame: .zero)

        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews() {
        backgroundColor = Layout.backgroundColor

        addSubview(squareView)
        addSubview(rectangleView)
        rectangleView.addSubview(circleView)
    }

    private func setupConstraints() {

        /// Note that there is no need to write `translatesAutoresizingMaskIntoConstraints`.
        /// Snapkit automatically handles it

        squareView.snp.makeConstraints { make in
            make.size.equalTo(Layout.squareWidth)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(Layout.insets.top)
            make.centerX.equalToSuperview()
        }

        rectangleView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Layout.insets.left)
            make.trailing.equalToSuperview().inset(Layout.insets.right)
            make.top.equalTo(squareView.snp.bottom).inset(-Layout.rectangleCircleVerticalSpacing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(Layout.insets.bottom)
        }

        circleView.snp.makeConstraints { make in
            make.size.equalTo(Layout.circleWidth).priority(.high)
            make.center.equalToSuperview()
            make.edges.equalToSuperview().priority(.low)
        }
    }

    // MARK: - Required Init -

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
