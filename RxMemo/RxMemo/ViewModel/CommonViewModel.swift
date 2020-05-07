//
//  CommonViewModel.swift
//  RxMemo
//
//  Created by 정의석 on 2020/05/08.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CommonViewModel: NSObject {
  let title: Driver<String>
  let sceneCoordinator: SceneCoordinatorType
  let storage: MemoStorageType
  
  init(title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType) {
    self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
    self.sceneCoordinator = sceneCoordinator
    self.storage = storage
  }
}
