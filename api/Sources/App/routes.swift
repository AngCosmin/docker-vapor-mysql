import Vapor

// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    struct MySQLVersion: Codable {
        let version: String
    }

    router.get("sql") { req in
        return req.withPooledConnection(to: .mysql) { conn in
            return conn.raw("SELECT @@version as version").all(decoding: MySQLVersion.self)
        }.map { rows in
            return rows[0].version
        }
    }

    // Example of configuring a controller
    let userController = UserController()
    router.get("users", use: userController.index)
    router.post("users", use: userController.create)
    router.delete("users", User.parameter, use: userController.delete)
}
