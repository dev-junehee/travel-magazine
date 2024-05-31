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
    - BarButton 생성 함수 분리
    - 즐겨찾기 버튼 클릭 시 Alert 추가


<br />

## 화면 구성
| **여행 정보** | **맛집 정보** | **도시 상세** |
|:----:|:----:|:-----:|
| <img width="300" src="https://github.com/dev-junehee/travel-magazine/assets/116873887/9d9e66b8-a04e-4879-a853-5cdd8e13dd26" /> | <img width="300" src="https://github.com/dev-junehee/travel-magazine/assets/116873887/4607cb24-e85f-4c7d-b417-d43be129759f" /> | |


<br />

## Questions 🧐
<details>
<summary><b>인기 도시 탭 - clipsToBounds를 ImageView와 ExplainLabel 두 곳에 설정해야 하는 이유</b></summary>
<div markdown="1">
<b>문제 상황</b>
<br />

<b>해결 방법</b>
<br />
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
[clipsToBounds](https://developer.apple.com/documentation/uikit/uiview/1622415-clipstobounds)
UIView에 속해있는 인스턴스 프로퍼티로 하위 View가 나의 View를 넘어선 경우, 나의 View를 넘어서 그릴 것인지를 설정하는 Bool 인스턴스. 기본값은 false. clipsToBounds를 true로 설정하면 하위 View가 View 경계에 맞게 잘려진다.
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

