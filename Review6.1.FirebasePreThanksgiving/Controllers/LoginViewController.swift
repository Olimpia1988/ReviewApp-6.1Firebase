import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
     
    }
    
    
    func initialSetup() {
        errorLabel.isHidden = true
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        
    }
    

    @IBAction func loginAction(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.errorLabel.isHidden = false
                self.errorLabel.text = error?.localizedDescription
            } else {
                let homeVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.storyBoardID) as? HomeViewController
                let navController = UINavigationController(rootViewController: homeVC!)
                self.view.window?.rootViewController = navController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    

}
