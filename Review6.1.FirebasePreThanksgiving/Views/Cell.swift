import UIKit

class Cell: UITableViewCell {

lazy var taskLabel: UILabel = {
           let taskLabel = UILabel()
            return taskLabel
        }()
        
        lazy var dateLabel: UILabel = {
            let dateLabel = UILabel()
            return dateLabel
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            addSubview(taskLabel)
            addSubview(dateLabel)
            
            setConstrains()
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setConstrains() {
            taskLabel.translatesAutoresizingMaskIntoConstraints = false
            [taskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11), taskLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -100), taskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11), taskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11)].forEach{ $0.isActive = true }
            
            dateLabel.translatesAutoresizingMaskIntoConstraints = false
            [dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -11), dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11), dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11), dateLabel.widthAnchor.constraint(equalTo: taskLabel.widthAnchor, multiplier: 1)].forEach{ $0.isActive = true }

        }

    



}
