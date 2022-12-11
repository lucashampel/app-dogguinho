//
//  MainView.swift
//  AppDoguinho
//
//  Created by lucas meireles on 04/12/22.
//

import UIKit


protocol MainViewDelegate:AnyObject{
    func tappedCalculateButton(dogModel:DogModel)
}

class MainView: UIView, UIPickerViewDataSource, UIPickerViewDelegate {
    var dogSizeArray = ["Pequeno", "Medio", "Grande"]
    var dogModel:DogModel = DogModel.init(tamanho: "Pequeno", idade: 1)
    //picker methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return dogSizeArray.count
        } else {
            return 16
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return dogSizeArray[row]
        } else {
            return "\(row+1)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            dogModel.tamanho = dogSizeArray[row]
        }
        else if component == 1{
            dogModel.idade = row
        }
    }
    
    //view methods
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
        text.textColor = .darkGray
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.textAlignment = .center
        text.text = "Cálculo da idade do seu dogguinho"
        return text
    }()
    
    lazy var dogIdadeTamanhoView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.textAlignment = .center
        text.text = "Tamanho                               Idade"
        return text
    }()
    
    lazy var pickerSize:UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
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
        delegate?.tappedCalculateButton(dogModel: dogModel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.dogPicture)
        self.addSubview(self.dogTextView)
        self.addSubview(self.dogIdadeTamanhoView)
        self.addSubview(self.pickerSize)
        self.addSubview(self.calculateButton)
        self.pickerSize.delegate = self
        self.pickerSize.dataSource = self
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
            
            self.dogIdadeTamanhoView.topAnchor.constraint(equalTo: self.dogTextView.bottomAnchor, constant: 20),
            self.dogIdadeTamanhoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.dogIdadeTamanhoView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.pickerSize.topAnchor.constraint(equalTo: self.dogIdadeTamanhoView.bottomAnchor),
            self.pickerSize.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.pickerSize.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            self.calculateButton.topAnchor.constraint(equalTo: self.pickerSize.bottomAnchor, constant: 20),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            ])
    }

}
