// JaymeExample
// PostRepository.swift
//
// Copyright (c) 2016 Inaka - http://inaka.net/
//
// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements. See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership. The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License. You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

import Foundation

class PostRepository: CRUDRepository {
    
    typealias EntityType = Post
    let backend = NSURLSessionBackend()
    let name = "posts"
    
    func findPostsForUser(user: User) -> Future<[Post], JaymeError> {
        return self.findAll().map {
            $0.filter { $0.authorID == user.id }
        }
    }
    
}
