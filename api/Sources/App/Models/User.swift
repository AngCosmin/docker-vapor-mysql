import FluentMySQL
import Vapor

final class User: MySQLModel {
    var id: Int?
    var name: String

    init(id: Int? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

/// Allows `User` to be used as a dynamic migration.
extension User: Migration { }

/// Allows `User` to be encoded to and decoded from HTTP messages.
extension User: Content { }

/// Allows `User` to be used as a dynamic parameter in route definitions.
extension User: Parameter { }
