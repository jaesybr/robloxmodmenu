import UIKit
import Orion
import RobloxModMenuC

@objc class ModMenuTweak: NSObject {

    @objc func showModMenu() {
        if let keyWindow = UIApplication.shared.windows.first,
           let rootViewController = keyWindow.rootViewController {
            let modMenuViewController = ModMenuViewController()
            rootViewController.present(modMenuViewController, animated: true, completion: nil)
        }
    }
}

%hook SomeAppViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig;
    
    [[ModMenuTweak new] showModMenu];
}

%end

class ModMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(closeMenu), for: .touchUpInside)
        closeButton.frame = CGRect(x: 20, y: 50, width: 100, height: 40)
        view.addSubview(closeButton)
    }

    @objc func closeMenu() {
        dismiss(animated: true, completion: nil)
    }
}
