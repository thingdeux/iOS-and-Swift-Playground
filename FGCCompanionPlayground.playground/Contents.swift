//: Playground - noun: a place where people can play

import UIKit
// Allow ASync Code
//XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

enum JSONError: String, ErrorType {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
}

func jsonParser() {
    let urlPath = "https://api.twitch.tv/kraken/games/top/"
    guard let endpoint = NSURL(string: urlPath) else { print("Error creating endpoint");return }
    let request = NSMutableURLRequest(URL:endpoint)
                print("Made this1")
    NSURLSession.sharedSession().dataTaskWithRequest(request) {
        (data, response, error) -> Void in
        
        do {
            print("Made this2")
            guard let dat = data else { throw JSONError.NoData }
            guard let json = try NSJSONSerialization.JSONObjectWithData(dat, options: []) as? NSDictionary else { throw JSONError.ConversionFailed }
            print(json)
        } catch let error as JSONError {
            print(error.rawValue)
        } catch {
            print(error)
        }
        }.resume()
}

jsonParser()