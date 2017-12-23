//
//  TWHTTPSessionManager.swift
//  Tweet
//
//  Created by Fady on 12/22/17.
//  Copyright © 2017 Eventtus. All rights reserved.
//

import Foundation
import Networking

struct HTTPMethod {
    static let get = "GET"
    static let post = "POST"
}

struct AuthorizationKeys {
    static let consumerKey = "oauth_consumer_key"
    static let nonce = "oauth_nonce"
    static let signature = "oauth_signature"
    static let signatureMethod = "oauth_signature_method"
    static let timeStamp = "oauth_timestamp"
    static let token = "oauth_token"
    static let version = "oauth_version"
}

struct AuthorizationValues {
    static let version = "1.0"
    static let signatureMethod = "HMAC-SHA1"
}

class TWHTTPSessionManager {
    
    static let sharedInstance = TWHTTPSessionManager()
    static var twManager = Networking(baseURL: TWNetworkingConstants.baseUrl)
    
    func setRequestHeader(httpMethod: String, requestUrl: String, requestParameters: [String:String]?) {
        let headerString = self.generateHeaderString(httpMethod: httpMethod, requestUrl: requestUrl, requestParameters: requestParameters)
        print(headerString)
        type(of: self).twManager.setAuthorizationHeader(headerValue: headerString)
    }
    
    func generateHeaderString(httpMethod: String, requestUrl: String, requestParameters: [String:String]?) -> String {
        var parameters = generateParametersString(requestParameters: requestParameters)
        let singatureValue = self.generateOAuthSignature(httpMethod: httpMethod, requestUrl: requestUrl, requestParameters: requestParameters)
        let encodedSignatureKey = AuthorizationKeys.signature.stringByAddingPercentEncodingForRFC3986()
        let encodedSignatureValue = singatureValue.stringByAddingPercentEncodingForRFC3986()
        let signatureParameter = NetworkParameter(key: encodedSignatureKey!, value: encodedSignatureValue!)
        parameters.append(signatureParameter)

        let headerString = generateNetworkingHeaderString(networkingParameters: parameters)
        return headerString
    }
    
    func generateOAuthSignature(httpMethod: String, requestUrl: String, requestParameters: [String:String]?) -> String {
        let baseString = generateSignatureBaseString(httpMethod: httpMethod, requestUrl: requestUrl, requestParameters: requestParameters)
        let signingKey = createSigningKey()
        let signatureString = String(format: "%@%@", signingKey, baseString)
        let hashedOAuthSignature = signatureString.hmac(algorithm: .SHA1, key: signatureString)
        return hashedOAuthSignature
    }
    
    func createSigningKey() -> String {
        let consumerSecret = TwitterKeys.consumerSecret.stringByAddingPercentEncodingForRFC3986()
        let authTokenSecret = TwitterKeys.accessTokenSecret.stringByAddingPercentEncodingForRFC3986()
        let signingKey = String(format: "%@&%@", consumerSecret!, authTokenSecret!)
        return signingKey
    }
    
    func generateSignatureBaseString(httpMethod: String, requestUrl: String, requestParameters: [String:String]?) -> String {
        let parametersArray = self.generateParametersString(requestParameters: requestParameters)
        let parametersString = String.generateSignatureBaseString(networkingParameters: parametersArray)
        let encodedParametersString = parametersString.stringByAddingPercentEncodingForRFC3986()
        let encodedUrl = requestUrl.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let baseString = String(format: "%@&%@&%@", httpMethod, encodedUrl!, encodedParametersString!)
        return baseString
    }
    
    func generateParametersString(requestParameters: [String:String]?) -> [NetworkParameter] {
        var networkParameters = [NetworkParameter]()
        
        if let parameters = requestParameters {
            for parameter in parameters {
                let encodedKey = parameter.key.stringByAddingPercentEncodingForRFC3986()
                let encodedValue = parameter.value.stringByAddingPercentEncodingForRFC3986()
                let networkParameter = NetworkParameter(key: encodedKey!, value: encodedValue!)
                networkParameters.append(networkParameter)
            }
        }
        
        let encodedConsumerKey = AuthorizationKeys.consumerKey.stringByAddingPercentEncodingForRFC3986()
        let encodedConsumerKeyValue = TwitterKeys.consumerKey.stringByAddingPercentEncodingForRFC3986()
        let consumerKeyParameter = NetworkParameter(key: encodedConsumerKey!, value: encodedConsumerKeyValue!)
        networkParameters.append(consumerKeyParameter)
        
        let encodedNonceKey = AuthorizationKeys.nonce.stringByAddingPercentEncodingForRFC3986()
        let uuid: CFUUID = CFUUIDCreate(nil)
        let nonce: CFString = CFUUIDCreateString(nil, uuid)
        let nonceParameter = NetworkParameter(key: encodedNonceKey!, value: nonce as String)
        networkParameters.append(nonceParameter)
        
        let encodedSignatureMethodKey = AuthorizationKeys.signatureMethod.stringByAddingPercentEncodingForRFC3986()
        let encodedSignatureValue = AuthorizationValues.signatureMethod.stringByAddingPercentEncodingForRFC3986()
        let signatureMethodParameter = NetworkParameter(key: encodedSignatureMethodKey!, value: encodedSignatureValue!)
        networkParameters.append(signatureMethodParameter)
        
        let encodedTimeStampKey = AuthorizationKeys.timeStamp.stringByAddingPercentEncodingForRFC3986()
        let timeStamp = NSDate().timeIntervalSince1970
        let integerTime: NSInteger = NSInteger(timeStamp)

        let timeStampString = String(describing: integerTime)
        let encodedTimeStampValue = timeStampString.stringByAddingPercentEncodingForRFC3986()
        let timeStampParameter = NetworkParameter(key: encodedTimeStampKey!, value: encodedTimeStampValue!)
        networkParameters.append(timeStampParameter)
        
        let encodedOAuthTokenKey = AuthorizationKeys.token.stringByAddingPercentEncodingForRFC3986()
        let encodedOAuthTokenValue = TwitterKeys.accessToken.stringByAddingPercentEncodingForRFC3986()
        let authTokenParameter = NetworkParameter(key: encodedOAuthTokenKey!, value: encodedOAuthTokenValue!)
        networkParameters.append(authTokenParameter)
        
        let encodedVersionKey = AuthorizationKeys.version.stringByAddingPercentEncodingForRFC3986()
        let encodedVersionValue = AuthorizationValues.version.stringByAddingPercentEncodingForRFC3986()
        let versionParameter = NetworkParameter(key: encodedVersionKey!, value: encodedVersionValue!)
        networkParameters.append(versionParameter)
        
        networkParameters.sort { $0.key < $1.key }
        return networkParameters
    }
    
    func generateNetworkingHeaderString(networkingParameters: [NetworkParameter]) -> String {
        var result = ""
        
        for (index,parameter) in networkingParameters.enumerated() {
            if (index != 0) {
                result = String(format: "%@, %@=\"%@\"", result, parameter.key, parameter.value)
            } else {
                result = String(format: "%@=\"%@\"", parameter.key, parameter.value)
            }
        }
        
        let endResult = String(format: "OAuth %@",result)
        return endResult
    }
}
