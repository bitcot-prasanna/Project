import Foundation

struct PaginationMain : Codable {
    var totalPassengers:Int
    var totalPages:Int
    var data:[Data]

	enum CodingKeys: String, CodingKey {
		case totalPassengers = "totalPassengers"
		case totalPages = "totalPages"
		case data = "data"
	}
}
