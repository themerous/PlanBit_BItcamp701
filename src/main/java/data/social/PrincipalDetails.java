package data.social;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

import data.dto.UserDto;
import lombok.Getter;

@Getter
public class PrincipalDetails implements OAuth2User {
	private UserDto dto;
	private Map<String, Object> attributes;

	public PrincipalDetails(UserDto dto) {
		this.dto = dto;
	}

	public PrincipalDetails(UserDto dto, Map<String, Object> attributes) {
		this.dto = dto;
		this.attributes = attributes;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collect = new ArrayList<>();
		/*
		collect.add(new GrantedAuthority() {
			@Override
			public String getAuthority() {
				return dto.getRole();
			}
		});
		*/
		return collect;
	}

	@Override
	public String getName() {
		return dto.getName();
	}
}
