//
//  GithubRepoResponse.swift
//  Domain
//
//  Created by Storm Ng on 2020/02/25.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import Foundation

public struct GithubRepoResponse: Codable {

    public let totalCount: Int?
    public let incompleteResults: Bool?
//    let items: [Item]?

    enum CodingKeys: String, CodingKey {
            case totalCount = "total_count"
            case incompleteResults = "incomplete_results"
//            case items = "items"
    }

    public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            totalCount = try values.decodeIfPresent(Int.self, forKey: .totalCount)
            incompleteResults = try values.decodeIfPresent(Bool.self, forKey: .incompleteResults)
//            items = try values.decodeIfPresent([Item].self, forKey: .items)
    }

}
