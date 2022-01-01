//
//  MainViewController.swift
//  quizApp
//
//  Created by Mustafa on 27.12.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //MARK: - Play button
    @IBAction func playButtonPressed(_ sender: UIButton) {
        makeAlertAndPlayPage()
    }
    //MARK: - Score button
    @IBAction func scoreButtonPressed(_ sender: UIButton) {
       performSegue(withIdentifier: "toScoreVC", sender: nil)
    }

    //MARK: - Alert function, before the entering game.
    func makeAlertAndPlayPage() {
        
        let refreshAlert = UIAlertController(title: "Oyun için hazır mısın ?", message: "", preferredStyle: UIAlertController.Style.alert)
        refreshAlert.addAction(UIAlertAction(title: "Evet", style: .default, handler: { (action: UIAlertAction!) in
            self.performSegue(withIdentifier: "toPlayVC", sender: nil)
            
        }))
        refreshAlert.addAction(UIAlertAction(title: "Hayır", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        present(refreshAlert, animated: true, completion: nil)
    }
}
