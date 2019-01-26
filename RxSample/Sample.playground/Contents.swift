//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import RxCocoa

var bag = DisposeBag()

//let observable = Observable.just("Hello Rx!")
//let subscription = observable.subscribe { print($0) }
//subscription.disposed(by: bag)
//
//
//var publishSubject = PublishSubject<String>()
//
//publishSubject.onNext("Hello")
//publishSubject.onNext("World")
//
//let subscription1 = publishSubject.subscribe {
//    print($0)
//}.disposed(by: bag)
//
//publishSubject.onNext("Hey")
//publishSubject.onNext("Again")
//
//let subscription2 = publishSubject.subscribe(onNext: {
//    print(#line, $0)
//}).disposed(by: bag)
//
//publishSubject.onNext("Morning")
//
//
//
//
//
//var ish = BehaviorSubject<[String]>(value: [])
//
//ish.onNext(["nothing"])
//
//ish.asObservable()
//    .map({ (ishs) -> [String] in
//        return ishs.map { ish -> String in
//            return "\(ish)\(ish.last ?? Character("-"))ish"
//        }
//    })
//    .subscribe(onNext: { (values) in
//        print(values)
//    }).disposed(by: bag)
//
//
//
//
//let balls = Variable<[String]>(["foot"])
//
//balls.asObservable()
//    .map({ (ballArr) -> [String] in
//        return ballArr.map { (ball) -> String in
//            return "\(ball)-ball"
//        }
//    })
//    .subscribe(onNext: { (value) in
//        print("Balls : \(value)")
//    }, onCompleted: {
//        print("Done")
//    }, onDisposed: {
//        print("DisposedAF")
//    }).disposed(by: bag)
//
//balls.value.append("basket")
//balls.value.append(contentsOf: ["volley", "cricket"])
//balls.value.removeAll()
//
//bag = DisposeBag()
//
//
//
//
//
//
//
//
//let repo = "ReactiveX/RxSwift"
//
//let response = Observable.from([repo])
//    .map { (urlString) -> URL in
//        return URL(string: "https://api.github.com/repos/\(urlString)/events")!
//    }.map { (url) -> URLRequest in
//        return URLRequest(url: url)
//    }.flatMap { request -> Observable<(response: HTTPURLResponse, data: Data)> in
//        return URLSession.shared.rx.response(request: request)
//    }.filter { (response, _) -> Bool in
//        return 200..<300 ~= response.statusCode
//    }.map { (_, data) -> [[String: Any]] in
//        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
//            let result = jsonObject as? [[String: Any]] else {
//                return []
//        }
//        return result
//    }.filter { (objects) -> Bool in
//        return objects.count > 0
//    }.subscribe(onNext: { (newEvents) in
//        print(newEvents.count)
//    }).disposed(by: bag)
//
//


//let host = CFHostCreateWithName(nil,"http://www.naviadoctors.com" as CFString).takeRetainedValue()
//CFHostStartInfoResolution(host, .addresses, nil)
//var success: DarwinBoolean = false
//if let addresses = CFHostGetAddressing(host, &success)?.takeUnretainedValue() as NSArray? {
//    for case let theAddress as NSData in addresses {
//        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
//        if getnameinfo(theAddress.bytes.assumingMemoryBound(to: sockaddr.self), socklen_t(theAddress.length),
//                       &hostname, socklen_t(hostname.count), nil, 0, NI_NUMERICHOST) == 0 {
//            let numAddress = String(cString: hostname)
//            print(numAddress)
//        }
//    }
//}

var quoteTextField = UITextField()
let quoteLabel = UILabel()

quoteTextField.text = "kapil"

quoteTextField.rx.text.asObservable().bind(to: quoteLabel.rx.text).disposed(by: bag)

let segment = UISegmentedControl(items: ["Dark", "Light"])
segment.selectedSegmentIndex = 0


segment.rx.selectedSegmentIndex.asObservable()
    .map { (index) -> String in
        print(index)
        return index == 0 ? "Dark": "Light"
    }.subscribe(onNext: { print($0) })
    .disposed(by: bag)

segment.rx.selectedSegmentIndex.onNext(1)

print(quoteLabel.text ?? "?")

//var arr = [1,2,3]
//for n in arr {
//    print(n)
//    arr = [4,5,6]
//}
//print(arr)

