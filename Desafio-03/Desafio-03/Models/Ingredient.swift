import Foundation

struct Ingredient: Decodable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let measure: String
}
