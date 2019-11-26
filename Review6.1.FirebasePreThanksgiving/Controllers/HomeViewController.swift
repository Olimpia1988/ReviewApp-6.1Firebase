import ExpandingMenu
import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {
    

    let tableView = HomeView()
    
    var allTasks = [Task]() {
        didSet {
            tableView.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBars()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    

    func setUpNavBars() {
           self.navigationController?.navigationBar.prefersLargeTitles = true
           let attrs = [NSAttributedString.Key.foregroundColor: UIColor.red, NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 24)!]
           UINavigationBar.appearance().titleTextAttributes = attrs
           navigationItem.title = "Tasks"
           navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(settingsVC))
           navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "add"), style: .plain, target: self, action: #selector(setupButtonTasks))
       }
    
    @objc func setupButtonTasks() {
          let addVC = CreateTaskViewController()
          self.navigationController?.pushViewController(addVC, animated: true)
      }
      
      @objc func settingsVC() {
          let settingsVC = SettingsViewController()
          self.navigationController?.pushViewController(settingsVC, animated: true)
      }
    
    func delegatesAndAddedViews() {
          self.view.addSubview(tableView)
        tableView.tableView.delegate = self
        tableView.tableView.dataSource = self
      }
    
    //MARK: Expanding buttons
    
    //MARK: Write to Firebase

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? Cell else { return UITableViewCell() }
       
        //MARK: Crete cell values
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}


extension Int {
    func getDate() -> String{
        let time = TimeInterval(self)
        let date = Date(timeIntervalSince1970: time)
        let format = DateFormatter()
        format.dateStyle = .medium
        let finishedString = format.string(from: date)
        return finishedString
        
    }
}
