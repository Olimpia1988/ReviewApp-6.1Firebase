import ExpandingMenu
import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {
    
    let tableView = HomeView()
    let currentUser = Auth.auth().currentUser
    
    var allTasks = [Task]() {
        didSet {
            tableView.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBars()
        delegatesAndAddedViews()
        view.backgroundColor = .white

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllTasks()
        //call buttons function
        expandingButtons()
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
    func expandingButtons() {
        let menuButtonSize: CGSize = CGSize(width: 50.0, height: 50.0)
        let menuButton = ExpandingMenuButton(frame: CGRect(origin: CGPoint.zero, size: menuButtonSize), image: UIImage(named: "moreOptions")!, rotatedImage: UIImage(named: "moreOptions")!)
        
        menuButton.center = CGPoint(x: self.view.bounds.width - 32.0, y: self.view.bounds.height - 72.0)
        view.addSubview(menuButton)
        
        let item1 = ExpandingMenuItem(size: menuButtonSize, title: "My tasks", image: UIImage(named: "myTask")!, highlightedImage: UIImage(named: "myTask")!, backgroundImage: UIImage(named: "myTask"), backgroundHighlightedImage: UIImage(named: "myTask")) { () -> Void in
            
            if self.currentUser != nil {
                FirestoreService.manager.getPosts(forUserID: self.currentUser!.uid) { (result) in
                    switch result {
                    case .success(let userTask):
                        self.allTasks = userTask
                    case .failure(let error):
                        print("there's been an error uploading the single user's tasks: \(error)")
                    }
                    
                }
            }
            
        }
        
        let item2 = ExpandingMenuItem(size: menuButtonSize, title: "Sort by date", image: UIImage(named: "date")!, highlightedImage: UIImage(named: "date")!, backgroundImage: UIImage(named: "date"), backgroundHighlightedImage: UIImage(named: "date")) { () -> Void in
            self.allTasks = self.allTasks.sorted(by: { (taskOne, taskTwo) -> Bool in
                taskOne.dateCreated > taskTwo.dateCreated
            })
        }
        
        let item3 = ExpandingMenuItem(size: menuButtonSize, title: "All Tasks", image: UIImage(named: "allTasks")!, highlightedImage: UIImage(named: "allTasks")!, backgroundImage: UIImage(named: "allTasks"), backgroundHighlightedImage: UIImage(named: "allTasks")) { () -> Void in
            self.getAllTasks()
        }
        
        menuButton.addMenuItems([item1, item2, item3])
        
        
    }
    
    
    
    
    //MARK: Write to Firebase
    func getAllTasks() {
        FirestoreService.manager.getAllPosts { (result) in
            switch result {
            case .success(let tasks):
                self.allTasks = tasks
            case .failure(let error):
                print("There was an error loading from the cloud \(error)")
            }
        }
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? Cell else { return UITableViewCell() }
        let singleTask = allTasks[indexPath.row]
        cell.selectionStyle = .none
        cell.taskLabel.text = singleTask.title
        cell.dateLabel.text = singleTask.dateCreated.getDate()
       
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
