//
//  ResultViewController.swift
//  AppDoguinho
//
//  Created by lucas meireles on 09/12/22.
//

import UIKit

class ResultViewController: UIViewController {

    
    var screen:ResultView?
    var dogModel:DogModel?
    
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
        var anosNumber = Int(self.dogModel!.idade)
        if(anosNumber <= 1){
            anosNumber = 15
        }
        else if anosNumber <= 2{
            anosNumber = 24
        }
        else if anosNumber <= 5{
            anosNumber = 24 + (4*(anosNumber-2))
        }
        else if anosNumber > 5{
            if dogModel!.tamanho == "Pequeno"{
                anosNumber = 24 + (4*(anosNumber-2))
            }
            else if dogModel?.tamanho == "Medio"{
                anosNumber = 24 + (5*(anosNumber-2))
            }
            else if(dogModel?.tamanho == "Grande"){
                anosNumber = 24 + (6*(anosNumber-2))
            }
        }
        
        initName(ano: Int(anosNumber ))
        
    }

}
