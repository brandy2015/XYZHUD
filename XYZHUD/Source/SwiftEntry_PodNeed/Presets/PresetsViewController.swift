 
 
import UIKit

/** This view controller offers presets to choose from */
class PresetsViewController: UIViewController {
    
//    enum DisplayModeSegment: Int {
//        case light
//        case dark
//        case inferred
//        
//        var displayMode: EKAttributes.DisplayMode {
//            switch self {
//            case .light:
//                return .light
//            case .dark:
//                return .dark
//            case .inferred:
//                return .inferred
//            }
//        }
//    }
    
   
    
    private var dataSource = PresetsDataSource()
    private let tableView = UITableView()
    @IBOutlet private var displayModeSegmentedControl: UISegmentedControl!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch PresetsDataSource.displayMode {
        case .dark:
            return .lightContent
        case .light:
            if #available(iOS 13, *) {
                return .darkContent
            } else {
                return .default
            }
        case .inferred:
            return super.preferredStatusBarStyle
        }
    }
    
    // MARK: - Lifecycle & Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterfaceStyle()
        setupTableView()
        displayModeSegmentedControl.selectedSegmentIndex = DisplayModeSegment.inferred.rawValue
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupInterfaceStyle()
    }
    
    @IBAction private func displayModeSegmentedControlValueChanged() {
        guard let segment = DisplayModeSegment(rawValue: displayModeSegmentedControl.selectedSegmentIndex) else {
            return
        }
        PresetsDataSource.displayMode = segment.displayMode
        dataSource.setup()
        setupInterfaceStyle()
        tableView.reloadData()
    }
    
    private func setupInterfaceStyle() {
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: EKColor.standardContent.color(
                for: traitCollection,
                mode: PresetsDataSource.displayMode
            )
        ]
        navigationController?.navigationBar.tintColor = EKColor.navigationItemColor.color(
            for: traitCollection,
            mode: PresetsDataSource.displayMode
        )
        navigationController?.navigationBar.barTintColor = EKColor.navigationBackgroundColor.color(
            for: traitCollection,
            mode: PresetsDataSource.displayMode
        )
        displayModeSegmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:
                EKColor.standardContent.color(
                    for: traitCollection,
                    mode: PresetsDataSource.displayMode
                )
            ],
            for: .normal
        )
        displayModeSegmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:
                EKColor.standardContent.color(
                    for: traitCollection,
                    mode: PresetsDataSource.displayMode
                )
            ],
            for: .selected
        )
        displayModeSegmentedControl.tintColor = EKColor.selectedBackground.color(
            for: traitCollection,
            mode: PresetsDataSource.displayMode
        )
        view.backgroundColor = EKColor.standardBackground.color(
            for: traitCollection,
            mode: PresetsDataSource.displayMode
        )
        tableView.backgroundColor = EKColor.standardBackground.color(
            for: traitCollection,
            mode: PresetsDataSource.displayMode
        )
        tableView.separatorColor = EKColor.standardContent.with(alpha: 0.3).color(
            for: traitCollection,
            mode: PresetsDataSource.displayMode
        )
        // Just in case view-controller-based-status-bar-appearance is being tinkered with
        UIApplication.shared.statusBarStyle = preferredStatusBarStyle
        setNeedsStatusBarAppearanceUpdate()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        tableView.register(
            PresetTableViewCell.self,
            forCellReuseIdentifier: PresetTableViewCell.className
        )
        tableView.register(
            SelectionHeaderView.self,
            forHeaderFooterViewReuseIdentifier: SelectionHeaderView.className
        )
        tableView.dataSource = self
        tableView.delegate = self
        tableView.fillSuperview()
    }
    
    
    
    
    
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension PresetsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let attributes = dataSource[indexPath.section, indexPath.row].attributes
        switch indexPath.section {
        case 0:
            toastCellSelected(with: attributes, row: indexPath.row)
        case 1:
            noteCellSelected(with: attributes, row: indexPath.row)
        case 2:
            floatCellSelected(with: attributes, row: indexPath.row)
        case 3:
            popupCellSelected(with: attributes, row: indexPath.row)
        case 4:
            formCellSelected(with: attributes, row: indexPath.row)
        case 5:
            customCellSelected(with: attributes, row: indexPath.row)
        case 6:
            showNavigationController(with: attributes)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PresetTableViewCell.className,
                                                 for: indexPath) as! PresetTableViewCell
        cell.presetDescription = dataSource[indexPath.section, indexPath.row]
        cell.displayMode = PresetsDataSource.displayMode
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: SelectionHeaderView.className) as! SelectionHeaderView
        header.text = dataSource[section].title
        header.displayMode = PresetsDataSource.displayMode
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].data.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

// MARK: Selection Helpers
extension PresetsViewController {
    
    private func toastCellSelected(with attributes: EKAttributes, row: Int) {
        switch row {
        case 0:
            let title = "Mail Received!"
            let desc = "Daniel sent you a message"
            showNotificationMessage(attributes: attributes,
                                    title: title,
                                    desc: desc,
                                    textColor: .white,
                                    imageName: "paper-plane-light")
        case 1:
            showChatNotificationMessage(attributes: attributes)
        case 2:
            let title = "15% Discount!"
            let desc = "Receive your coupon for 15% discount at Swifty Kitty Bakery"
            showNotificationMessage(attributes: attributes,
                                    title: title,
                                    desc: desc,
                                    textColor: .standardContent,
                                    imageName: "ic_pizza")
        case 3:
            let title = "Simple Notification-Like Message"
            let desc =
            """
            Robot moustache gentleman lip warmer nefarious, lip warmer robot moustache gentleman brandy crumb catcher groomed testosterone trophy nefarious, cappuccino collector testosterone trophy top gun testosterone trophy consectetur nefarious groomed brandy gentleman lip warmer robot moustache super mario crumb catcher. Toothbrush timothy dalton goose dali, louis xiii horseshoe mark lawrenson goose wario graeme souness tricky sneezes timothy dalton toothbrush louis xiii id dali?
            """
            showNotificationMessage(attributes: attributes,
                                    title: title,
                                    desc: desc,
                                    textColor: .standardContent)
        default:
            break
        }
    }
    
    private func noteCellSelected(with attributes: EKAttributes, row: Int) {
        switch row {
        case 0:
            showNote(attributes: attributes)
        case 1:
            showProcessingNote(attributes: attributes)
        case 2:
            showImageNote(attributes: attributes)
        case 3:
            showAnimatingImageNote(attributes: attributes)
        case 4:
            showStatusBarMessage(attributes: attributes)
        case 5:
            showNote(attributes: attributes)
        default:
            break
        }
    }
    
    private func floatCellSelected(with attributes: EKAttributes, row: Int) {
        let title = "Kofi Shop"
        let desc = "Over two weeks of quality coffee beans concentrated into a single entry kit"
        let image = "ic_coffee_light"
        switch row {
        case 0:
            showNotificationMessage(attributes: attributes,
                                    title: title,
                                    desc: desc,
                                    textColor: .white,
                                    imageName: image)
        case 1:
            showNotificationMessage(attributes: attributes,
                                    title: title,
                                    desc: desc,
                                    textColor: .white,
                                    imageName: image)
        default:
            break
        }
    }
    
    private func popupCellSelected(with attributes: EKAttributes, row: Int) {
        switch row {
        case 0:
            showDarkAwesomePopupMessage(attributes: attributes)
        case 1:
            showLightAwesomePopupMessage(attributes: attributes)
        case 2:
            showLightAwesomePopupMessage(attributes: attributes)
        case 3:
            showButtonBarMessage(attributes: attributes)
        case 4:
            showAlertView(attributes: attributes)
        case 5:
            showRatingView(attributes: attributes)
        default:
            break
        }
    }
    
    private func formCellSelected(with attributes: EKAttributes, row: Int) {
        switch row {
        case 0:
            showSigninForm(attributes: attributes, style: .light)
        case 1:
            var attributes = attributes
            showSignupForm(attributes: &attributes, style: .light)
        case 2:
            var attributes = attributes
            showSignupForm(attributes: &attributes, style: .metallic)
        default:
            break
        }
    }
    
    private func customCellSelected(with attributes: EKAttributes, row: Int) {
        switch row {
        case 0:
            showNavigationController(with: attributes)
        case 1:
            showCustomNibView(attributes: attributes)
        case 2:
            showCustomViewController(attributes: attributes)
        default:
            break
        }
    }
}
