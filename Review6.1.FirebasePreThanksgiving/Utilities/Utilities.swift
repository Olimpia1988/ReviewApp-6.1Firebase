import UIKit
import Foundation

class Utilities {
    static func styleTextField(_ textfield: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = #colorLiteral(red: 0.001339468872, green: 0.6090487838, blue: 0.8983275294, alpha: 1)
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
    }
    
    static func styleFilledButton(_ button: UIButton) {
        button.backgroundColor = #colorLiteral(red: 0.001339468872, green: 0.6090487838, blue: 0.8983275294, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button: UIButton) {
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    static func isPasswordValid(_ password: String) -> Bool {
        return true
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z]\\d$@$#!%*?&]{8,}")
//        return passwordTest.evaluate(with: password)
    }
}



