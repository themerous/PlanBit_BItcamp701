package data.social;

import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import data.dto.UserDto;
import data.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OAuth2MemberService extends DefaultOAuth2UserService {
	private final BCryptPasswordEncoder encoder;
	private final MemberMapper memberMapper;
	private final HttpSession session;

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		OAuth2User oAuth2User = super.loadUser(userRequest);
		OAuth2MemberInfo memberInfo = null;
		System.out.println(oAuth2User.getAttributes());
		System.out.println(userRequest.getClientRegistration().getRegistrationId());

		String registrationId = userRequest.getClientRegistration().getRegistrationId();
		System.out.println("registrationId = " + registrationId);
		if(registrationId.equals("google"))
		{
			memberInfo = new GoogleMemberInfo(oAuth2User.getAttributes());
		}
		else if(registrationId.equals("naver"))
		{
			memberInfo = new NaverMemberInfo((Map<String, Object>)oAuth2User.getAttributes().get("response"));
		}
		else if (registrationId.equals("kakao")) 
		{
            memberInfo = new KakaoMemberInfo(oAuth2User.getAttributes());
        } 
		else
		{
			System.out.println("로그인 실패");
		}

		String provider = memberInfo.getProvider();
		//String providerId = memberInfo.getProviderId();
		String name = memberInfo.getName();
		String id = memberInfo.getId();
		//String role = "ROLE_USER"; //일반 유저
		System.out.println(oAuth2User.getAttributes());
		Optional<UserDto> findMember = memberMapper.findUser(id,provider);
		UserDto dto;
		if(findMember.isEmpty())
		{//찾지 못하면
			dto = UserDto.builder()
					.name(name)
					.id(id)
					//.pw(encoder.encode("pw")) //encoder.encode
					//.role(role) //뺌
					.provider(provider)
					//.providerId(providerId) //뻄
					.build(); 
			memberMapper.save(dto);
		}
		else
		{
			dto = findMember.get();
		}
		
		// HttpSession에 사용자 정보 저장
        session.setAttribute("loginid",id);
        session.setAttribute("loginok", "yes");
        session.setAttribute("role", provider);
		
		//new PrincipalDetails(member, oAuth2User.getAttributes())
		return new PrincipalDetails(dto, oAuth2User.getAttributes());
	}
}
