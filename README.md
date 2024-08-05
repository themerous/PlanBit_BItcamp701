## 1. 프로젝트 기간
💎2024.05.22~2024.07.02💎
조원 : 6명

1주 : 아이디어 작성 / 스토리보드 작성 / ERD 모델구성 / DB 구성

2주 : 메인페이지 css 디자인 및 로그인 / 회원가입 / 비밀번호 찾기

3주 : 블로그 홈페이지 구성 및 게시물 작성 / 댓글 기능 / 좋아요

4주 : 즐겨찾기 / 플래너 / 채팅 / 추가기능

5주 : 발표준비 및 PPT 제작

BIT TRIP 이라는 제목으로 공동 플래너를 작성하고 그 플래너를 활용하여 여행후기를 블로그 형식으로 작성하는 사이트를 제작해보고자 계획하였다. 웹소켓을 활용하여 공동으로 참여해서 글을 쓸 수 있는 플래너 기능을 만들어보기로 하였고 지도 api를 활용한 게시물을 작성하고 배포까지 계획을 세웠다.

개발환경 
![](https://velog.velcdn.com/images/woong2/post/b058741d-2b4a-4d0b-9886-2e3942c1f865/image.png)

### 2-1. 메인페이지
![](https://velog.velcdn.com/images/woong2/post/1e4cdf34-0853-45f4-9a62-fc4feb612df1/image.png)
홈페이지를 밑으로 스크롤 가능하게 구현하였으며 헤더/풋터/사이드 버튼은 타일즈를 활용하여 다른 페이지로 넘어가도 유지되게 해보았다.
![](https://velog.velcdn.com/images/woong2/post/3afebd67-ca54-4c38-a493-b8295d64e94f/image.png)
메인페이지 두번째 부분으로 스크롤하면 BIT TRIP 사이트의 주요 기능들을 소개하도록 구성하였다.
![](https://velog.velcdn.com/images/woong2/post/4d85c5fe-8066-40bb-acd0-d6079a69059c/image.png)![](https://velog.velcdn.com/images/woong2/post/6bfef6c8-6554-4bf6-957b-93488fca3018/image.png)![](https://velog.velcdn.com/images/woong2/post/f04db25f-66ce-426f-9df8-3b16a43adfa5/image.png)
나머지 div들은 transform: scale을 활용하여 마우스 호버시 div가 움직이도록 역동적인 효과를 주웠고 작성한 블로그 게시물이 미리보기로 조금 뜨도록 페이지를 구성하였다.
### 2-2. 회원가입
![](https://velog.velcdn.com/images/woong2/post/6b3c0b3e-c00f-4e52-8aa6-d50a11917b4a/image.png)
회원가입 페이지에서는 이름 / 이메일(id용도) / 비밀번호 / 비밀번호 확인 / 프로필 이미지 순으로 user info를 저장하도록 하였고 중복버튼을 추가하여 이미 이메일이 있으면 '중복확인 버튼을 누르세요'라고 경고문구가 하단에 뜨게 만들었다. 비밀번호와 비밀번호 확인도 마찬가지로 틀리면 경고문구가 나타나도록 하였다.
### 2-3. 로그인 / 소셜로그인
![](https://velog.velcdn.com/images/woong2/post/f1dbbbd0-10f4-4d18-865b-7773644db080/image.png)
로그인 페이지에서는 구글/네이버/카카오톡 소셜 로그인을 활용해서 회원가입할 수 있게 하였고 비밀번호 찾기와 회원가입 버튼을 하단에 배치하였다.
![](https://velog.velcdn.com/images/woong2/post/b6cc5404-e7d4-4cd0-9644-f5610e1cef40/image.png)
카카오톡 소셜로그인 페이지

### 2-4. 비밀번호 찾기
![](https://velog.velcdn.com/images/woong2/post/27200dbe-d2a9-467c-a04e-c0b791c86758/image.png)
비밀번호 찾기 페이지 이동시 인증번호를 받아서 이메일로 비밀번호를 재설정할 수 있도록 구성하였습니다.
![](https://velog.velcdn.com/images/woong2/post/765d2569-160f-47a2-81fd-855b2d66d6cd/image.png)
비밀번호 재설정페이지에서 DB에 저장된 비밀번호를 업로드하도록 하였다.
### 2-5. 블로그 홈페이지
![](https://velog.velcdn.com/images/woong2/post/990d0d24-cddb-4cbb-94de-ee39f37d1536/image.png)
2번째로 블로그 페이지 이동시 제일 처음에 나오는 게시물은 조회수가 가장많은 게시물이 뜨도록 설정하였고 오른쪽의 검색버튼을 활용하여 원하는 검색어가 있는 게시물이 뜨게하도록 만들었다. 바로 밑에는 작성하기 버튼을 넣어 바로 게시물 작성하는 페이지로 이동할 수 있게하였다.
![](https://velog.velcdn.com/images/woong2/post/bd77a3b2-d6c7-4e43-9574-ffa7f8d9644a/image.png)

![](https://velog.velcdn.com/images/woong2/post/50867612-1944-4a47-ba96-e277792f1e41/image.png)
밑으로 스크롤시 작성한 게시물이 전부 보이도록 하였고 로그인 시 즐겨찾기를 할 수 있게 즐겨찾기 버튼을 만들었다. 별버튼 클릭시 나의 마이페이지에서 저장한 즐겨찾기 게시물들을 확인할 수 있게 만들었다.
### 2-6. 게시물 작성
![](https://velog.velcdn.com/images/woong2/post/ab9914d8-e383-4f70-8f83-abc1914876ba/image.png)

![](https://velog.velcdn.com/images/woong2/post/d7abc7be-c1a0-4922-8223-58cf95f7334e/image.png)![](https://velog.velcdn.com/images/woong2/post/6b31635e-e9de-4ba5-a8b8-a50d915ba940/image.png)
게시물 작성페이지에 들어서면 게시물을 대표하는 프로필이미지를 넣을 수 있고 글씨를 다양하게 쓸 수 있도록 에디터를 사용하여 다양한 글을 쓸수 있도록 구성하였다. 그 밑에는 지도 API를 활용하여 여행 다녀온 코스를 설정하여 마커로 지도위에 경로가 나타나도록 하였으며 블로그 게시물을 볼때에도 지도 코스가 마커와 같이 나타나도록하였음
### 2-7. 블로그 디테일
![](https://velog.velcdn.com/images/woong2/post/8f9e4539-7c3d-4317-8ed9-27a5156d2ae4/image.png)
블로그 게시물을 클릭시 상단에는 DB에 저장된 게시물 제목과 작성일/작성자 프로필/게시물의 좋아요/ 조회수 / 로그인한 유저가 게시물작성자와 동일시 수정/삭제가 가능하도록 만들었다.
![](https://velog.velcdn.com/images/woong2/post/08e73005-9633-42b5-835a-58b94568f309/image.png) 이 하단의 지도 부분에서 더 자세한 정보를 얻고 싶을때 "1번 여행지 : 대구역" 이 부분을 클릭시 밑의 사진처럼 모달창으로 로드뷰가 뜨도록 하였다.
![](https://velog.velcdn.com/images/woong2/post/e9e4bdfd-96ca-47a9-aecf-da790e138053/image.png)
게시물의 하단에는 댓글기능와 그 댓글에 대한 답글 기능을 추가하였고 댓글을 달 수 있게 하였다.![](https://velog.velcdn.com/images/woong2/post/c7dc719a-deb0-44e5-be14-96e41d6cdb31/image.png)
### 2-8. 좋아요 기능
![](https://velog.velcdn.com/images/woong2/post/c65389db-c5cb-4e43-a90d-f612811f999a/image.png)
사이드에 하트와 상단으로 이동할 수 있는 버튼을 만들었고 하트클릭시 게시글의 하트가 올라가도록하였으며 한 유저당 3개의 하트만 가능하도록 하였다.
![](https://velog.velcdn.com/images/woong2/post/5938776b-f859-4bed-a5c2-e996ea4edc59/image.png)
### 2-9. 마이페이지 / 즐겨찾기
![](https://velog.velcdn.com/images/woong2/post/45daa612-f7fb-47df-9490-3b87e236ae09/image.png)![](https://velog.velcdn.com/images/woong2/post/f1fdebb8-3db3-4620-9e6a-7c558285d0d0/image.png)

헤더의 오른쪽 끝에 있는 유저 프로필을 클릭시 마이페이지로 전환되는데 여기서 내가 쓴 게시물들을 볼 수 있도록 하였고 BLOG 페이지와 TOUR 페이지에서 즐겨찾기한 게시물과 관광지들을 즐겨찾기 페이지에 보이도록 하였다.
### 2-12. 채팅 기능
![](https://velog.velcdn.com/images/woong2/post/220286dd-194e-4a3d-82d3-c41cd0184d8d/image.png)![](https://velog.velcdn.com/images/woong2/post/4579b0a1-fd42-4c9c-860b-915bc901e298/image.png)
로그인시 오른쪽 하단에 있는 채팅을 클릭하면 채팅방을 생성하거나 기존에 있는 채팅방에 입장할 수 있다. 플래너를 작성하면서 같이 채팅을 활용하여 플래너 계획을 할 수 있도록 구성하였다.
위의 예시는 채팅기능을 활용하고 있는 조원들의 모습이다.
### 2-13. 플래너 기능
![](https://velog.velcdn.com/images/woong2/post/d5b9eb9c-243f-4244-8bc2-448e273deea4/image.png)![](https://velog.velcdn.com/images/woong2/post/652ac337-b033-427c-b5e7-c2e574533975/image.png)
플래너 기능을 여행가기전에 같이 플래너를 작성할 수 있도록 만들었고 + 버튼을 클릭하여 새로운 플래너를 작성할 수 있다. 작성자 추가에는 기존의 user DB에 저장된 num를 추가하여 같이 작성하고 싶은 유저들을 초대할 수 있게 하였고 초대된 유저들 끼리는 같이 플래너를 작성할 수 있도록 만들었다.![](https://velog.velcdn.com/images/woong2/post/29776272-baed-4785-98e4-5062f8085086/image.png) 작성중인 플래너에 입장하면 왼쪽에는 날짜별로 나눠서 하루마다 어떤 일정을 보낼지 작성할 수 있다. 
## 3. 역할분담

 이현성 : 공동 플래너 / 채팅 구현 / 배포
 
 박주용 : 게시판 CRUD / 카카오 API
 
 황재웅 : CSS / 메인페이지 구현
 
 김도훈 : 로그인 / 회원가입 / 소셜 로그인
 
 정상혁 : 댓글 / API 기능 활용
 
 정환용 : 즐겨찾기 / 관광 API 활용
 
## 4. 후기
