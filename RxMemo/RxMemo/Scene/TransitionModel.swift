//
//  TransitionModel.swift
//  RxMemo
//
//  Created by 정의석 on 2020/05/08.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation

enum TransitionStyle {
  case root
  case push
  case modal
}

enum TransitionError: Error {
  case navigationControllerMissing
  case cannotPop
  case unknown
}
