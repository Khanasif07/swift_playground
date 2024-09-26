//: [Previous](@previous)

import Foundation
import Network
import Combine
var postUrl = "https://jsonplaceholder.typicode.com/posts"
var usersUrl = "https://jsonplaceholder.typicode.com/users"
//Model
//=======
enum NetworkError: Error {
    case badURL
    case requestFailed
    case invalidResponse
    case decodingError
}

struct PostModel: Codable{
    var body,title: String
    var id,userId: Int
}

struct User: Codable {
    let id: Int
    let name: String
    let email: String
}

struct NewUser: Codable {
    let name: String
    let email: String
}

struct UserAPIServiceManager: UserAPIServiceProviderProtocol {
    func fetchUsers(_ urlString: String?) async throws -> [User] {
            do {
                let result:[User] = try await NetworkManager.shared.get(urlString: urlString!)
                return result
            } catch {
                throw error
            }
    }
}

protocol UserAPIServiceProviderProtocol {
    func fetchUsers(_ urlString:String?) async throws -> [User]
}


class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    // Generic function to perform a GET request
    func get<T: Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }

    // Generic function to perform a POST request
    func post<T: Encodable, R: Decodable>(urlString: String, body: T) async throws -> R {
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(body)
        request.httpBody = jsonData

        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(R.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}


func createUser() async {
    let newUser = NewUser(name: "John Doe", email: "john.doe@example.com")
    
    do {
        let response: User = try await NetworkManager.shared.post(urlString: usersUrl, body: newUser)
        print("User created with ID: \(response.id)")
    } catch {
        print("Failed to create user: \(error.localizedDescription)")
    }
}


//Task {
//    do {
//        try await createUser()
//    } catch {
//        print(error.localizedDescription)
//    }
//}

//Task {
//    do {
//        let result:[User] = try await NetworkManager.shared.get(urlString: usersUrl)
//        print(result)
//    } catch {
//        print(error.localizedDescription)
//    }
//}

//View Model..
class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var errorMessage: String?

    private let userService: UserAPIServiceProviderProtocol?
    private var cancellables = Set<AnyCancellable>()

    init() {
        self.userService = UserAPIServiceManager()
    }

    func fetchUsers() {
        Task {
            do {
                let fetchedUsers = try await userService?.fetchUsers(usersUrl)
                self.users = fetchedUsers!
                print(fetchedUsers)
            } catch {
                self.errorMessage = error.localizedDescription
                print(error.localizedDescription)
            }
        }
    }
}

var viewModel = UserViewModel()
viewModel.fetchUsers()
