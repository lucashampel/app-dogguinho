//
//  ViewController.swift
//  AppDoguinho
//
//  Created by lucas meireles on 04/12/22.
//

import UIKit

class ViewController: UIViewController {
    var screen:MainView?
    
    override func loadView() {
        self.screen = MainView()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

extension ViewController:MainViewDelegate{
    func tappedCalculateButton(dogInput:UITextField) {
        let vc = ResultViewController()
        vc.anos = dogInput.text ?? ""
        navigationController?.pushViewController(vc, animated: false)
    }
}

