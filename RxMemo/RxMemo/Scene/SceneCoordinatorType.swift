//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by 정의석 on 2020/05/08.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
  @discardableResult
  func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
  //새로운 Scene 표시. 대상 Scene 입력 받음

  @discardableResult //리턴된 값을 사용하지 않아도 됨.
  func close(animated: Bool) -> Completable //Completable 에 구독자를 추가하고, 화면전환이 끝난 후에 원하는 작업을 구현할 수 있음.
  
}
