package tiles.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.SimpleSpringPreparerFactory;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class TilesConfig {    	  
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions(new String[] {"/WEB-INF/tiles.xml"});
		tilesConfigurer.setCheckRefresh(true);
		//ViewPreparer에서 Autowired가 가능하게 하는 설정
		tilesConfigurer.setPreparerFactoryClass(SimpleSpringPreparerFactory.class);
		return tilesConfigurer;
	}

	@Bean
	public TilesViewResolver tilesViewResolver() {
		TilesViewResolver viewResolver = new TilesViewResolver();
		viewResolver.setViewClass(TilesView.class);
		viewResolver.setOrder(1);

		return viewResolver;
	}

	@Bean
	public UrlBasedViewResolver viewResolver() {
		final UrlBasedViewResolver resolver = new UrlBasedViewResolver();
		resolver.setViewClass(TilesView.class);
		resolver.setOrder(1); 	     
		return resolver;
	}
}