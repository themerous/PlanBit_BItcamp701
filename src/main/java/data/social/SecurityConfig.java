package data.social;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity 
public class SecurityConfig {
	private final OAuth2MemberService oAuth2MemberService;
	
    public SecurityConfig(OAuth2MemberService oAuth2MemberService) {
        this.oAuth2MemberService = oAuth2MemberService;
    }
	
	@Bean(name = "securityFilterChain")
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{
        return httpSecurity
        		 .httpBasic().disable()
                 .csrf().disable()
                 .cors().and()
                 .authorizeRequests()
                 .antMatchers("/private/**").authenticated() //private로 시작하는 uri는 로그인 필수
                 .anyRequest().permitAll() //나머지 uri는 모든 접근 허용
                 .and().oauth2Login()
                 .loginPage("/bit/login") //로그인이 필요한데 로그인을 하지 않았다면 이동할 uri 설정
                 .failureUrl("/bit/login-error")
                 .defaultSuccessUrl("/") //OAuth 구글 로그인이 성공하면 이동할 uri 설정
                 .userInfoEndpoint()//로그인 완료 후 회원 정보 받기
                 .userService(oAuth2MemberService).and().and().build(); //로그인 후 받아온 유저 정보 처리
    }
}
