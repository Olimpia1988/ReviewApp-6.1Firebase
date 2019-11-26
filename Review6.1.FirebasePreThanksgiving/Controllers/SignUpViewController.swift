import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()

     
    }
    
    func setupElements() {
           errorLabel.isHidden = true
           Utilities.styleTextField(nameTextField)
           Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
           Utilities.styleTextField(passwordTextField)
           Utilities.styleFilledButton(signUpButton)
       }
       
       func validateFiels() -> String? {
           //check that all fields hold values
           
           if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
               return "Please fill in all the fields"
           }
           
           let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           if Utilities.isPasswordValid(cleanedPassword) == false {
               return "Please make sure your password is valid "
           }
           
           return nil
       }
    
    @IBAction func signUp(_ sender: Any) {
        //validate fields and create the user
               let error = validateFiels()
               
               if error != nil {
                   //there's something wrong with the fiels
                   showError(error!)
               
               } else {
                   let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   let last = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   let emailToSet = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   let pass = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                   
                   Auth.auth().createUser(withEmail: emailToSet, password: pass) { (result, error) in
                       if error != nil {
                           
                           self.showError("Error creating user")
                       } else {
                        let db = Firestore.firestore()
                           db.collection("users").addDocument(data: ["firstName": name, "lastName": last, "uid": result!.user.uid]) { (error) in
                               if error != nil {
                                   self.showError("User data couldn't be safe on the data base")
                                   
                               }
                           }
                           
                           //Transition to the home screen
                           self.trainsitionToHime()
                           
                       }
                   }
               }
        
        
        
    }
    
    func showError(_ message: String) {
           errorLabel.isHidden = false
           errorLabel.text = message
           
       }
       
       func trainsitionToHime() {
           let homeVC = storyboard?.instantiateViewController(identifier: Constants.Storyboard.storyBoardID) as? HomeViewController
           let homeVC1 = UINavigationController(rootViewController: homeVC!)
           view.window?.rootViewController = homeVC1
           view.window?.makeKeyAndVisible()
           
           //TODO: add nav controller
           
       }
    
  

}
