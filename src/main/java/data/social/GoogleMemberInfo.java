package data.social;

import java.util.Map;

public class GoogleMemberInfo implements OAuth2MemberInfo {
	private Map<String, Object> attributes;
	public GoogleMemberInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	@Override
	public String getProvider() {
		return "google";
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
		return (String) attributes.get("picture");
	}
}
