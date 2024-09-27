 
import UIKit

class VC_Demo: UIViewController {
    
    
    @IBAction func 弹出HUDBTN(_ sender: Any) {
        
        //        showWatingHUD()
        
        
        popAlert()
        //        DispatchQueue.main.async {self.showWatingHUD(title: "请稍等".localized(), desc: "松手后开启强制转换".localized(), duration: 2)}
        //        XYZHUD.
        
        
        
    }
    @IBAction func ddd(_ sender: Any) {
        showWatingHUD()
    }
    
    @IBAction func BTN(_ sender: Any) {
        showButtonBarMessagex跳转到相册吗()
    }
    
    @IBAction func BTN4(_ sender: Any) {
        SelectOneBTN()
    }
    
    @IBAction func BTN5(_ sender: Any) {
        //        showNote(attributes: .)
    }
    
    @IBAction func BTN6(_ sender: Any) {
        showImageNote(attributes: .bottomFloat)
    }
    
    @IBAction func BTN7(_ sender: Any) {
        showCircularLoadingHUD()
    }
    
    @IBAction func BTN8(_ sender: Any) {
        showSimpleNotificationx()
//        showCustomNotification()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}


extension VC_Demo{
    
    @objc func showSimpleNotificationx() {
           let label = UILabel()
           label.text = "Hello, SwiftEntryKit!"
           label.textAlignment = .center
           label.textColor = .white

           var attributes = EKAttributes()
           attributes.position = .top
           attributes.displayDuration = 2.0
           attributes.entryBackground = .color(color: EKColor(.black))
           attributes.screenBackground = .clear
           attributes.shadow = .active(with: .init(color: .black, opacity: 0.3, radius: 8))

           SwiftEntryKit.display(entry: label, using: attributes)
       }

    
    
    func showCircularLoadingHUD() {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
        
        var attributes = EKAttributes()
        attributes.position = .center
        attributes.displayDuration = .infinity
        attributes.entryBackground = .color(color: .init(UIColor(white: 0.2, alpha: 0.8)))
        attributes.screenBackground = .color(color: .init(UIColor(white: 0.0, alpha: 0.5)))
        attributes.shadow = .none
        attributes.roundCorners = .all(radius: 10)

        SwiftEntryKit.display(entry: activityIndicator, using: attributes)
    }

}

