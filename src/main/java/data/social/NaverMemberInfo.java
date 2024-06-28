package data.social;

import java.util.Map;

public class NaverMemberInfo implements OAuth2MemberInfo {
	public NaverMemberInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	private Map<String, Object> attributes;
	
	@Override
	public String getProvider() {
		return "naver";
	}

	@Override
	public String getName() {
		return (String) attributes.get("name");
	}

	@Override
	public String getId() {
		return (String) attributes.get("email");
	}

	@Override
	public String getPhoto() {
		return (String) attributes.get("profile_image");
	}
}
