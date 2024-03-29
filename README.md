## 📑 프로젝트 개요
<p align="center">
<img src="https://github.com/huiju0502/semi-project/assets/133737044/d5bda8b8-0a2d-419c-afe9-2ee11979744d)" >
</p>

- 밀키트 쇼핑몰
- 5월30일 - 6월23일
- 개발인원 4명  
  
## 💻 개발내용  
- 모델1 방식을 사용하여 쇼핑몰 구현  
- 쇼핑몰 내에서 관리자, 회원, 비회원의 기능별 차등 부여  
- 관리자는 2개 등급으로 나누어 등급별 관리 권한 분리  
- 관리자는 상품, 주문상태, 문의, 리뷰관리, 고객리스트조회, 직원관리 가능  
-  상품구매, 리뷰작성, 장바구니 기능, 공지 조회, 정보조회 및 변경 가능  
- 비회원은 상품조회, 리뷰조회, 장바구니, 회원가입만 가능

## 👩🏻‍💻 담당기능  
### 팀장 양희주
- **팀 리더로 일정 조율 및 프로젝트 전반적인 관리**
- **로그인/로그아웃, 고객 회원가입 및 마이페이지, 관리자의 회원관리와 직원관리 파트**
- 로그인시 크게 **직원**과 **고객**으로 구분 
  - **직원**은 권한을 **관리자**와 **일반사원** 두개로 나누어 기능별 차등 부여
  - **고객**은 **정상계정**, **휴면계정**, **탈퇴계정**으로 분기하여 그에 따라 각각 다른 기능 구현
- 고객이 로그인하면 **마지막 접속일을 조회**해서 6개월 지나면 **휴면계정** 처리하고 `JavaScript`를 이용해 **휴면 해제**
- 회원가입, 수정 등 입력폼에 `jQuery`를 적용해 **유효성 검사 실시**
- 아이디 중복 검사시 `AJAX`를 이용해 **비동기 처리**
- 비밀번호 변경시 **비밀번호 이력테이블에 저장**하여 보관
### 팀원 김예은
- **메인메뉴, 장바구니 및 주문, 주문리스트, 배송지 관리 파트**
- ArrayList과 for-each 루프를 활용하여 권한에 따른 메인메뉴 분기
- HashMap<Integer, Cart>타입의 `session`과 ArrayList를 활용한 장바구니 구현, 상품 중복 여부를 확인
- **join**을 사용해 주문상품을 조회하고 주문 수량에 따른 총 가격을 계산하여 출력
- 주문완료시 포인트를 부여하며 `JQuery`를 적용하여 폼 제출 처리
- 주문리스트에서 **주문상태 변경** 및 **구매확정** 하여 완료된 주문 건을 관리
- 고객은 **기본배송지**와 일반배송지를 구분하여 관리
### 팀원 송현정
- **HOME화면, 상품, 카테고리 관리 파트**
- 홈 화면 및 상품 목록
  - `for each`문과 `HashMap` 기능을 이용하여 DB에 등록된 상품의 이미지, 상품명, 가격, 판매상태 등이 최신등록순으로 12개씩 노출되도록 구현
  - 조건문을 활용하여 할인이 적용 중인 상품인 경우 **할인된 가격**이 노출되도록 구현
  - 상품이미지를 **multipart**형식의 form으로 File타입의 객체를 받아와서 DB와 로컬폴더에 **파일이 저장**되도록 구현
- 상품 주문 완료 시 **상품재고량** 및 **판매상태** 변경
- 상품 및 카테고리 추가/수정 입력폼에 `jQuery`를 적용하여 **유효성 검사 실시**
- 상품 및 카테고리 삭제 시 `AJAX`를 적용하여 **비동기 처리**
- 상품 이름 **검색기능** 및 **검색결과 개수** 표시 기능 구현
- **카테고리별 상품** 조회 기능 및 **조회결과 개수** 표시 기능 구현
### 팀원 임지예
- **문의, 답변, 리뷰, 포인트, 할인관리 파트**
- 관리자만 답변 추가,수정,삭제 버튼이 보이며 `AJAX` 활용한 삭제기능 구현
- 리뷰 작성시 이미지 추가를 구현하여 **multipart**형식의 form으로 File타입의 객체를 받아와서 DB와 로컬폴더에 **파일이 저장**되도록 구현
- 답변,리뷰,문의,할인관리 입력 및 수정 폼에 `jQuery`를 적용해 **유효성 검사 실시**
- 주문확정을 눌러 추가 된 포인트를 양수(+), 음수(-)을 통해 총점수를 계산하고 출력
- **join**과 **case**문을 사용하여 할인이 적용된 상품 리스트를 조회하고 할인이 적용됐을 시에만 할인가격과 할인율을 반환하도록 구현 

## 🛠 개발환경  
Language

![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)


Library


![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white)


Database


![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white)


WAS


![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black)


OS


![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)


TOOL


![Eclipse](https://img.shields.io/badge/Eclipse-FE7A16.svg?style=for-the-badge&logo=Eclipse&logoColor=white)


SQL, JavaScript  
Library JQuery, BootStrap4  
Database MariaDB  
WAS Apache Tomcat9  
OS window, MAC  
TOOL Eclipse, HeidiSQL, sequel Ace  

# 메인화면
![image](https://github.com/huiju0502/semi-project/assets/133733210/f3e6fcf8-2cab-4bfc-9bb3-6a8541a75840)


