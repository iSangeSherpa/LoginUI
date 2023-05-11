import UIKit
import SnapKit


class ViewController: UIViewController {
    
    // MARK: Variables

    var background : UIView = {
        var background = UIView()
        let backgroundImage = UIImage(named: "background")
        let backgroundColor = UIColor(patternImage: backgroundImage!)
        background.backgroundColor = backgroundColor
        return background
    }()
    
    var logIn : UILabel = {
        var login = UILabel()
        login.text = "Log in"
        login.font = UIFont.boldSystemFont(ofSize: 17)
        login.font = login.font.withSize(20)
        return login
    }()
    
    var email : UITextField = {
        var email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        email.frame = CGRect(x: 0, y: 15, width: 200, height: 40)
        email.layer.borderColor = UIColor.gray.cgColor
        email.layer.cornerRadius = 10
        email.setLeftPaddingPoints(amount: 6)
        return email
    }()
    
    var password : UITextField = {
        var password = UITextField()
        password.placeholder = "Password"
        password.borderStyle = .roundedRect
        password.frame = CGRect(x: 0, y: 5, width: 200, height: 40)
        password.layer.borderColor = UIColor.gray.cgColor
        password.layer.cornerRadius = 10
        password.setLeftPaddingPoints(amount: 6)
        return password
    }()
    
    var signInButton : UIButton = {
       var btn = UIButton()
        btn.setTitle("Sign In", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.frame = CGRect(x: 0, y: 5, width: 200, height: 40)
        btn.contentEdgeInsets = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    var accountText : UILabel = {
       var text = UILabel()
        text.text = "Don't have an account ?"
        text.font = text.font.withSize(13)
        text.textColor = .gray
        return text
    }()
    
    var signUpText : UILabel = {
       var text = UILabel()
        text.text = "Sign Up"
        text.font = UIFont.boldSystemFont(ofSize: 17)
        text.textColor = .systemBlue
        text.font = text.font.withSize(13)
        text.textAlignment = .left
        text.sizeToFit()
        text.numberOfLines = 0
        return text
    }()
    
    lazy var labelStack : UIStackView = {
        var stack = UIStackView(arrangedSubviews: [logIn, fieldStack, bottomStack])
        stack.axis = .vertical
        stack.spacing = 20
        stack.layoutMargins = UIEdgeInsets(top: 30, left: 25, bottom: 30, right: 25)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layer.cornerRadius = 5
        stack.backgroundColor = .white
        return stack
    }()
    
    lazy var fieldStack : UIStackView = {
        var stack = UIStackView(arrangedSubviews: [email, password, signInButton])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 20
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()

    lazy var bottomStack : UIStackView = {
       var stack = UIStackView(arrangedSubviews: [accountText, signUpText])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()

    
    // MARK: Main Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(background)
        view.addSubview(labelStack)
        
        background.snp.makeConstraints { maker in
            maker.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        labelStack.snp.makeConstraints { maker in
            maker.width.equalToSuperview().offset(-60)
            maker.center.equalToSuperview()
        }
        
        NSLayoutConstraint.activate([
            logIn.bottomAnchor.constraint(equalTo: email.topAnchor, constant: -30),
            bottomStack.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30)
        ])
        
        email.snp.makeConstraints { maker in
            maker.height.equalTo(50)
        }
        
        password.snp.makeConstraints { maker in
            maker.height.equalTo(50)
        }
        
        bottomStack.addArrangedSubview(accountText)
        bottomStack.addArrangedSubview(signUpText)
    }


}

