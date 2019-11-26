import UIKit

class CreatePostView: UIView {

   lazy var titleTextField: UITextField = {
        let title = UITextField()
    title.borderStyle = .roundedRect
    title.layer.borderColor = #colorLiteral(red: 0.9203030467, green: 0.8145338893, blue: 0.9443410039, alpha: 1)
    title.placeholder = "Name your task"
      return title
      
    }()
    
    lazy var datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        return datePicker
    }()
    
    lazy var errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.textColor = .red
        errorLabel.textAlignment = .center
        
        return errorLabel
    }()
    
    lazy var descriptionText: UITextView = {
        let descriptionText = UITextView()
        descriptionText.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        descriptionText.layer.cornerRadius = 5.0
        descriptionText.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return descriptionText
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    func commonInit() {
        addSubview(titleTextField)
        addSubview(datePicker)
        addSubview(errorLabel)
        addSubview(descriptionText)
        constrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func constrains() {
       titleTextField.translatesAutoresizingMaskIntoConstraints = false
        [titleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20), titleTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22), titleTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22), titleTextField.heightAnchor.constraint(equalToConstant: 35)].forEach{ $0.isActive = true }
        
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        [descriptionText.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 22), descriptionText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22), descriptionText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22), descriptionText.bottomAnchor.constraint(equalTo: datePicker.topAnchor, constant: -22)].forEach{ $0.isActive = true }
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        [datePicker.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor), datePicker.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)].forEach{ $0.isActive = true
            }
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        [errorLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -22), errorLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 30), errorLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 22), errorLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22)].forEach{ $0.isActive = true }
        
        
        
        
    }
    
 
    
    

    
  

}
