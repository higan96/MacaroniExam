//
//  APIClient.swift
//  MacaroniExam
//
//  Created by Norihiko Oba on 2019/02/14.
//  Copyright © 2019 Norihiko Oba. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

// APIとの通信のみを行う
class APIClent {
    private let URLSession: URLSession
    
    init(URLSession: URLSession) {
        self.URLSession = URLSession
    }
    
    func request(url: URL) -> Observable<Data> {
        let request = URLRequest(url: url)
        return URLSession.rx.response(request: request)
            .map { pair -> Data in
                if 200..<300 ~= pair.response.statusCode {
                    return pair.data
                } else {
                    throw RxCocoaURLError.httpRequestFailed(response: pair.response, data: pair.data)
                }
        }
    }
}
