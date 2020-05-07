//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by 정의석 on 2020/05/08.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

protocol ViewModelBindableType {
  associatedtype ViewModelType
  
  var viewModel: ViewModelType! { get set }
  func bindViewModel()
}

extension ViewModelBindableType where Self: UIViewController {
  mutating func bind(viewModel: Self.ViewModelType) {
    self.viewModel = viewModel
    loadViewIfNeeded()
    
    bindViewModel()
  }
}
