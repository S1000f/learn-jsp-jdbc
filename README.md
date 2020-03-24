# learn-jsp-jdbc
학교수업- JSP, JDBC

## 다이렉티브(Directive)

- JSP가 실행될때 필요한 각종 설정 정보의 지정에 사용
- `page`, `include`, `taglib` 세 가지가 있음
-  `<%@ 디렉티브 속성="값" %>` 으로 사용 --> 예시 `<%@ page contentType="text/html"%>`
- 다이렉티브 `page` --> JSP페이지에 대한 정보 지정, 문서의 타입, 스크립팅 언어, 인코딩, 세션 등등
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