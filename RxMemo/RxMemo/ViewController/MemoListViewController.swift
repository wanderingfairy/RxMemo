//
//  MemoListViewController.swift
//  RxMemo
//
//  Created by 정의석 on 2020/05/08.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class MemoListViewController: UIViewController, ViewModelBindableType {
  
  var viewModel: MemoListViewModel!
  
  @IBOutlet weak var listTableView: UITableView!
  
  @IBOutlet weak var addButton: UIBarButtonItem!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
  func bindViewModel() {
    viewModel.title
      .drive(navigationItem.rx.title)
      .disposed(by: rx.disposeBag)
    
    viewModel.memoList
      .bind(to: listTableView.rx.items(cellIdentifier: "cell")) { row, memo, cell in
        cell.textLabel?.text = memo.content
    }
    .disposed(by: rx.disposeBag)
  }
}
