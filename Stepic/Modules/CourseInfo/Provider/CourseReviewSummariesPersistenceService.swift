//
//  CourseReviewSummariesPersistenceService.swift
//  Stepic
//
//  Created by Vladislav Kiryukhin on 04.12.2018.
//  Copyright © 2018 Alex Karpov. All rights reserved.
//

import Foundation
import PromiseKit

protocol CourseReviewSummariesPersistenceServiceProtocol: class {
    func fetch(
        ids: [CourseReviewSummary.IdType],
        page: Int
    ) -> Promise<([CourseReviewSummary], Meta)>
    func fetch(id: CourseReviewSummary.IdType) -> Promise<CourseReviewSummary?>
}

final class CourseReviewSummariesPersistenceService: CourseReviewSummariesPersistenceServiceProtocol {
    func fetch(
        ids: [CourseReviewSummary.IdType],
        page: Int = 1
    ) -> Promise<([CourseReviewSummary], Meta)> {
        fatalError("Not implemented yet")
    }

    func fetch(id: CourseReviewSummary.IdType) -> Promise<CourseReviewSummary?> {
        return Promise { seal in
            CourseReviewSummary.fetchAsync(ids: [id]).done { reviewsSummary in
                seal.fulfill(reviewsSummary.first)
            }.catch { _ in
                seal.reject(Error.fetchFailed)
            }
        }
    }

    enum Error: Swift.Error {
        case fetchFailed
    }
}
