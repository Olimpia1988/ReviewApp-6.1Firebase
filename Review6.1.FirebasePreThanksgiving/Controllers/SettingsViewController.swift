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
     try! Auth.auth().signOut()
               showAlert(title: "Sign Out?", message: "Are you sure you want to sign out") { (action) in
                   let srb = UIStoryboard(name: "Main", bundle: nil)
                                    let startingVC = srb.instantiateViewController(identifier: Constants.Storyboard.startingVC)
                         self.view.window?.rootViewController = startingVC
                         self.view.window?.makeKeyAndVisible()
               }

    }
    

}
