package data.websocket;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import data.dto.PageDto;
import data.mapper.PlannerMapper;
import data.service.PlannerService;

@Component
@Controller
public class PageWebsocketHandler extends TextWebSocketHandler {
    private static final Map<String, Set<WebSocketSession>> pages = new ConcurrentHashMap<>();
    private static final Map<String, String> pageContents = new ConcurrentHashMap<>();
    private static final Map<WebSocketSession, Integer> cursorPositions = new ConcurrentHashMap<>();
    @Autowired
    private PlannerService service;
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String page = getPage(session);
        pages.computeIfAbsent(page, k -> new CopyOnWriteArraySet<>()).add(session);
        if(pages.get(page).size() == 1) {
        	PageDto dto = service.getPage(Integer.parseInt(page), Integer.parseInt(getPlanner(session)));
        	String currentContent = dto.getContent();
        	pageContents.put(page, currentContent);
            session.sendMessage(new TextMessage(currentContent + "|" + 0)); // 기본 커서 위치 0으로 전송
        }else {
        	String currentContent = pageContents.getOrDefault(page, "");
            session.sendMessage(new TextMessage(currentContent + "|" + 0)); // 기본 커서 위치 0으로 전송
        }
    }

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String page = getPage(session);
        String[] parts = message.getPayload().split("\\|");
        String currentContent = parts[0];
        int cursorPosition = Integer.parseInt(parts[1]);

        pageContents.put(page, currentContent);
        cursorPositions.put(session, cursorPosition);

        for (WebSocketSession webSocketSession : pages.get(page)) {
            if (webSocketSession.isOpen()) {
            	int position = cursorPositions.getOrDefault(webSocketSession, 0);
            	webSocketSession.sendMessage(new TextMessage(currentContent + "|" + position));
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, org.springframework.web.socket.CloseStatus status) throws Exception {
        String page = getPage(session);
        Set<WebSocketSession> pageSessions = pages.getOrDefault(page, new CopyOnWriteArraySet<>());
        pageSessions.remove(session);
        cursorPositions.remove(session);

        // 모든 사용자가 연결을 끊었는지 확인하고 콘텐츠 초기화
        if (pageSessions.isEmpty()) {
            pages.remove(page);
            pageContents.remove(page);
        }
    }

    private String getPage(WebSocketSession session) {
        return session.getUri().getPath().split("/")[3];
    }
    private String getPlanner(WebSocketSession session) {
    	return session.getUri().getPath().split("/")[2];
    }
}