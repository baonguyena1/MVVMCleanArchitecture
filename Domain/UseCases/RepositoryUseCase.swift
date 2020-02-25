//
//  RepositoryUseCase.swift
//  Domain
//
//  Created by Storm Ng on 2020/02/25.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation
import RxSwift

public protocol RepositoryUseCase {
    func getRepos(page: Int, size: Int) -> Observable<GithubRepoResponse>
}
