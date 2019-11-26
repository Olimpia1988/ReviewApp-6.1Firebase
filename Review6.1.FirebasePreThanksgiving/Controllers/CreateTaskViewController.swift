import FirebaseFirestore
import FirebaseAuth
import Firebase
import UIKit

class CreateTaskViewController: UIViewController {
    
    let postView = CreatePostView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postView)
        view.backgroundColor = .white
        initialSetup()
       
    }
    
    func initialSetup() {
        postView.errorLabel.isHidden = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.red, NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 24)!]
        UINavigationBar.appearance().titleTextAttributes = attrs
        navigationItem.title = "Create a Task"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(postData))

    }
    
    func valiedateText() -> Bool {
        if postView.titleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && postView.descriptionText.text.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            return true
        } else {
            showAlert(title: "Error", message: "Please add values to the fields")
            return false
        }
    }
    
    func transitionBack() {
        showAlert(title: "Saved!", message: "You added a task") { (action) in
            let srb = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = srb.instantiateViewController(identifier: Constants.Storyboard.storyBoardID)
            let navController = UINavigationController(rootViewController: homeVC)
            self.view.window?.rootViewController = navController
            self.view.window?.makeKeyAndVisible()
        }
    }
    
    func showError(_ message: String) {
        postView.errorLabel.isHidden = false
        postView.errorLabel.text = message
        }
    
    @objc func postData() {
        let user = Auth.auth().currentUser
        let errorMessage = valiedateText()
        
        if user != nil && errorMessage == true {
            let newTask = Task(title: postView.titleTextField.text!, body: postView.descriptionText.text, creatorID: user!.uid, dateCreated: Int(postView.datePicker.date.timeIntervalSince1970))
            FirestoreService.manager.createPost(post: newTask) { (result) in
                self.transitionBack()
                print("we posted!")
            }
        } else {
            showError("Please add values to the fields")
        }
    }
    
    
    

   

}
