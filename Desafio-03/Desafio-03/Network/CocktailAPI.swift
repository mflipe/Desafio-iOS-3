// CocktailAPI.swift

import Alamofire

class CocktailAPI: API {
    
    func getDrinks(completion: @escaping (DrinkResponse?) -> Void) {
        request(url: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass", completion: completion)
    }
    
    func getDrinkDetails(drinkId: String, completion: @escaping (DrinkData?) -> Void) {
        request(
            url: "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(drinkId)",
            completion: completion
        )
    }
    
    
    private func request<T: Decodable>(
        url: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        completion: @escaping (T?) -> Void
    ) {
        AF.request(
            url,
            method: method,
            parameters: parameters,
            encoding: URLEncoding.default,
            headers: ["Accept": "application/json"]
        ).responseDecodable(of: T.self) { response in
            if response.error != nil {
                completion(nil)
                return
            }
            
            if let object = response.value {
                completion(object)
                return
            }
            
            completion(nil)
        }
        
    }
    
}
