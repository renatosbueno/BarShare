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
    
    
    // agora temos que voltar a nossa classe e implementar o Delegate criado abaixo
    
        // sendo que, POR PADRÃO, sempre deve-se chamar 'delegate' e SEMPRE deve ser OPTIONAL
    
    var delegate : BarraComplementarTecladoDelegate?
    
    
// init necessario para classes customizadas
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        
        
    }

    
    init() {
        // fazendo a viewzinha que ficará por cima do teclado (sempre precisa setar um tamanho (frame)
        super.init(frame: CGRect(x: 0, y: 0, width: 320, height: 35))
        
        // setando as caracteristicas do botao (lembrando que SEMPRE que criamos algo programaticamente, este objeto TEM QUE TER UM FRAME para poder aparecer.
        
        self.buttonPlace = UIButton(type: UIButtonType.System)
        self.buttonPlace.setTitle("Próximo", forState: .Normal)
        self.buttonPlace.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.buttonPlace.addTarget(self, action: Selector("apertouBotao:"), forControlEvents: .TouchUpInside)
        self.buttonPlace.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        
        self.backgroundColor = UIColor.grayColor()
        
        // assim como em UIAlertController, também precisamos adicionar o objeto que criamos na subview da classe (aqui, no caso, uma viewzinha. Já que criamos uma classe derivada de UIVIEW)
        
        self.addSubview(buttonPlace)
        
        
    }
    
    // declarando o método do botao criado, como não temos como acessar as propriedades das textsFields das outras telas e, nosso intuito é criar uma barra com botao complementar para o usuario trocar entre campos de tela (como a acao 'textFieldShoulReturn', mas como estamos usando um teclado 'DecimalPad', numeral, este botão não existe e o usuário precisa trocar de foco via código
    
    func apertouBotao(sender : UIButton) {
        
        
        print("apertou botao")
        
        // acessando e atribuindo ao método/ação do nosso botão ao delegate criado, a partir da nossa variável, também chamada 'delegate' (por padrão, obviamente)
        
            //
        
        self.delegate?.funcaoDoBotaoDelegate()
        
        
    }
    

}

// Criando um método de protocolo Delegate para podermos utilizarmos na nossa tela principal (ou em qualquer outra tela que quiséssemos dentro deste projeto)

protocol BarraComplementarTecladoDelegate {
    
    // o método aqui é declarado sem as chaves
    
    func funcaoDoBotaoDelegate()
    
    
    
}





