//
//  NetworkProvider.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/25.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation

final class NetworkProvider {
    
    func makeGithubRepoRepository() -> GithubRepoRepository {
        return GithubRepoRepository()
    }
}
