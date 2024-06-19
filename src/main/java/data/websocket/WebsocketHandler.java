package data.websocket;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class WebsocketHandler extends TextWebSocketHandler {
	private static final Map<String, Set<WebSocketSession>> chatRooms = new ConcurrentHashMap<>();
	private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String room = getRoom(session);
        chatRooms.computeIfAbsent(room, k -> new CopyOnWriteArraySet<>()).add(session);
    }

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String room = getRoom(session);
        MessageObject mo = objectMapper.readValue(message.getPayload(), MessageObject.class);
        
        for (WebSocketSession webSocketSession : chatRooms.get(room)) {
            if (webSocketSession.isOpen()) {
                webSocketSession.sendMessage(new TextMessage(objectMapper.writeValueAsString(mo)));
            }
        }
   }

    @Override
    public void afterConnectionClosed(WebSocketSession session, org.springframework.web.socket.CloseStatus status) throws Exception {
        String room = getRoom(session);
        chatRooms.getOrDefault(room, new CopyOnWriteArraySet<>()).remove(session);
    }
    
    // Getting the room name
    private String getRoom(WebSocketSession session) {
        return session.getUri().getPath().split("/")[2];
    }
}