//
//  DarkSky.swift
//
//  Created by Josh Adams on 3/20/15.
//  Copyright (c) 2014 Josh Adams. All rights reserved.
//  This code is based on https://github.com/bfolder/Sweather .

import Foundation
import CoreLocation

public class DarkSky {
  private static let basePath = "https://api.forecast.io/forecast/"
  private static let apiKey = Config.darkSkyKey
  private static let noApiKey = "This app cannot query Dark Sky for current temperature and weather until you obtain an API key and put it in Config.swift. Here is the website to get an API key: https://developer.forecast.io/register You can ignore the following error message, which Dark Sky returned due to the empty API key."
  
  public enum Result {
    case Success(NSURLResponse!, NSDictionary!)
    case Error(NSURLResponse!, NSError!)
    
    public func data() -> NSDictionary? {
      switch self {
      case .Success(_, let dictionary):
        return dictionary
      case .Error(_, _):
        return nil
      }
    }
    
    public func response() -> NSURLResponse? {
      switch self {
      case .Success(let response, _):
        return response
      case .Error(let response, _):
        return response
      }
    }
    
    public func error() -> NSError? {
      switch self {
      case .Success(_, _):
        return nil
      case .Error(_, let error):
        return error
      }
    }
  }
  
  private var queue: NSOperationQueue;
  
  public init() {
    self.queue = NSOperationQueue()
  }
  
  public func currentWeather(coordinate: CLLocationCoordinate2D, callback: (Result) -> ()) {
    let coordinateString = "\(coordinate.latitude),\(coordinate.longitude)"
    call(coordinateString, callback: callback);
  }
  
  private func call(method: String, callback: (Result) -> ()) {    
    if DarkSky.apiKey == "" {
      fatalError(DarkSky.noApiKey)
    }
    let currentQueue = NSOperationQueue.currentQueue();
    let url = NSURL(string: DarkSky.basePath + DarkSky.apiKey + "/" + method)
    NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {(data, response, error) in
      let error: NSError? = error
      var dictionary: NSDictionary?

      if let data = data {
        do {
          try dictionary = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? NSDictionary
        }
        catch let error as NSError {
          print(error.localizedDescription)
        }
      }
      currentQueue?.addOperationWithBlock {
        var result = Result.Success(response, dictionary)
        if error != nil {
          result = Result.Error(response, error)
        }
        callback(result)
      }
    }).resume()
  }
}