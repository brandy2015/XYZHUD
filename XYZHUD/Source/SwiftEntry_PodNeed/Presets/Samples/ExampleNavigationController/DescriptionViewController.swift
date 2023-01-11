 
import UIKit

class DescriptionViewController: UIViewController {

    private let screenTitle: String
    @IBOutlet private var label: UILabel!
    
    init(screenTitle: String) {
        self.screenTitle = screenTitle
        super.init(nibName: type(of: self).className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = screenTitle
        setupInterfaceStyle()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupInterfaceStyle()
    }
    
    private func setupInterfaceStyle() {
        view.backgroundColor = EKColor.standardBackground.color(
            for: traitCollection,
            mode: .inferred
        )
        label.textColor = EKColor.standardContent.color(
            for: traitCollection,
            mode: .inferred
        )
    }
}
