//
//  Network.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/25.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

final class Network {
    private var session: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.httpAdditionalHeaders = [
            APIHeader.contentType: APIHeader.contentTypeValue,
            APIHeader.accept: APIHeader.acceptValue
        ]
        let session = Alamofire.Session(configuration: configuration, serverTrustManager: nil)
        return session
    }()
    
    private let queue = DispatchQueue.global(qos: .utility)
    
    func requestItem<T: Codable>(_ input: APIInput) -> Observable<T> {
        return Observable.create { (observer) -> Disposable in
            
            let request = self.session.request(input.urlEncoding,
                                               method: input.method,
                                               parameters: input.parameters,
                                               encoding: input.encoding,
                                               headers: input.headers,
                                               interceptor: nil)
                .responseDecodable(of: T.self, queue: self.queue, decoder: JSONDecoder()) { (response) in
                    
                    switch response.result {
                    case .success(let value):
                        observer.on(.next(value))
                    case .failure(let error):
                        observer.on(.error(error))
                    }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
        .debug(input.urlEncoding, trimOutput: true)
    }
    
    func requestItems<T: Codable>(_ input: APIInput) -> Observable<[T]> {
        return Observable.create { (observer) -> Disposable in
            
            let request = self.session.request(input.urlEncoding,
                                               method: input.method,
                                               parameters: input.parameters,
                                               encoding: input.encoding,
                                               headers: input.headers,
                                               interceptor: nil)
                .responseDecodable(of: [T].self, queue: self.queue, decoder: JSONDecoder()) { (response) in
                    
                    switch response.result {
                    case .success(let value):
                        observer.on(.next(value))
                    case .failure(let error):
                        observer.on(.error(error))
                    }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
        .debug(input.urlEncoding, trimOutput: true)
    }
    
}
