//
//  SceneCoordinator.swift
//  RxMemo
//
//  Created by 정의석 on 2020/05/08.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension UIViewController {
  //뷰 컨트롤러가 실제 화면에 표시되어야할 VC가 아니라 상위 NaviVC로 연결되었더라도,
  //해당 네비VC의 마지막 VC를 리턴해주는 extension
  
  var sceneViewController: UIViewController {
    return self.children.first ?? self
  }
}

class SceneCoordinator: SceneCoordinatorType {
  private let bag = DisposeBag()
  
  private var window: UIWindow
  private var currentVC: UIViewController
  
  required init(window: UIWindow) {
    self.window = window
    currentVC = window.rootViewController!
  }
  
  @discardableResult
  func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable {
    let subject = PublishSubject<Void>()
    
    let target = scene.instantiate()
    
    switch style {
    case .root:
      currentVC = target.sceneViewController
      window.rootViewController = target
      subject.onCompleted()
    case .push:
      print(currentVC)
      //SceneCoordinator 구현 시 주의 사항
      //VC를 임베드하고 있는 컨트롤러(ex. NavVC, TabbarVC)가 아니라, 실제 화면에 표시되어있는 VC를 기준으로 전환을 처리해야함
      guard let nav = currentVC.navigationController else {
        subject.onError(TransitionError.navigationControllerMissing)
        break
      }
      
      //willShow -> delegate 메소드가 실행될 때마다 nextEvent를 방출하는 control event
      nav.rx.willShow
        .subscribe(onNext: { [unowned self] evt in
          self.currentVC = evt.viewController.sceneViewController
        })
        .disposed(by: bag)
      
      nav.pushViewController(target, animated: animated)
      currentVC = target.sceneViewController
      
      subject.onCompleted()
    case .modal:
      currentVC.present(target, animated: animated) {
        subject.onCompleted()
      }
      currentVC = target.sceneViewController
    }
    
    return subject.ignoreElements() //PublishSubject인 subject의 반환값을 Completable로 변환해줌.
  }
  
  @discardableResult
  func close(animated: Bool) -> Completable {
    return Completable.create { [unowned self] completable in
      if let presentingVC = self.currentVC.presentingViewController {
        self.currentVC.dismiss(animated: animated) {
          self.currentVC = presentingVC.sceneViewController
          completable(.completed)
        }
      } else if let nav = self.currentVC.navigationController {
        guard nav.popViewController(animated: animated) != nil else { completable(.error(TransitionError.cannotPop))
          return Disposables.create()
        }
        self.currentVC = nav.viewControllers.last!
        completable(.completed)
      } else {
        completable(.error(TransitionError.unknown))
      }
      return Disposables.create()
    }
  }
  
  
}
