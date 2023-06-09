//
//  ViewController.swift
//  MessagesREST
//
//  Created by mohammadreza on 3/19/1402 AP.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendMessage(_ sender: Any) {
        let alertController = UIAlertController(title: "New Message", message: "Enter a new Message", preferredStyle: .alert)
        alertController.addTextField{ textfield in
            textfield.placeholder = "Your message ... "
            
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel ,handler: nil))
        
        alertController.addAction(UIAlertAction(title: "Send", style: .default , handler: {action in
            
            guard let text = alertController.textFields?.first?.text else {print("No Text Available");return}
            
            let message  = Message(message: text)
            
            let postRequest = APIRequest(endpoint: "messages")
            
            postRequest.save(message, completion: { result in
                switch result {
                case .success(let message):
                    print("The Following message has been sent: \(message.message)")
                case.failure(let error):
                    print("An error \(error)")
                    
                }
                
            })
            
        }))
        
        self.present(alertController, animated: true)
    }
    

    
}

