//
//  ResultViewController.swift
//  AppDoguinho
//
//  Created by lucas meireles on 09/12/22.
//

import UIKit

class ResultViewController: UIViewController {

    
    var screen:ResultView?
    var anos:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calcAnosDogguinho()
    }
    override func loadView() {
        screen = ResultView()
        view = screen
    }
    
    func initName(ano:Int){
        screen?.IdadeDiasHumano.text = "Anos Humanos "+String(ano)
    }
    
    func calcAnosDogguinho(){
        var anosNumber = Int(self.anos)
        anosNumber = (anosNumber ?? 0)*7
        initName(ano: Int(anosNumber ?? 1))
        
    }

}
