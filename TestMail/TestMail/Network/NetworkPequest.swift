//
//  NetworkPequest.swift
//  TestMail
//
//  Created by Алексей Шевченко on 09.02.2023.
//

import Foundation

class NewtWorkRequest {
    static let shared = NewtWorkRequest()
    private init() {}
    
    func requestData(verifiableMail: String, completion: @escaping(Result<Data, Error>) -> Void) {
        let urlString: String = "https://api.kickbox.com/v2/verify?email=\(verifiableMail)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }.resume()
    }
}
