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
public class PlannerWebsocketHandler extends TextWebSocketHandler {
	private static final Map<String, Set<WebSocketSession>> planners = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String planner = getPlanner(session);
        planners.computeIfAbsent(planner, k -> new CopyOnWriteArraySet<>()).add(session);
    }

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String planner = getPlanner(session);
        
        for (WebSocketSession webSocketSession : planners.get(planner)) {
            if (webSocketSession.isOpen()) {
                webSocketSession.sendMessage(new TextMessage(message.getPayload()));
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, org.springframework.web.socket.CloseStatus status) throws Exception {
        String planner = getPlanner(session);
        planners.getOrDefault(planner, new CopyOnWriteArraySet<>()).remove(session);
    }
    
    // Getting page
    private String getPlanner(WebSocketSession session) {
        return session.getUri().getPath().split("/")[2];
    }
}