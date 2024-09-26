//: [Previous](@previous)

import Foundation
import Network
var greeting = "Hello, playground"

//: [Next](@next)

public struct PostModel: Codable{
    var body,title: String?
    var id,userId: Int
}

//Basic approch
func fetchData<T:Codable>(url: String,completion: @escaping (Result<T,Error>) -> Void){
    if let url = URL(string: postUrl){
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let err = error{
                print(err.localizedDescription)
                completion(.failure(err))
                return
            }
            guard let data = data else{
                print("No data")
                return
            }
            do{
                //                if let json = try JSONSerialization.jsonObject(with: data,options: []) as? [Any]{
                //                    print("response json:\(json)")
                //                }
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            }catch let error{
                print("failed to parsed")
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

/*
fetchData(url: postUrl) { (result: Result<[PostModel],Error>) in
//  Result<Decodable & Encodable, Error> in
    switch result {
    case .success(let success):
        print(success)
    case .failure(let failure):
        print(failure.localizedDescription)
    }
}
*/
