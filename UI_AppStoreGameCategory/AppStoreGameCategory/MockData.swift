//
//  MockData.swift
//  AppStoreGameCategory
//
//  Created by PKW on 2023/02/21.
//

import Foundation

enum StatusType: String {
    case joinNow = "지금 참여 가능"
    case timeLimit = "한정 기간"
    case recommend = "추천"
    case choice = "고르고 골랐어요"
    case experience = "지금 경험하세요"
    case start = "이 게임부터 시작하세요"
    case newSeason = "새 시즌에 뛰어드세요"
    case progress = "현재 진행중"
    case dailygame = "일상 속 게임"
    case together = "같이 즐겨요"
    case preorder = "사전 주문"
}

enum SubStatusType: String {
    case a = "특별 이벤트"
    case b = "라이브 이벤트"
    case c = "대규모 업데이트"
    case d = "최초 공개"
    case e = "새로운 시즌"
    case f = "챌린지"
    case g = "대회"
}

struct MockData {
    static let shared = MockData()
    
    private let recommends: ListSection = {
        .recommends([.init(status: .joinNow, title: "쿠키런:킹덤", subTitle: "블루파이맛 쿠키를 맞이하세요", description: "처음 '맛'나는 소셜 RPG [쿠키런:킹덤]!"),
                     .init(status: .timeLimit, title: "디아블로 이모탈", subTitle: "화려한 연금술의 배틀 패스", description: "전리품, 커스터마이징과 탐험"),
                     .init(status: .recommend, title: "메이플스토리M", subTitle: "신규 지역, 아르카나를 탐험하세요", description: "모바일로 만나는 진짜 MMORPG"),
                     .init(status: .choice, title: "최고의 전략 게임 10선", subTitle: "건설하고 싸우고 정복하세요!"),
                     .init(status: .experience, title: "Rummikub", subTitle: "인기 보드 게임에서 승리하세요", description: "사람들을한데 모으기"),
                     .init(status: .joinNow, title: "쿠키런:오븐브레이크", subTitle: "매콤한 하바네로맛 쿠키와 질주하세요", description: "귀여운 러닝 어드벤처 게임"),
                     .init(status: .start, title: "모두의마블", subTitle: "왁자지껄 유쾌한 보드 게임 한 판", description: "설맞이 진수성찬 '모마X요기요' 콜라보!"),
                     .init(status: .recommend, title: "에버소울", subTitle: "강력한 정령, 홍란 등장!", description: "AWAKE YOUR SOUL"),
                     .init(status: .recommend, title: "MARVEL 퓨쳐파이트", subTitle: "엔트맨과 와스프와 모험을 시작하세요", description: "영웅들과 함께 최고의 팀을 만드세요"),
                     .init(status: .newSeason, title: "클래시 로얄", subTitle: "새로운 보상을 받으세요", description: "실시간 PvP 전투")])
    }()
                     
    private let columsGame1: ListSection = {
        .colums([.init(title: "전략적 팀 전투: 리그 오브 레전드 전략 게임", description: "환상적인 오토 배틀러"),
                  .init(title: "쿠키런:킹덤", description: "처음 '맛'나는 소셜 RPG[쿠키런:킹덤]!"),
                  .init(title: "리그 오브 레전드: 와일드 리프트", description: "실시간 5v5 MOBA 액션"),
                  .init(title: "FIFA ONLINE 4 M by EA SPORTS", description: "모바일에서 즐기는 세계 최고의 축구 게임"),
                 .init(title: "카트라이더 러쉬플러스", description: "모바일에서도 카트답게!\n카트라이더 러쉬플러스"),
                 .init(title: "Rummikub", description: "사람들을한데모으기"),
                 .init(title: "랜덤 다이스:디펜스\n(Random Dice)", description: "PVP Random Defense"),
                 .init(title: "Pokemon GO", description: "전 세계에서 포켓몬을 발견하자")])
    }()
//
//    private let columsGame2: ListSection = {
//        .colums([.init(title: "히트2", description: "HIT THE WORLD"),
//                  .init(title: "대항해시대 Origin", description: "항해 게임의 명작을 계승한다!"),
//                  .init(title: "바람의나라: 연", description: "바람의나라: 연 지금 모바일로 즐기기바람!"),
//                  .init(title: "라이즈 오브 킹덤즈", description: "라이즈 오브 킹덤즈 진형 시스템 업데이트!"),
//                 .init(title: "가디언 테일즈", description: "세상 모든 재미를 다 담았다!"),
//                 .init(title: "세븐나이츠 레볼루션", description: "무한 영웅 변신 RPG"),
//                 .init(title: "서머너즈 워: 크로니클", description: "소환형 RPG 시작!"),
//                 .init(title: "컴투스프로야구V23", description: "컴프야 최신작! KBO공식 야구 게임")])
//    }()
//
//    private let columsGame3: ListSection = {
//        .colums([.init(title: "탕탕특공대", description: "탕탕특공대 탕!탕!탕!"),
//                 .init(title: "Valor Legends: 이터널 서머너", description: "가장 릴렉스한 방치형 RPG"),
//                 .init(title: "카트라이더: 드리프트", description: "멀티플레이 레이싱 게임 카트라이더 시리즈의 최신작"),
//                 .init(title: "레전드 오브 슬라임: 방치형 RPG", description: "슬라임을 키워서 인간을 박살내자"),
//                 .init(title: "프리스톤테일M", description: "태초의 세계, 끝없는 모험"),
//                 .init(title: "불가사의 던전: 생존자", description: "액션"),
//                 .init(title: "원펀맨: 영웅의 길", description: "롤플레잉")])
//    }()
                     
    
    var pageData: [ListSection] {
//        [recommends, columsGame1, columsGame2, columsGame3]
        [recommends, columsGame1]
    }
}

struct TitleMockData {
    static let shared = TitleMockData()
    
    let title: [TitleItem] = {[
        .init(title: ""),
        .init(title: "iPhone 필수 게임", subTitle: "에디터가 손수 골랐습니다."),
        .init(title: "꼭 해봐야 할 게임"),
        .init(title: "맞춤형 게임 추천 더 보기"),
        .init(title: "내게 꼭 맞는 Apple Arcade 게임")
    ]}()
    
}
