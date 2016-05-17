//
//  BarraComplementarTeclado.swift
//  DesafioBotecoShare
//
//  Created by Renato Souza Bueno on 24/04/16.
//  Copyright © 2016 Renato S. Bueno. All rights reserved.
//

import UIKit

class BarraComplementarTeclado: UIView {

    
    var buttonPlace : UIButton!
    
   
    var delegate : BarraComplementarTecladoDelegate?
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        
        
    }

    
    init() {
       
        super.init(frame: CGRect(x: 0, y: 0, width: 320, height: 35))
    
        
        self.buttonPlace = UIButton(type: UIButtonType.System)
        self.buttonPlace.setTitle("Próximo", forState: .Normal)
        self.buttonPlace.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.buttonPlace.addTarget(self, action: Selector("apertouBotao:"), forControlEvents: .TouchUpInside)
        self.buttonPlace.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        
        self.backgroundColor = UIColor.grayColor()
        
        
        self.addSubview(buttonPlace)
        
        
    }

    
    func apertouBotao(sender : UIButton) {
        
        
        print("apertou botao")
    
        
            //
        
        self.delegate?.funcaoDoBotaoDelegate()
        
        
    }
    

}

protocol BarraComplementarTecladoDelegate {
    
    
    func funcaoDoBotaoDelegate()
    
    
    
}





