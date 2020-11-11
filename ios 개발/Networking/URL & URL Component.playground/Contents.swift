import UIKit

// URL
let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url = URL(string: urlString)

url?.absoluteString // 주소
url?.scheme // https 프로토콜
url?.host // itunes.apple.com
url?.path // /search
url?.query // media=music&entity=song&termGdragon
url?.baseURL // nil

let baseURL = URL(string: "https://itunes.apple.com")
let relatvieURL = URL(string: "search?media=music&entity=song&term=Gdragon",
                      relativeTo: baseURL)

relatvieURL?.baseURL // itunes.apple.com

// URLComponets
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entitiy", value: "song")
let termQuery = URLQueryItem(name: "term", value: "Gdragon")

urlComponents?.queryItems?.append(mediaQuery)
urlComponents?.queryItems?.append(entityQuery)
urlComponents?.queryItems?.append(termQuery)

urlComponents?.url
urlComponents?.string
urlComponents?.queryItems
urlComponents?.queryItems?.last?.value
