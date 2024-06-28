package data.websocket;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class PageWebsocketHandler extends TextWebSocketHandler {
	private static final Map<String, Set<WebSocketSession>> pages = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String page = getPage(session);
        pages.computeIfAbsent(page, k -> new CopyOnWriteArraySet<>()).add(session);
    }

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String page = getPage(session);
        
        for (WebSocketSession webSocketSession : pages.get(page)) {
            if (webSocketSession.isOpen()) {
                webSocketSession.sendMessage(new TextMessage(message.getPayload()));
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, org.springframework.web.socket.CloseStatus status) throws Exception {
        String page = getPage(session);
        pages.getOrDefault(page, new CopyOnWriteArraySet<>()).remove(session);
    }
    
    // Getting page
    private String getPage(WebSocketSession session) {
        return session.getUri().getPath().split("/")[2];
    }
}