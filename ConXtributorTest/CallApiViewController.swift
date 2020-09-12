//
//  CallApiViewController.swift
//  ConXtributorTest
//
//  Created by Graham Rebhun on 9/12/20.
//  Copyright © 2020 Graham Rebhun. All rights reserved.
//

import UIKit

class CallApiViewController: UIViewController {

    @IBOutlet weak var tempTextField: UITextField!
    @IBOutlet weak var humidityTextField: UITextField!
    @IBOutlet weak var lightTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func buttonPressed(_ sender: Any) {
        guard let field1Text = tempTextField.text else {print("No text available in field 1");
            return
        }
        guard let field2Text = humidityTextField.text else {print("No text available in field 2");
            return
        }
        guard let field3Text = lightTextField.text else {print("No text available in field 3");
            return
        }
        let fieldsToUpdate = PostRequestObject(field1: field1Text, field2: field2Text, field3: field3Text)
        
        let postRequest = PostReqeust()
        
        postRequest.send(fieldsToUpdate, completion: { result in
            switch result {
            case .success(let responseData):
                print("The following data has been captured in ThingSpeak: \(responseData)")
            case .failure(let error):
                print("An error occured: \(error)")
            }
        })
    }
    
}
