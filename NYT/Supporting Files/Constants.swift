//
//  Constants.swift
//  NYT
//
//  Created by Iman Zabihi on 25/09/2021.
//

import Foundation

struct K {
    static let DomainUrl = "https://api.nytimes.com/svc/mostpopular/v2/"
    static let articleSearchUrl = "https://api.nytimes.com/svc/search/v2/"
    static let apiKey = "xguSPAsxk9LDcXiBLtFYXCLu2TgKrpya"
    static let mostViewdUrl = K.DomainUrl + "viewed/7.json?api-key=" + K.apiKey
    static let mostSharedUrl = K.DomainUrl + "shared/7/facebook.json?api-key=" + K.apiKey
    static let mostEmailedUrl = K.DomainUrl + "emailed/7.json?api-key=" + K.apiKey
} 
