# learn-jsp-jdbc
학교수업- JSP, JDBC

## 다이렉티브(Directive)

- JSP가 실행될때 필요한 각종 설정 정보의 지정에 사용
- `page`, `include`, `taglib` 세 가지가 있음
-  `<%@ 디렉티브 속성="값" %>` 으로 사용 --> 예시 `<%@ page contentType="text/html"%>`
### `page` --> JSP페이지에 대한 정보 지정, 문서의 타입, 스크립팅 언어, 인코딩, 세션 등등
  + 주요속성
  + `info` --> 페이지를 설명해주는 문자열 지정
  + `language` --> 사용할 스크립트 언어 지정. 기본값 java 현재 자바 말고 다른건 없음
  + `contentType` --> 어떠한 타입의 문서인지 지정. 기본값 text/html .그리고 인코딩 설정 같이 지정가능 (예시 `"text/html;charset=utf-8"`)
  + `extends` 자바의 그것과 동일. JSP는 컨테이너가 알아서 적절한 클래스들을 상속시키기 때문에 거의 사용 안함
  + `import` 자바의 그것과 동일. `page` 다이렉티브 중에 유일하게 여러번 사용가능한 속성
  + `session` 해당 JSP페이지가 HttpSession을 사용할지 여부를 결정. true, false 값 가짐.
  + `buffer` 출력버퍼의 크기 지정. 기본값 8KB
  + `autoFlush` 해당 JSP의 내용들이 웹브라우저로 출력되기 전에 버퍼가 가득 찬다면 어떻게 처리할 것인지 여부. 기본값 true. true일 경우 자동적으로 출력됨.
  
- 다이렉티브 `include` --> 여러 JSP페이지에서 공통적으로 사용되는 내용이 있을 때, 이를 별도의 파일에 저장하고 그 파일을 include로 삽입할 수 있다.
- `<%@ include file="포함시킬 파일의 유알엘(url)"%>` 으로 사용 --> 먼저 include가 끝나고 하나의 서블릿 파일로 변환된다.

## 스크립트 요소

- `Declaration`, `Scriptlet`, `Expression` 세 가지 스크립트 요소가 존재한다
### 선언문(Declaration)
- JSP페이지 내에서 필요한 멤버 변수나 메소드를 선언하기 위해 사용한다
  + `<%! 선언내용 %>`
  + 선언문에서 선언된 변수는 자바의 전역변수 처럼 사용된다. 따라서 페이지가 서블릿으로 변환시 해당 변수는 서블릿의 멤버 변수가 된다.
### 스크립트릿(Scriptlet)
- 페이지에서 가장 일반적으로 쓰이는 스크립트 요소로, 프로그래밍 로직 코드를 기술할 때 사용한다.
  + `<% 로직내용 %>`
  + 제어문, 반복문 같은 기본적인 로직을 위한 코드를 기술하는 곳
  + 여기에 선언된 변수는 로컬변수로 변환된다.
### 표현문(Expression)
- 클라이언트 화면에(웹 브라우저) 출력할 부분을 기술하는 곳
  + `<%=출력할것 %>`
  + 스크립트릿`<% %>` 안에서는 표현문을 사용할 수 없다.
  + 표현문 안에서는 세미콜론; 을 사용하면 안된다 --> 서블릿으로 변환될때 표현식 부분은 `out.print();` 메소드로 변환되므로
  + 모든 표현문 안의 내용들은 문자열로 변환된다. 그리고 출력은 toString() 메소드를 사용한다. 따라서 자바와 마찬가지로 필요에 따라 적절히 toSting() 을 오버라이딩 하여 사용한다.
  
## 내장객체 (implicit Object)

- JSP 내에서 제공하는 특수한 레퍼런스 타입의 변수로써, 선언과 객체(인스턴스)생성 없이 사용할 수 있다
- 주요내장 객체 --> `request`, `response`, `out`, `session`, `application`, `pageContext`, `page`, `exception` 등등
- `request`, `session`, `application`, `pageContext` 는 속성을 저장하고 읽을 수 있는 `setAttribute()`, `getAttribute` 를 제공한다
### `request`
- 웹 브라우저에서 JSP로 전달되는 정보의 모임으로, Http 헤더와 바디로 구성되어있다. 이 객체로 사용자의 요구사항을 얻어낸다
  + `getParameter(String name) : String` 파라미터 변수 name에 저장된 값을 얻는 메소드. 변수명 없을 시 null 반환
  + `getParameterValues(String name) : String[]` --> 변수에 저장된 모든 값을 String배열로 반환. checkbox에서 주로 사용
  
### `response`
- 웹 브라우저에 보내는 응답정보를 가지고 있다
  + `void sendRedirect(url)` --> 주어진 url로 페이지 제어가 이동한다
  
### `out`
- JSP 페이지가 생성한 결과를 웹 브라우저로 전송해 주는 출력 스트림이다. 스크립트 요소 뿐만 아니라 HTML, plain text도 모두 포함한다
  + `String println(...)` --> 주어진 내용을 웹 브라우저에 출력한다. 줄 바꿈은 적용되진 않음
  + `void clearBuffer()` --> 현재 출력버퍼에 있는 내용을 전송하지 않고 비운다
  + `void flush()` --> 현재 출력버퍼에 있는 내용을 전송하고 비운다
  
### `session`
- 웹 브라우저의 요청시, 웹 브라우저에 관한 정보를 저장하고 유지하는 객체. 웹 브라우저 당 1개가 할당된다. 주로 회원관리 및 사용자 인증과 관련된 서비스에서 사용되며, 종종 웹 사이트에서 보게되는 "세션이 만료되었습니다. 다시 로그인 해주세요" 의 그 세션이다

### `application`
- 웹 애플리케이션의 설정 정보를 갖는 객체로, 웹 애플리케이션당 1개의 객체가 생성되며, 해당 애플리케이션에서 공유하는 변수로 사용된다. 웹 페이지의 방문자 기록을 카운트 할때 사용한다

## 액션태그

### `<jsp:include>`
- include 디렉티브 처럼 다른 페이지를 현재 페이제 포함시킬 수 있는 기능이다
- include 디렉티브는 단순히 소스를 텍스트로 포함시키는 것과 다르게, 액션태그는 인클루드할 페이지의 처리결과도 포함시키는 것이 다르다
- 사용법 `<jsp:include page="포함시킬페이지" flush="false" />`
- 또한 액션태그 안에서는 표현식을 사용할 수 있다 (예시 `<jsp:include page="<%=pageName %> flush="true" />`)

### `<jsp:forward>`
- 다른 페이지로 프로그램의 제어를 이동할떄 사용되는 액션태그이다
- JSP페이지 내에서 forward액션태그를 만나게 되면, 그 전까지 출력버퍼에 저장되어 있던 내용을 제거하고 지정된 페이지로 제어권이 넘어간다
- 사용법 `<jsp:forward page="포워드할 페이지" />`

### 값을 전달하며 include와 forward 사용하기
- include 혹은 forward 액션태그를 열고, 그 안에 `<jsp:param name="파라미터이름" value="변수이름 혹은 표현식" />` 액션태그를 사용하고 닫는다

## 에러 처리
- 404 not found 같은 http에러코드를 처리하는 방법이다
- `web.xml` 내에 에러처리할 http코드와 파일의 위치를 입력한다

  ```java
  <error-page>
    <error-code>404</error-code>
    <location>/error/404error.jsp</location>
  </error-page>
  ```
- 에러처리를 위한 페이지 안에 다음의 내장객체를 사용한다 --> `<% response.setStatus(HttpServletResponse.SC_OK); %>`

## 자바빈(JavaBeans)

### 자바빈의 개요
- 화면에 표시되는 부분을 담당하는 view 부분과, 비지니스 로직을 담당하는 model 부분을 분리시켜 별도의 자바파일로 만드는 것
- 로직 부분을 따로 분리하여 모듈화 시킴으로써, 재사용을 가능케하고 코드의 가독성 및 효율을 올릴 수 있다
- 자바빈은 자바의 클래스이므로, 자바 문법 그대로 작성한다. 소스의 위치는 main/src/ 아래에 위치시키도록 한다

### 자바빈의 사용 1. 액션태그`<jsp:useBean>`

- `<jsp:useBean id="..." class="..." scope="..." />`
  + 새로운 자바빈 인스턴스를 생성한다. (자바의 new 키워드로 객체를 생성하는 것과 대응된다)
  + id 속성: 새롭게 만들어지는 자바빈 인스턴스의 이름 (자바의 참조변수 선언 및 참조값 대입과 대응된다)
  + class 속성: 패키지경로를 포함한 자바빈 클래스의 이름을 명시한다
  + scope 속성: 해당 자바빈 인스턴스가 공유되는 범위를 지정한다 --> `page`, `request`, `session`, `application` 이 있다
  + 새로운 useBean 액션태그의 id, class, scope 속성값이 기존 액션태그와 모두 같을경우, 새로운 인스턴스를 생성하는게 아니라 해당 인스턴스를 참조하게 된다
  
- `<jsp:setProperty name="빈 이름" property="프로퍼티 이름" value="저장할 값" />`
  + 자바빈 클래스에 값을 저장하기 위해 사용되는 액션태그
  + 자바빈의 setter 메소드와 자동 연동되어 값을 할당한다
  + `<jsp:setProperty name="Bean" property="name" />` --> `void Bean.setName(String name) {this.name = name;}`
  + `property="*"` --> 요청에서 넘어오는 파라미터의 이름과 개수와 자바빈 프로퍼티의 이름과 개수가 일치할 때, 일괄적으로 값을 저장할 수 있다
  + 페이지로부터 요청된 파라미터의 이름과 자바빈의 프로퍼티 이름이 다를 경우 `param="요청 파라미터 이름"` 속성을 추가해야 한다
  
- `<jsp:getProperty name="빈이름" property="프로퍼티 이름" />`
  + 자바빈으로 부터 값을 얻어온다
  + setter와 마찬가지로 getter 의 변수명과 프로퍼티명이 일치해야 한다
  
### 자바빈의 사용 2. 디렉티브 page import

- 페이지 디렉티브의 import 속성으로 자바빈 클래스를 사용할 수 있다
- `<%@ page import="패키지경로 포함 클래스명" %>`
- 임포트 후에 `<% %>`스크립트립 내부에서 자바빈 클래스를 사용할 수 있다
- 액션태그로 생성된 자바빈 인스턴스와 스크립트 안에서 생성한 인스턴스는 별개의 인스턴스이다
