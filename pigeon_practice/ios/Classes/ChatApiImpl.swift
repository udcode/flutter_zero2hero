// מחלקה נפרדת למימוש ה-API


import Contacts
class ChatApiImpl: NSObject, ChatApi {


    private let database: MessageDatabase
    private var callback: ChatCallback?

    init(database: MessageDatabase) {
        self.database = database
        super.init()
    }

    func getMessages(completion: @escaping (Result<[Message], Error>) -> Void) {
        let messages = database.getAllMessages()
        completion(.success(messages))
    }

    func sendMessage(message: Message, completion: @escaping (Result<Void, Error>) -> Void) {
        // save initial message
        var sentMessage = Message()
        sentMessage.id = message.id
        sentMessage.content = message.content
        sentMessage.sender = message.sender
        sentMessage.timestamp = message.timestamp
        sentMessage.status = "sent"

        database.saveMessage(sentMessage)
        completion(.success(()))

        // simulate delivery status
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            var deliveredMessage = Message()
            deliveredMessage.id = message.id
            deliveredMessage.content = message.content
            deliveredMessage.sender = message.sender
            deliveredMessage.timestamp = message.timestamp
            deliveredMessage.status = "delivered"

            self?.database.saveMessage(deliveredMessage)
            self?.callback?.onMessageStatusChanged(
                        messageId: message.id ?? "",
                        status: "delivered"
                    ) { result in
                        switch result {
                        case .success:
                            print("Successfully updated delivery status")
                        case .failure(let error):
                            print("Failed to update delivery status: \(error)")
                        }
                    }
        }

        // simulate read status
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            var readMessage = Message()
            readMessage.id = message.id
            readMessage.content = message.content
            readMessage.sender = message.sender
            readMessage.timestamp = message.timestamp
            readMessage.status = "read"

            self?.database.saveMessage(readMessage)
            self?.callback?.onMessageStatusChanged(
                        messageId: message.id ?? "",
                        status: "read"
                    ) { result in
                        switch result {
                        case .success:
                            print("Successfully updated delivery status")
                        case .failure(let error):
                            print("Failed to update delivery status: \(error)")
                        }
                    }

        }
    }

    func getContacts(completion: @escaping (Result<[Contact], Error>) -> Void) {
        var contacts: [Contact] = []
        let store = CNContactStore()

        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])

        do {
            try store.enumerateContacts(with: request) { contact, _ in
                if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
                    var newContact = Contact()
                    newContact.id = contact.identifier
                    newContact.name = "\(contact.givenName) \(contact.familyName)"
                    newContact.phoneNumber = phoneNumber
                    contacts.append(newContact)
                }
            }
            completion(.success(contacts))
        } catch {
            completion(.failure(error))
        }
    }

    func saveMessage(message: Message, completion: @escaping (Result<Void, Error>) -> Void) {
        database.saveMessage(message)
        completion(.success(()))
    }
}
