//
//  GithubRepoRepository.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/25.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import RxSwift
import Domain

final class GithubRepoRepository {
    
    func getRepositories(page: Int, size: Int = 10) -> Observable<GithubRepoResponse> {
        let queries = [
            URLQueryItem(name: "q", value: "language:swift"),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "per_page", value: "\(size)")
        ]
        let endpoint = APIInput(urlString: "https://api.github.com/search/repositories",
                                method: .get,
                                queries: queries)
        return Network.shared.requestItem(endpoint)
    }
}
