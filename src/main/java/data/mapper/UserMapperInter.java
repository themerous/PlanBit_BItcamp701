package data.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import data.dto.UserDto;

@Mapper
public interface UserMapperInter {
	//회원가입 이벤트
	@Insert("""
				insert into user (id,pw,name,photo)
				value (#{id},#{pw},#{name},#{photo})
			""")
	public void insertUser(UserDto dto);
	//로그인 이벤트
	@Select("select count(*) from user where id=#{id} and pw=#{pw}")
	public int logincheck(String id, String pw);
	//아이디 중복체크 이벤트
	@Select("select count(*) from user where id=#{searchid}")
	public int idcheckcount(String searchid);
	//아이디로 비밀번호 가져오기
	@Select("select * from user where id = #{id} and provider = 'bit'")
	public UserDto databyid(String id);
	//비밀번호 재설정
	@Update("update user set pw=#{pw} where id=#{id}")
	public void updatepw(String pw,String id);

	@Select("select user_num from user where id = #{id} and provider = #{provider}")
	public int getUserNum(String id,String provider);
	
	@Select("select * from user where user_num = #{num}")
	public UserDto getUser(int num);
}
