//
//  MainView.swift
//  AppDoguinho
//
//  Created by lucas meireles on 04/12/22.
//

import UIKit


protocol MainViewDelegate:AnyObject{
    func tappedCalculateButton(dogInput:UITextField)
}

class MainView: UIView {
    
    private weak var delegate:MainViewDelegate?
    
    public func delegate(delegate:MainViewDelegate?){
        self.delegate = delegate
    }
    
    
    
    lazy var dogPicture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "dogImage1")
        image.scalesLargeContentImage = true
        return image
    }()
    
    lazy var dogTextView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.textAlignment = .center
        text.text = "Digite a idade do seu dogginnho"
        return text
    }()
    
    lazy var dogInput:UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.autocorrectionType = .no
        text.backgroundColor = UIColor.purple
        text.borderStyle = .roundedRect
        text.attributedPlaceholder = NSAttributedString( string: "Idade", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        text.textColor = .white
        text.clipsToBounds = true
        text.layer.cornerRadius = 12
        text.layer.borderWidth = 1.0
        text.layer.borderColor = UIColor.white.cgColor
        return text
    }()
    
    lazy var calculateButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Calcular", for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        bt.setTitleColor(.white, for: .normal)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 8
        bt.titleLabel?.textAlignment = .center
        bt.backgroundColor = UIColor.red
        bt.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return bt
    }()
    
    @objc func tappedCalculateButton(){
        delegate?.tappedCalculateButton(dogInput: dogInput)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.dogPicture)
        self.addSubview(self.dogTextView)
        self.addSubview(self.dogInput)
        self.addSubview(self.calculateButton)
        self.backgroundColor = .brown
        self.configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            self.dogPicture.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            self.dogPicture.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: -100),
            
            self.dogTextView.topAnchor.constraint(equalTo: dogPicture.bottomAnchor, constant: 20),
            self.dogTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            self.dogInput.topAnchor.constraint(equalTo: self.dogTextView.bottomAnchor, constant: 20),
            self.dogInput.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.dogInput.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.calculateButton.topAnchor.constraint(equalTo: self.dogInput.bottomAnchor, constant: 20),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            ])
    }

}
