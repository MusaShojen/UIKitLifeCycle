//
//  NetWorking.swift
//  NavigationAndLifecycle
//
//  Created by Муса Шогенов on 5.10.2023.
//




        import Foundation

        class NetWorking {
            func createURL(_ query: String) -> URL? {
                let baseUrl = "https://api.api-ninjas.com/v1/nutrition?query="
                if let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                    let urlString = baseUrl + encodedQuery
                    if let url = URL(string: urlString) {
                        return url
                    }
                }
                return nil
            }

            func fetchData(_ query: String) async throws -> Nutrition {
                guard let url = createURL(query) else { throw Errors.badURL }
                let apiKey = "PvmCVYETOZAFN9KYsfBWWw==pDf8rcO5S3jD1OnT"
                var request = URLRequest(url: url)
                request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
                
                do {
                    let (data, _) = try await URLSession.shared.data(for: request)
                    
                   
                    let decoder = JSONDecoder()
                    
                    
                    let result = try decoder.decode([Nutrition].self, from: data)
                    
                   
                    
                    return result[0]
                } catch {
                    
                    print("Decode failed:", error)
                    
                    throw error
                   
                }
            }
        }

        enum Errors: Error {
            case badURL
            case incorrectURL
        }

     

