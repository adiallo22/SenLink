//
//  NewPostVC.swift
//  SenLink
//
//  Created by Abdul Diallo on 4/24/20.
//  Copyright © 2020 Abdul Diallo. All rights reserved.
//

import UIKit

class NewPostVC: UIViewController {

    @IBOutlet weak var publishBtn: UIButton!
    @IBOutlet weak var postCaptionLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        postCaptionLabel.delegate = self
        applyStyle()
    
    }
    
    @IBAction func pubishClicked(_ sender: UIButton) {
        
        let post = Post(caption: "\(postCaptionLabel.text!)")
        post.save()
        print("succesffuly published.")
        self.dismiss(animated: true, completion: nil)
        
    }

}

//MARK: - delegate

extension NewPostVC : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if postCaptionLabel.textColor == UIColor.lightGray {
            postCaptionLabel.text = nil
            postCaptionLabel.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if postCaptionLabel.text.isEmpty {
            postCaptionLabel.text = "What's happening ?"
            postCaptionLabel.textColor = UIColor.lightGray
        }
    }
    
    func setTextViewPlaceholder() {
        postCaptionLabel.text = "What's happening?"
        postCaptionLabel.textColor = UIColor.lightGray
    }
    
    //dismiss keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func applyStyle() {
        publishBtn.layer.cornerRadius = 25.0
        postCaptionLabel.layer.cornerRadius = 10.0
        postCaptionLabel.backgroundColor = .white
        setTextViewPlaceholder()
    }
    
}
