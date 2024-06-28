package data.social;

public interface OAuth2MemberInfo {
    String getProvider(); //공급자 ex) google, facebook
    String getName(); //사용자 이름 ex) 홍길동 
    String getId(); //사용자 이메일 ex) gildong@gmail.com
    String getPhoto();
}
