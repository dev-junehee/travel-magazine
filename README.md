#  여행을 떠나요🏝️
### Travel Magazine App

## Study for
- AutoLayout
- TableViewController, Custom TableView 활용
- UIVIewController + TableView + Custom Cell
- Struct 구조체 활용
    - 저장 프로퍼티, 연산 프로퍼티
    - 인스턴스 프로퍼티, 타입 프로퍼티
    - 지연 저장 프로퍼티
- Kingfisher 라이브러리 활용
- DateFormetter 활용 (iOS 15이상)
- Extension
- Viewcontroller Transition
    - Present - Dismiss
    - Push - Pop
- Protocol
- MapKit
- Enum

<br />

## Refactor 🏭
#### 2024-05-28 (Tue)
- TravelTableViewCell UI/Data configure 함수 분리
- TravelTableViewCell identifier 타입 프로퍼티로 분리
- RestaurantTableViewCell identifier 타입 프로퍼티로 분리
- 맛집/도시 탭 즐겨찾기 버튼 클릭 핸들러 추가
    - 맛집: 새로고침 시 즐겨찾기 데이터 반영 안 되는 오류 발생
    - 도시: 즐겨찾기 클릭 시 광고 셀 크기 변경되는 오류 발생

#### 2024-05-29 (Wed)
- CityInfoTableView에서 셀 타입에 따른 다른 화면 전환 추가
    - 도시 정보 셀 클릭 시: Push
    - 광고 셀: Present (fullScreen)
- 인기 도시 탭 구현 (1차)
    - 커스텀 셀 각 모서리마다 다른 cornerRadius 적용 (clipsToBounds, maskedCorners)
    - 커스텀 셀 간격 조정, 그림자 효과 적용

#### 2024-05-30 (Thu)
- 인기 도시 탭
    - 상단 SearchBar 추가
    - 인기 도시 검색 기능 추가
    - Semented Control 선택값에 따라 전체/국내/해외 필터 검색 가능
    - 검색어 및 검색 결과에 따른 예외 처리 (Alert)
        - 검색어 미입력 시
        - 공백 검색 시
        - 검색 결과 없을 시
    - 스크롤 시 keyboardDismiss 처리
- 도시 상세 탭
    - 화면 전환 시 데이터 전달 처리
- 맛집 탭
    - 셀 클릭 시 식당 세부 정보 및 지도 위치 제공 기능 추가
    
#### 2024-05-31 (Fri)
- 공통
    - ReuseIdentifierProtocol 추가
- 맛집 탭
    - RestaurantVC + Extension 분리 (SearchBar, TableView)
    - SearchBar, TableView configure 함수 분리
    - Property Observer 추가
    - BarButton 생성 함수 분리
    - 즐겨찾기 필터링 로직 수정 (filtered → original)
    - 즐겨찾기 버튼 클릭 시 Alert 추가
- 도시 상세 탭
    - BarButton 생성 함수 수정 (분리했던 Extension 사용)
- 인기 도시 탭
    - PopularCityVC + Extension 분리 (SearchBar, TableView, Segmented Control)
    - SearchBar, TableView, Segmented Control configure 함수 분리
    - Property Observer 추가

#### 2024-06-01 (Sat)
- 문자열 텍스트 상수화
- 맛집 탭 - 맛집 이미지 cornerRadius 적용

#### 2024-06-03 (Mon)
- 바 버튼 생성 함수 Enum 적용

<br />

## 화면 구성 (추가 예정)


<br />

## Questions 🧐
<details>
<summary><b>인기 도시 탭 - clipsToBounds를 ImageView와 ExplainLabel 두 곳에 설정해야 하는 이유</b></summary>
<div markdown="1">
<b>문제 상황</b>
<br />
cornerRadius를 적용하고 싶은 요소들 중 최상위 요소인 ImageView에 clipsToBounds를 true로 설정했지만 ExplainLabel에는 cornerRadius가 적용되지 않는 문제 발생!
<br />
<b>해결 방법</b>
<br />
UIImageView는 clipsToBounds의 기본값이 true이고, UILabel은 false이기 때문에 UIImageView에 clipsToBounds를 true로 설정하면 텍스트 레이블에는 적용되지 않는다. 따라서 clipsToBounds의 기본값이 true인 ImageView에는 cornerRadius를 바로 적용하고, ExplainLabel에는 clipsToBounds와 cornerRadius를 함께 적용하여 해결!
<br />
<b>관련 블로그 포스팅</b>
<br />
https://velog.io/@devjunehee/UILabel%EC%97%90-CornerRadius%EA%B0%80-%EC%A0%81%EC%9A%A9%EC%9D%B4-%EC%95%88-%EB%8F%BC%EC%9A%94
</div>
</details>

<br />

## Trouble Shooting 🐦‍🔥
<details>
<summary><b>UILabel에서 cornerRadius 적용 안 되는 이슈</b></summary>
<div markdown="1">
<b>문제 상황</b>
<br />
광고 커스텀 셀에서 background와 오른쪽 상단 광고 표시 뱃지(adBadge)에 UILable.layer.cornerRadius를 적용했는데 컴파일 과정에서 오류는 없었지만 빌드 후 화면에서는 적용이 안 되는 문제점 발생!
<br />
<b>해결 방법</b>
<br />
UILable.layer.cornerRadius를 적용하기 전 UILable.clipsToBounds 속성을 true로 변경해주어 해결
<br />
clipsToBounds는 UIView에 속해있는 인스턴스 프로퍼티로 하위 View가 나의 View를 넘어선 경우, 나의 View를 넘어서 그릴 것인지를 설정하는 Bool 인스턴스. 기본값은 false. clipsToBounds를 true로 설정하면 하위 View가 View 경계에 맞게 잘려진다.
</div>
</details>

<details>
<summary><b>즐겨찾기 버튼 클릭 후 식당 전체보기/즐겨찾기 보기 클릭하면 변경된 데이터가 반영 안 되는 이슈</b></summary>
<div markdown="1">
<b>문제 상황</b>
<br />

<b>해결 방법</b>
<br />
</div>
</details>

