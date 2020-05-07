//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by 정의석 on 2020/05/08.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class MemoDetailViewController: UIViewController, ViewModelBindableType {
  
  var viewModel: MemoDetailViewModel!
  
  @IBOutlet weak var listTableView: UITableView!
  
  @IBOutlet weak var deleteButton: UIBarButtonItem!
  
  @IBOutlet weak var editButton: UIBarButtonItem!
  
  @IBOutlet weak var shareButton: UIBarButtonItem!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  func bindViewModel() {
    
  }

}
