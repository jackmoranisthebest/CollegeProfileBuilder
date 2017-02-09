//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by jmoran2 on 2/6/17.
//  Copyright © 2017 Big J's Kobe size development team. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var studentsTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    let realm = try! Realm()

    
    var detailItem: College? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        
        if let college = self.detailItem {
            if nameTextField.text != nil{
                nameTextField.text = college.name
                locationTextField.text = college.location
                studentsTextField.text = String(college.population)
                imageView.image = UIImage(data: college.logo)
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTappedSaveButton(_ sender: UIButton) {
        if let college = self.detailItem {
            try! realm.write({
                college.name = nameTextField.text!
                college.location = locationTextField.text!
                college.population = Int(studentsTextField.text!)!
                college.logo = UIImagePNGRepresentation(imageView.image!)!
            })
    }

    }
}

