// Created on: Nov 18
// Created by: Adam 
// This program calculates volume of cylinder 

import PlaygroundSupport
import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let instructionLabel = UILabel()
    let radiusTextField = UITextField()
    let heightTextField = UITextField()
    let enterButton = UIButton()
    let calculateButton = UIButton()
    let answerLabel = UILabel()
    
    var volume : Double = 0
    
    @objc func enterClicked() {
        // check if Int was entered and create radius and height variable 
        if let radius : Double = Double(radiusTextField.text!), let height : Double = Double(heightTextField.text!) {
            // call calculate volume function
            calculateVolume(radiusSent : radius, heightSent : height)
        } else {
            answerLabel.text = "Invalid Input. Enter an Integer."
        }
    }
    
    @objc func calculateVolume(radiusSent : Double, heightSent : Double) -> Double {
        // calculate and return volume
        volume = Double.pi * pow(Double(radiusSent),2) * Double(heightSent)
        return volume
    }
    
    @objc func showVolume() {
        //show volume
        answerLabel.text = "The volume is \(String(format: "%.2f", volume)) cm^3."
    }
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        instructionLabel.text = "Enter radius and height in cm to calculate volume:"
        view.addSubview(instructionLabel)
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        radiusTextField.borderStyle = UITextBorderStyle.roundedRect
        radiusTextField.placeholder = "Radius (cm)"
        view.addSubview(radiusTextField)
        radiusTextField.translatesAutoresizingMaskIntoConstraints = false
        radiusTextField.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 20).isActive = true
        radiusTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        heightTextField.borderStyle = UITextBorderStyle.roundedRect
        heightTextField.placeholder = "Height (cm)"
        view.addSubview(heightTextField)
        heightTextField.translatesAutoresizingMaskIntoConstraints = false
        heightTextField.topAnchor.constraint(equalTo: radiusTextField.bottomAnchor, constant: 20).isActive = true
        heightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        enterButton.setTitle("Enter", for: .normal)
        enterButton.setTitleColor(.blue, for: .normal)
        enterButton.titleLabel?.textAlignment = .center
        enterButton.addTarget(self, action: #selector(enterClicked), for: .touchUpInside)
        view.addSubview(enterButton)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 20).isActive = true
        enterButton.leadingAnchor.constraint(equalTo: heightTextField.trailingAnchor, constant: 20).isActive = true
        
        calculateButton.setTitle("Calculate Volume", for: .normal)
        calculateButton.setTitleColor(.blue, for: .normal)
        calculateButton.titleLabel?.textAlignment = .center
        calculateButton.addTarget(self, action: #selector(showVolume), for: .touchUpInside)
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 20).isActive = true
        calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        answerLabel.text = nil
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20).isActive = true
        answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
