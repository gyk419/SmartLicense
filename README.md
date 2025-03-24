# SmartLicense

## 프로젝트 이름

**SmartLicense** - 자격증 기출문제 풀이 및 학습 관리 애플리케이션

## junji 팀 (Team Members)
- **권지용(팀장)**: UI/UX 디자인 & 프론트엔드 개발
- **김준식(팀원)**: 프론트엔드 개발 & 백엔드 개발

## 개발 기간 (Project Duration)
24.6.24 ~ 24.8.16

## 소개 (Overview)

SmartLicense는 자격증 기출문제를 풀어 실전 감각을 높이고, 체계적인 학습 관리를 통해 자격증 취득을 지원하는 모바일 학습 애플리케이션입니다. 사용자는 모바일 환경에서 언제 어디서나 자격증 문제를 연습하고, 시험 모드를 통해 실전 대비를 할 수 있습니다.

## 기능 (Features)

- **SNS 간편 로그인**: 소셜 네트워크 계정을 이용한 간편 로그인 지원
- **사용자 문제 선택**: 원하는 자격증 문제를 선택하여 학습 가능
- **모드 선택**: 연습 모드와 시험 모드 제공
- **합격 여부 표시**: 시험 모드에서 합격 여부를 표시하여 학습 성취도를 확인
- **정답 및 해설 제공**: 문제 풀이 후 문항별 정답 및 해설 제공
- **랭킹 시스템**: 사용자 간 점수 경쟁을 통해 학습 동기 부여

## 설치 방법 (Installation)

### 백엔드(Spring Boot)
```bash
# 프로젝트 클론
git clone https://github.com/gyk419/SmartLicense.git
git checkout back-end

# 필수 환경 변수 설정 (application.properties)
# spring.datasource.driver-class-name=org.mariadb.jdbc.Driver
# spring.datasource.url=jdbc:mariadb://localhost:[포트번호]/[데이터베이스명]
# spring.datasource.username=[아이디]
# spring.datasource.password=[비밀번호]

# Gradle 빌드 (또는 Maven 사용 가능)
./gradlew build

# 애플리케이션 실행
MeetpointApplication.java 실행
```

### 프론트엔드(Vue.js)
```bash
# 프로젝트 클론
git clone https://github.com/gyk419/SmartLicense.git
git checkout front-end

# 패키지 설치
npm install

# 개발 서버 실행
npm run serve
```

### 앱(Flutter WebView)
```bash
# 프로젝트 클론
git clone https://github.com/gyk419/SmartLicense.git
git checkout app

# 패키지 설치
flutter pub get

# 앱 실행
flutter run
```

## 사용 방법 (Usage)

1. 로그인 or 로그인 없이 사용 선택
2. 원하는 **자격증 문제 선택**
3. **연습 모드** 또는 **시험 모드**에서 학습 진행
4. 문제 풀이 후 **정답 및 해설 확인**
5. 학습 결과에 따라 **랭킹 시스템**을 통해 자신의 위치 확인

## 기술 스택 (Tech Stack)

### 프론트엔드
- Vue.js

### 백엔드
- Spring Boot
- Spring Security (인증 및 권한 관리)
- Mybatis (데이터베이스 연동)

### 데이터베이스
- MariaDB
- MySQL

### 모바일 앱
- Flutter WebView (Vue.js 기반 웹앱을 앱에서 실행)

## 폴더 구조 (Directory Structure) (선택 사항)

```bash
SmartLicense/ # Vue.js 프론트엔드
├── public/               
├── src/
│   ├── assets/         # 정적 파일 (이미지, 아이콘, SVG 파일)
│   │
│   ├── components/     # 재사용 가능한 Vue 컴포넌트
│   │
│   ├── ContentPage/    # 컨텐츠 관련 페이지
│   ├── css/            # 스타일 파일 (CSS, SCSS)
│   ├── routers/        # 라우터 설정
│   ├── SignInUp/       # 로그인 및 회원가입 관련 페이지
│   ├── SQL.sql         # 데이터베이스 초기화 SQL
```

```bash
SmartLicense/ # Spring Boot 백엔드
├── src/main/
│   ├── java/SmartLicense/smartlicense/   # Java 소스 코드
│   │                  ├── Components     # 공통 컴포넌트 관리
│   │                  ├── Config         # 프로젝트 전반의 설정 (SecurityConfig, WebConfig 등)
│   │                  │   ├── AuthenticationInterceptor # 인증 관련 인터셉터
│   │                  │   ├── SecurityConfig           # 보안 설정
│   │                  │   └── WebConfig               # 웹 설정
│   │                  ├── ContentPage    # 콘텐츠 페이지 관련 기능
│   │                  │   ├── Controller # HTTP 요청을 처리하는 컨트롤러 계층
│   │                  │   ├── Dao        # DB와의 연결을 담당하는 데이터 접근 계층
│   │                  │   └── Service    # 주요 비즈니스 로직을 처리하는 서비스 계층
│   │                  ├── IncorrectNote  # 오답 노트 기능 관련
│   │                  │   ├── Controller 
│   │                  │   ├── Dao        
│   │                  │   └── Service    
│   │                  ├── SignInUp       # 회원가입 및 로그인 관리
│   │                  │   ├── Controller 
│   │                  │   ├── Dao        
│   │                  │   ├── DTO        # 데이터 전송 객체 관리
│   │                  │   └── Service    
│   │                  ├── SolveProblem   # 문제 풀이 관련 기능
│   │                  │   ├── Controller 
│   │                  │   ├── Dao        
│   │                  │   ├── Domain     # 문제 관련 도메인 모델 관리
│   │                  │   └── Service    
│   │                  └── Util           # 유틸리티 클래스 관리
│   │                      └── KeyGeneratorUtils # 키 생성 유틸리티
│   │
│   ├── resources/                 # 설정 파일 및 정적 리소스
│   │   ├── application.properties # 애플리케이션 설정 파일
│   │   └── mybatis/mapper         # MyBatis 매퍼 XML 파일 저장
```

