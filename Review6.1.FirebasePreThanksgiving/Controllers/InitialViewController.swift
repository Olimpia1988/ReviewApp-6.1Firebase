import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
    }
    
    private func initialSetup() {
        Utilities.styleFilledButton(signUpButton
        )
        Utilities.styleHollowButton(loginButton)
        
    }
    
    
    
    
}
