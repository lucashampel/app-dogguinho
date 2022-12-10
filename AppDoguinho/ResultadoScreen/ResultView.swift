//
//  ResultView.swift
//  AppDoguinho
//
//  Created by lucas meireles on 09/12/22.
//

import UIKit

class ResultView: UIView {
    
    lazy var titleLabelTextView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .blue
        text.font = UIFont.boldSystemFont(ofSize: 30)
        text.text = "A idade do seu dogginho em"
        return text
    }()

    lazy var IdadeDiasHumano: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .blue
        text.font = UIFont.boldSystemFont(ofSize: 20)
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabelTextView)
        addSubview(IdadeDiasHumano)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            self.titleLabelTextView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            self.IdadeDiasHumano.topAnchor.constraint(equalTo: titleLabelTextView.bottomAnchor, constant: 55),
            self.IdadeDiasHumano.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
    }

}
