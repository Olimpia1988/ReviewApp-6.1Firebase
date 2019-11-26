import FirebaseAuth
import UIKit

class SettingsViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationSetUp()
    }
    
    func navigationSetUp() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
                    let attrs = [NSAttributedString.Key.foregroundColor: UIColor.red, NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 24)!]
                    UINavigationBar.appearance().titleTextAttributes = attrs
                    navigationItem.title = "Settings"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "sign out", style: .done, target: self, action: #selector(signoutFromFirebase))
    }
    
    @objc func signoutFromFirebase() {
       //MARK: Sign out from Firebase 

    }
    

}
