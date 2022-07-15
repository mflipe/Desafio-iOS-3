// API.swift

protocol API {
    func getDrinks(completion: @escaping (DrinkResponse?) -> Void)
    func getDrinkDetails(drinkId: String, completion: @escaping (DrinkData?) -> Void)
}
