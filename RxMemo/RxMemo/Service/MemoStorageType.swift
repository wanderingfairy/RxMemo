//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by 정의석 on 2020/05/08.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation
import RxSwift

protocol MemoStorageType {
  @discardableResult
  func createMemo(content: String) -> Observable<Memo>
  
  @discardableResult
  func memoList() -> Observable<[Memo]>
  
  @discardableResult
  func update(memo: Memo, content: String) -> Observable<Memo>
  
  @discardableResult
  func delete(memo: Memo) -> Observable<Memo>
}
