//
//  ViewController.swift
//  DesafioBotecoShare
//
//  Created by Renato Souza Bueno on 22/04/16.
//  Copyright © 2016 Renato S. Bueno. All rights reserved.
//

import UIKit


class ViewController: UIViewController , UITextFieldDelegate , BarraComplementarTecladoDelegate  {

    
    // OUTLETS
    
    @IBOutlet weak var stepperPeople: UIStepper!
    
    @IBOutlet weak var textFieldPeople: UITextField!
    
    @IBOutlet weak var textFieldBill: UITextField!
    
    @IBOutlet weak var textFieldExtras: UITextField!
    
    @IBOutlet weak var textFieldTaxes: UITextField!
    
    @IBOutlet weak var botaoDividirConta: UIButton!
    
   
    // PROPERTIES
    
    var valuePeople = Float()
    
    var valueBill = Float()
    
    var valueExtras = Float()
    
    var valueTaxes = Float()
    
    var arrayInfosFinal = [String]()
    
    //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting the delegate on the textFields
        
        self.textFieldPeople.delegate = self
        self.textFieldBill.delegate = self
        self.textFieldExtras.delegate = self
        self.textFieldTaxes.delegate = self
        
        
        self.textFieldExtras.hidden = true
        
  
        
        let bar1 = BarraComplementarTeclado()
        let bar2 = BarraComplementarTeclado()
  
        bar1.delegate = self
        bar2.delegate = self

        self.textFieldBill.inputAccessoryView = bar1
        self.textFieldExtras.inputAccessoryView = bar2
       
        
        self.textFieldTaxes.inputAccessoryView = bar1
        
        
        
       self.textFieldPeople.text = "\(Int(self.stepperPeople.value))"
 
        
      
    }
    
    
    func funcaoDoBotaoDelegate() {
        
        if (self.textFieldBill.isFirstResponder()) {
            
            self.textFieldExtras.becomeFirstResponder()
            
        } else if (self.textFieldExtras.isFirstResponder()) {
            
            self.textFieldTaxes.becomeFirstResponder()
            
            
        } else if (self.textFieldTaxes.isFirstResponder()) {
            
            self.textFieldBill.becomeFirstResponder()
            
        }
        
        print("\n->usando método criado pela BarraComplementarTecladoDelegate")
    }

    
    override func viewDidAppear(animated: Bool) {
        
        self.textFieldPeople.text = "\(Int(self.stepperPeople.value))"
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.becomeFirstResponder()
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        return true
        
    }
    
    override func canBecomeFirstResponder() -> Bool {
        
        
        return true
        
    }
    
    
   
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if (textField == self.textFieldTaxes) {
            
            if (string.containsString(".")) {
                
                return false
                
            }
        }
        
        if (textField == self.textFieldBill || textField == self.textFieldExtras) {
            
            if (string == "." && range.location == 0) {
                
                return false
                
            }
            
        }
        
        
        return true
        
    
    
    }
    
    @IBAction func alteraNumPessoas(sender: UIStepper) {
        
        self.textFieldPeople.text = "\(Int(self.stepperPeople.value))"
        
    }

    @IBAction func liberaTextFieldDespesas(sender: UISwitch) {
        
        if (sender.on) {
            
            self.textFieldExtras.hidden = false
            
            
            //
            let alertaDespesas = UIAlertController(title: "Atenção", message: "Insira aqui valores extras. Ex: Estacionamento, gasolina, etc.", preferredStyle: .Alert)
            
            let acaoOk = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            
            alertaDespesas.addAction(acaoOk)
            
            self.presentViewController(alertaDespesas, animated: true, completion: nil)
            
            
        } else {
            
            self.textFieldExtras.hidden = true
            
        }
        
    }

    
    @IBAction func dividirConta(sender: UIButton) {
    
        
        if (self.textFieldPeople.text != "" && self.textFieldBill.text != "" || self.textFieldExtras.text != "" || self.textFieldTaxes.text != "") {
            
            valuePeople = (Float(self.stepperPeople.value))
            print(valuePeople)
            
            if let valorTemp = (Float(self.textFieldBill.text!)) {
                
                valueBill = valorTemp
                
                print(valueBill)
                
            }
            
            if let valorTemp = (Float(self.textFieldExtras.text!)) {
                
                valueExtras = valorTemp
                
                print(valueExtras)
                
            }
            
            if let valorTemp = (Float(self.textFieldTaxes.text!)) {
                
                valueTaxes = valorTemp
                
                print(valueTaxes)
                
            }
            
            let calculoTotal = (self.valueBill + (self.valueBill * (self.valueTaxes / 100))) + self.valueExtras
       
            
            let calculoComDivisao = ((calculoTotal) / (self.valuePeople))
            
            print("calculo Total = \(calculoTotal)")
            print("calculo com divisão = \(calculoComDivisao)")
            
            
            let formatador = NSNumberFormatter()
            formatador.numberStyle = .CurrencyStyle
            formatador.locale = NSLocale(localeIdentifier: "pt_BR")
            
            arrayInfosFinal.append(formatador.stringFromNumber(calculoTotal)!)
            arrayInfosFinal.append(formatador.stringFromNumber(calculoComDivisao)!)
            
           
        
        self.performSegueWithIdentifier("segueInfos", sender: arrayInfosFinal)
        
        } else {
            
            let alerta = UIAlertController(title: "Alerta!", message: "Preencha as informações para prosseguir", preferredStyle: .Alert)
            
            let acaoOk = UIAlertAction(title: "ok", style: .Default, handler: nil)
            
            alerta.addAction(acaoOk)
            
            self.presentViewController(alerta, animated: true, completion: nil)
            
            
        }
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "segueInfos") {
        
        let proximaTela = segue.destinationViewController as! Tela2ViewController

      
            proximaTela.infos2 = sender as! [String]
            
        }
    }
    
    
    
    @IBAction func limparCampos(sender: UIButton) {
  
    self.textFieldPeople.text = "\(Int(self.stepperPeople.value))"

    self.textFieldBill.text = ""
    self.textFieldExtras.text = ""
    self.textFieldTaxes.text = ""

        
    self.textFieldExtras.hidden = true
        
    self.arrayInfosFinal.removeAll()
    
    }
    
    

}

