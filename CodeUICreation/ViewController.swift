//
//  ViewController.swift
//  CodeUICreation
//
//  Created by Michal Stawarz on 09/11/2021.
//

import UIKit

class ViewController: UIViewController {
    private let customView = CodeCreatedView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        view = customView
    }


}

