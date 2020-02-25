//
//  RepositoryUseCase.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/25.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import RxSwift
import Domain

final class RepositoryUseCase: Domain.RepositoryUseCase {
    
    private var network: GithubRepoRepository
    
    init(network: GithubRepoRepository) {
        self.network = network
    }
    
    func getRepos(page: Int, size: Int) -> Observable<GithubRepoResponse> {
        return network.getRepositories(page: page, size: size)
    }
}
