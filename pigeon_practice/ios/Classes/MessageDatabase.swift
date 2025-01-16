import Foundation
import SQLite3

class MessageDatabase {
    private var db: OpaquePointer?

    init() {
        setupDatabase()
    }

    private func setupDatabase() {
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("messages.db")

        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error opening database")
            return
        }

        // יצירת טבלת ההודעות
        let createTableQuery = """
            CREATE TABLE IF NOT EXISTS messages (
                id TEXT PRIMARY KEY,
                content TEXT,
                sender TEXT,
                timestamp INTEGER,
                status TEXT
            );
        """

        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, createTableQuery, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Messages table created successfully")
            }
        }
        sqlite3_finalize(statement)
    }

    func saveMessage(_ message: Message) {
        let insertQuery = """
            INSERT OR REPLACE INTO messages (id, content, sender, timestamp, status)
            VALUES (?, ?, ?, ?, ?);
        """

        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (message.id as NSString?)?.utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (message.content as NSString?)?.utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (message.sender as NSString?)?.utf8String, -1, nil)
            sqlite3_bind_int64(statement, 4, Int64(message.timestamp ?? 0))
            sqlite3_bind_text(statement, 5, (message.status as NSString?)?.utf8String, -1, nil)

            if sqlite3_step(statement) == SQLITE_DONE {
                print("Message saved successfully")
            }
        }
        sqlite3_finalize(statement)
    }

    func getAllMessages() -> [Message] {
        var messages: [Message] = []
        let selectQuery = "SELECT * FROM messages ORDER BY timestamp DESC;"

        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, selectQuery, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                var message = Message()

                if let idPtr = sqlite3_column_text(statement, 0) {
                    message.id = String(cString: idPtr)
                }
                if let contentPtr = sqlite3_column_text(statement, 1) {
                    message.content = String(cString: contentPtr)
                }
                if let senderPtr = sqlite3_column_text(statement, 2) {
                    message.sender = String(cString: senderPtr)
                }
                message.timestamp = Int64(Int(sqlite3_column_int64(statement, 3)))
                if let statusPtr = sqlite3_column_text(statement, 4) {
                    message.status = String(cString: statusPtr)
                }

                messages.append(message)
            }
        }
        sqlite3_finalize(statement)

        return messages
    }

    deinit {
        if db != nil {
            sqlite3_close(db)
        }
    }
}
