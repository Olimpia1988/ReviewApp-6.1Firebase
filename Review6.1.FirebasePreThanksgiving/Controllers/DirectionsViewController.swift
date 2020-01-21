import UIKit
import FirebaseAuth

class DirectionViewController: UIViewController {
    
    let currentUser = Auth.auth().currentUser
    let directionView = DirectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewsAndDelegationsSetup()
        view.addSubview(directionView)
        scheduleAction()
        tasksAction()
        
        
    }
    
    private func viewsAndDelegationsSetup() {
        view.backgroundColor = #colorLiteral(red: 0.9203030467, green: 0.8145338893, blue: 0.9443410039, alpha: 1)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.red, NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 24)!]
        UINavigationBar.appearance().titleTextAttributes = attrs
         navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "settings"), style: .plain, target: self, action: #selector(goToSettingsVC))
        navigationItem.title = "Welcome"
    }
    
    private func scheduleAction() {
        directionView.scheduleButton.addTarget(self, action: #selector(goToScheduleVCC), for: .touchUpInside)
    }
    private func tasksAction() {
        directionView.tasksButton.addTarget(self, action: #selector(goToTasksVC), for: .touchUpInside)
    }
    
    
    @objc func goToScheduleVCC() {
        let scheduleVC = SchedulesViewController()
        self.navigationController?.pushViewController(scheduleVC, animated: true)
        
    }
    
    
    @objc func goToTasksVC() {
        let taskVC = HomeViewController()
        self.navigationController?.pushViewController(taskVC, animated: true)
        
    }
    
    @objc func goToSettingsVC() {
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    
    
}
