import KituraWebSocket
import LoggerAPI
import Foundation

class PathService: WebSocketService {
    var messageCounter = 0

    public func connected(connection: WebSocketConnection) {
        Log.info("established a connection: \(connection)")
    }

    public func disconnected(connection: WebSocketConnection, reason: WebSocketCloseReasonCode) {
        Log.info("connection closed with reason: \(reason)")
    }

    public func received(message: Data, from: WebSocketConnection) {

    }

    public func received(message: String, from: WebSocketConnection) {
        messageCounter += 1
        Log.info("Message #\(messageCounter) received: \(message)")
        from.send(message: "You've sent the following message to WebSocket id #\(from.id): \"\(message)\", and this is message #\(messageCounter) for this webSocket.")
    }
}
