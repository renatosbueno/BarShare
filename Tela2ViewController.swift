//
//  Tela2ViewController.swift
//  DesafioBotecoShare
//
//  Created by Renato Souza Bueno on 22/04/16.
//  Copyright © 2016 Renato S. Bueno. All rights reserved.
//

import UIKit

class Tela2ViewController: UIViewController {

    
    @IBOutlet weak var labelFullBill: UILabel!
    
    
    @IBOutlet weak var labelSplitBill: UILabel!
    
    
    var infos2 : [String]!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.labelFullBill.text = "\(infos2[0])"
        
        self.labelSplitBill.text = "\(infos2[1])"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func voltar(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        self.infos2.removeAll()
               
        
        
    }

}