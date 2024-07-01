package data.social;

import java.util.Map;

public class KakaoMemberInfo implements OAuth2MemberInfo {
	private Map<String, Object> attributes;
	private Map<String, Object> kakaoAccountAttributes;
	private Map<String, Object> profileAttributes;

	public KakaoMemberInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
		this.kakaoAccountAttributes = (Map<String, Object>) attributes.get("kakao_account");
		this.profileAttributes = (Map<String, Object>) kakaoAccountAttributes.get("profile");

	}

	@Override
	public String getProvider() {
		return "kakao";
	}

	@Override
	public String getName() {
		return profileAttributes.get("nickname").toString();
		//Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
		//Map<String, Object> profile = (Map<String, Object>) kakaoAccount.get("profile");
		//return profile.get("nickname").toString();
	}

	@Override
	public String getId() {
		return kakaoAccountAttributes.get("email").toString();
		//Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
		//return kakaoAccount.get("email").toString();
	}

	@Override
	public String getPhoto() {
		return profileAttributes.get("profile_image_url").toString();
		//Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
		//return kakaoAccount.get("email").toString();
	}
}
