//
//  Common.swift
//  travel-magazine
//
//  Created by junehee on 6/1/24.
//


struct Common {
    struct Title {
        static let travel = "여행을 떠나요🏝️"
        static let restaurant = "맛집을 찾아요🍕"
        static let city = "도시 상세 정보📍"
        static let popularCity = "인기있는 도시✨"
        static let ad = "광고"
        static let talk = "TRAVEL TALK"
    }
    
    struct Button {
        static let all = "전체"
        static let like = "즐겨찾기"
        static let domestic = "국내"
        static let abroad = "해외"
        static let confirm = "확인"
        static let cancel = "취소"
    }
    
    struct Placeholder {
        static let searchRestaurant = "맛집 이름이나 카테고리를 검색해 보세요!"
        static let searchCity = "도시명을 검색해 보세요!"
    }
    
    struct Alert {
        static let invalidCategory = "올바른 카테고리 선택이 아닙니다."
        static let invalidSearchText = "올바른 검색어를 입력해 주세요!"
        static let invalidData = "데이터가 올바르지 않아요!"
        static let noSearchText = "검색어를 입력해 주세요!"
        static let like = "즐겨찾기를 등록하시겠습니까?"
        static let unLike = "즐겨찾기를 해제하시겠습니까?"
        static let noResult = "검색 결과가 존재하지 않아요😿"
        static let noRestaurant = "찾고있는 맛집이 없어요😰"
    }
}
