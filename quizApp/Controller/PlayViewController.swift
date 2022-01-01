//
//  ViewController.swift
//  quizApp
//
//  Created by Mustafa on 27.12.2021.
//

import UIKit
import CoreData

class PlayViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstOption: UIButton!
    @IBOutlet weak var secondOption: UIButton!
    @IBOutlet weak var thirdOption: UIButton!
    @IBOutlet weak var fourthOption: UIButton!
    @IBOutlet weak var questionCount: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    //MARK: - Variables
    var quizBrain = QuizBrain()
    var questionNumber = 0
    
    var timer: Timer?
    var counter = 0
    
    var highScoreName = ""
    var highScoreTime = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval:1, target:self, selector:#selector(processTimer), userInfo: nil, repeats: true)
        
        updateUI(questionNumber)
        questionNumber += 1
        questionCount.text = "\(questionNumber)"
        progressView.progress = 1.0 / 10.0
    }
    //MARK: - Timer methods.
    @objc func processTimer() {
        counter += 1
        highScoreTime = "\(counter)"
        timeLabel.text = "Süre: \(counter) sn."
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    //MARK: - Button
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if sender.currentTitle! == quizBrain.selectedC {
            
            questionNumber += 1
            questionCount.text = "\(questionNumber)"
            progressView.progress += 1.0 / 10.0
            
            if questionNumber == 11 {
                questionCount.text = "10"
                killTimer()
                
                //Kullanıcının ismini alıyoruz yüksek skora kaydetmek için.
                var textField = UITextField()
                
                let alert = UIAlertController(title: "Tebrikler 10 soruyuda bildiniz", message: "", preferredStyle: .alert)
                alert.addTextField { alertTextField in
                    alertTextField.placeholder = "İsminiz:"
                    
                    textField = alertTextField
                }
                
                let action = UIAlertAction(title: "Kaydet", style: .default) { action in
                    //İsmi ve süreyi kaydettiğimiz alan
                    
                    self.highScoreName = textField.text!
                    
                    if self.highScoreName != "" {
                        
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        let context = appDelegate.persistentContainer.viewContext
                        
                        let newScore = NSEntityDescription.insertNewObject(forEntityName: "HighScore", into: context)
                        
                        newScore.setValue(self.highScoreName, forKey: "name")
                        newScore.setValue(self.highScoreTime, forKey: "time")
                        
                        do {
                            try context.save()
                        } catch {
                            print("Error occured while saving high score.")
                        }
                    }
                    self.dismiss(animated: true, completion: nil)
                }
                
                let action2 = UIAlertAction(title: "İptal", style: UIAlertAction.Style.default) { action in
                    self.dismiss(animated: true, completion: nil)
                }
                
                alert.addAction(action)
                alert.addAction(action2)
                present(alert, animated: true, completion: nil)
                
            }
            updateUI(questionNumber)
        }else {
            makeAlert(title: "Elendiniz", message: "Doğru cevap: \(quizBrain.selectedC)")
            killTimer()
        }
    }
    //MARK: - UpdateUI
    func updateUI(_ questionNumber: Int) {
        quizBrain.getQuestionText(number: questionNumber)
        questionLabel.text = quizBrain.selectedQ
        //firstOption.titleLabel?.text = quizBrain.selectedA.firstOption
        
        firstOption.setTitle(quizBrain.selectedA.firstOption, for: .normal)
        secondOption.setTitle(quizBrain.selectedA.secondOption, for: .normal)
        thirdOption.setTitle(quizBrain.selectedA.thirdOption, for: .normal)
        fourthOption.setTitle(quizBrain.selectedA.fourthOption, for: .normal)
        
    }
    //MARK: - Alert Function
    func makeAlert(title: String, message: String) {
        //Uyarı mesajını oluşturma
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default) { UIAlertAction in
            self.dismiss(animated: true, completion: nil)
        }
        //Ok butonunu uyarı mesajımıza ekleme
        alert.addAction(okButton)
        //Uyarı mesajını gösterme
        self.present(alert, animated: true, completion: nil)
        
    }
    //MARK: - Taking user name
    func takingUsername() {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            
            //Copy alertTextField in local variable to use in current block of code
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add item", style: .default) { action in
            //Prints the alertTextField's value
            print(textField.text!)
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

