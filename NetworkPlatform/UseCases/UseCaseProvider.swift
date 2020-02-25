//
//  UseCaseProvider.swift
//  NetworkPlatform
//
//  Created by Storm Ng on 2020/02/25.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import Domain

final class UseCaseProvider: Domain.UseCaseProvider {
    
    private let networkProvider: NetworkProvider
    
    init() {
        self.networkProvider = NetworkProvider()
    }
    
    func makeRepositoryUseCase() -> Domain.RepositoryUseCase {
        return RepositoryUseCase(network: networkProvider.makeGithubRepoRepository())
    }
}
