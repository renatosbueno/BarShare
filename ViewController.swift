//
//  ViewController.swift
//  DesafioBotecoShare
//
//  Created by Renato Souza Bueno on 22/04/16.
//  Copyright © 2016 Renato S. Bueno. All rights reserved.
//

import UIKit

// criando o delegate customizado na pagina 'BarraComplementarTeclado', temos que acessá-la pela nossa tela que queremos utilizar o protocolo

    // Creating the custom delegate in 'BarraComplementarTeclado', we have to access it through the view that we want to use the protocol.

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
        
        
        
        // instanciando e acessando a CLASSE 'BarraComplementarTeclado':
        
            // instantiating and accessing the Class 'BarraComplementarTeclado'
        
        let bar1 = BarraComplementarTeclado()
        let bar2 = BarraComplementarTeclado()
  
        // indicando qual objeto utilizará os métodos do nosso protocolo delegate 'BarraComplementarTecladoDelegate' (no caso, a propria instancia 'bar1')
        
                // indicating which object will use the methods of our protocol 'BarraComplementarTecladoDelegate' (in this case, the instance 'bar1')
      
        bar1.delegate = self
        bar2.delegate = self

        
        
        // atribuindo nossa 'BarraComplementarTecladoDelegate' ao teclado referente a textField (temos que usar 'inputAccessoryView', pois nossa Barra Complementar não deixa de ser um "acessório" extra criado programaticamente para ser utilizado quando o teclado é acionado
        
            // assigning 'BarraComplementarTecladoDelegate' to the keyboard in reference to the textField (we have to use '.inputAccessoryView', because our 'Barra Complementar' it is an extra accessory created programmatically)
        
        
        // sendo que temos que atribuir a(s) constante(s) 'barra' que criamos para cada TextField/objeto que queremos que nossa barra Complementar apareça
        
        self.textFieldBill.inputAccessoryView = bar1
        self.textFieldExtras.inputAccessoryView = bar2
        
        // por exemplo, na ultima, atribui 'bar1' apenas para exemplificar que, neste caso, poderiamos ter usado a mesma variavel como 'accessoryView' das outras TexttFields
        
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
    
//    func textFieldDidBeginEditing(textField: UITextField) {
//        
//        if (textField != self.textFieldPessoas) {
//            
//            self.scrollView.setContentOffset(CGPoint(x: 0, y: 20), animated: true)
//            
//        } else {
//            
//            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
//            
//        }
//    }

    //
    
   
    
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

