package data.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebsocketConfig implements WebSocketConfigurer{
	@Autowired
	ChatWebsocketHandler chatHandler;
	@Autowired
	PageWebsocketHandler planHandler;
	@Autowired
	PageWebsocketHandler pageHandler;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chatHandler, "/chat/{room}").setAllowedOrigins("localhost");
		registry.addHandler(planHandler, "/plan/{plan}").setAllowedOrigins("localhost");
		registry.addHandler(pageHandler, "/page/{plan}/{page}").setAllowedOrigins("localhost");
	}
}