<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 전역변수 [{},{},{},{}...]
// {} => 영화 한개에 대한 정보가 있다 => MovieVO => Ajax , axios 
const movie=[{"startYearDate":"2025.02.23",
	"endYearDate":"2025.02.23",
	"startDate":"2025년 02월 23일(일)",
	"endDate":"2025년 02월 23일(일)",
	"movieCd":"20242404",
	"showDt":"20250223",
	"thumbUrl":"/common/mast/movie/2025/02/thumb/thn_fcef6ef049824f90bfa9f6858a6544ae.jpg",
	"movieNm":"캡틴 아메리카: 브레이브 뉴 월드",
	"movieNmEn":"Captain America: Brave New World",
	"synop":"대통령이 된 새디우스 로스와 재회 후, 국제적인 사건의 중심에 서게 된 샘이 전 세계를 붉게 장악하려는 사악한 음모 뒤에 숨겨진 존재와 이유를 파헤쳐 나가는 액션 블록버스터","prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"118","showTs":"23","director":"줄리어스 오나","prNm":null,"dtNm":"월트디즈니컴퍼니코리아 유한책임회사","repNationCd":"미국","movieType":"장편","moviePrdtStat":"개봉","genre":"액션,어드벤처,SF","watchGradeNm":"12세이상관람가","openDt":"20250212","salesAmt":1157961840,"audiCnt":116012,
	"totalSalesAmt":13154995306,
	"totalAudiCnt":1312370,"scrCnt":1434,
	"showCnt":5900,"rank":1,
	"rankInten":0,
	"rankOldAndNew":"OLD",
	"rownum":1}
,{"startYearDate":"2025.02.23","endYearDate":"2025.02.23","startDate":"2025년 02월 23일(일)","endDate":"2025년 02월 23일(일)","movieCd":"20240614","showDt":"20250223","thumbUrl":"/common/mast/movie/2025/02/thumb/thn_f21eca74c13346309687ab9a4a4344a1.jpg","movieNm":"퇴마록","movieNmEn":"Exorcism Chronicles: The Beginning","synop":"\"삼백이 반으로 나뉘고, 다섯이 모자랄 때\r\n불씨가 하늘을 모두 태우리라\"\r\n\r\n수백 년간 은거하던 해동밀교의 145대 교주가\r\n생명을 제물로 바쳐 절대 악(惡)의 힘을 얻기 위한 의식을 시작한다.\r\n\r\n해동밀교의 다섯 호법들은 그를 막기 위해\r\n힘을 보태줄 새로운 인물을 찾아나서고,\r\n\r\n파문 당한 신부 박윤규, 무공을 위해 밀교를 찾은 현암,\r\n사건의 중심에 있는 예언의 아이 준후가 합세해\r\n거대한 악에 맞서는데...\r\n\r\n하늘이 불타던 날,\r\n새로운 전설이 시작된다!","prdtYear":"2024","indieYn":null,"artmovieYn":"Y","multmovieYn":null,"showTm":"85","showTs":"20","director":"김동철","prNm":"(주)로커스","dtNm":"(주)쇼박스","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉","genre":"애니메이션,액션,미스터리","watchGradeNm":"12세이상관람가","openDt":"20250221","salesAmt":375133380,"audiCnt":38520,"totalSalesAmt":1133704240,"totalAudiCnt":115471,"scrCnt":841,"showCnt":2650,"rank":2,"rankInten":0,"rankOldAndNew":"OLD","rownum":2},{"startYearDate":"2025.02.23","endYearDate":"2025.02.23","startDate":"2025년 02월 23일(일)","endDate":"2025년 02월 23일(일)","movieCd":"20241093","showDt":"20250223","thumbUrl":"/common/mast/movie/2025/02/thumb/thn_8ab0f38e1aa841b78bd14893c8bc7c2f.jpg","movieNm":"그 시절, 우리가 좋아했던 소녀","movieNmEn":"You Are the Apple of My Eye","synop":"'선아(다현)'에게 고백하기까지 수많은 날을 보낸 철없었던 진우의 열여덟 첫사랑 스토리","prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"101","showTs":"37","director":"조영명","prNm":"(주)영화사테이크,주식회사 자유로픽쳐스","dtNm":"(주)위지윅스튜디오,씨제이 씨지브이(CJ CGV)(주)","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉","genre":"멜로/로맨스","watchGradeNm":"12세이상관람가","openDt":"20250221","salesAmt":203872800,"audiCnt":21314,"totalSalesAmt":639459500,"totalAudiCnt":70993,"scrCnt":708,"showCnt":2165,"rank":3,"rankInten":0,"rankOldAndNew":"OLD","rownum":3},{"startYearDate":"2025.02.23","endYearDate":"2025.02.23","startDate":"2025년 02월 23일(일)","endDate":"2025년 02월 23일(일)","movieCd":"20252329","showDt":"20250223","thumbUrl":"/common/mast/movie/2025/02/thumb/thn_37c0727be1f94bf696d42331ad71862d.jpg","movieNm":"패딩턴: 페루에 가다!","movieNmEn":"Paddington in Peru","synop":"영국 국민으로 거듭난 ‘패딩턴’에게 어느 날 고향인 페루에서 날아온 의문의 편지 한 통.\r\n“루시 숙모님이 사라졌어요!”\r\n지도 한 장만 남긴 채 감쪽같이 사라져 버린 ‘루시’ 숙모를 찾아 떠난 ‘패딩턴’과 브라운 가족은\r\n페루의 정글을 둘러싼 비밀을 찾아 모험을 떠나게 되는데…\r\n \r\n모험천만 아마존 정글에 뛰어든 도시곰 ‘패딩턴’과 브라운 가족!\r\n올 겨울방학 반드시 가족도 찾고, 집으로 돌아가야만 하는 초대형 컴백곰 프로젝트가 시작된다!\r\n더 귀엽곰! 웃기곰! 재밌곰! 패딩턴 머스트 컴백곰!","prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"106","showTs":"15","director":null,"prNm":null,"dtNm":"소니픽쳐스엔터테인먼트코리아주식회사극장배급지점","repNationCd":"미국","movieType":"장편","moviePrdtStat":"개봉","genre":"코미디,드라마","watchGradeNm":"전체관람가","openDt":"20250219","salesAmt":125586900,"audiCnt":14014,"totalSalesAmt":421261300,"totalAudiCnt":49315,"scrCnt":227,"showCnt":712,"rank":4,"rankInten":0,"rankOldAndNew":"OLD","rownum":4},{"startYearDate":"2025.02.23","endYearDate":"2025.02.23","startDate":"2025년 02월 23일(일)","endDate":"2025년 02월 23일(일)","movieCd":"20223819","showDt":"20250223","thumbUrl":"/common/mast/movie/2025/01/thumb/thn_9a5dcfe7e35f4ce0a120e2bc310a36fd.jpg","movieNm":"말할 수 없는 비밀","movieNmEn":"Secret: Untold Melody","synop":"“연주할 때만 느껴지는 감정이 있거든. 그게 널 만나면 느껴져”\r\n\r\n유학 중이던 피아니스트 유준은 팔목 치료를 위해 한국에 교환 학생으로 오게 된다.\r\n학교에 처음 간 그날, 신비로운 피아노 선율에 이끌려 도착한 연습실에서\r\n유준은 정아와 마주치고, 운명처럼 끌린 두 사람은 시간을 보내며 가까워진다.\r\n\r\n하지만, 연락처조차 알려주지 않는 정아와의 만남은 계속 엇갈리고, \r\n유준의 시선이 늘 자신을 향해 있다고 생각한 \r\n인희의 갑작스러운 고백은 정아에게 큰 상처를 입힌다.\r\n\r\n그날 이후 사라진 정아의 행방을 찾던 유준은 정아의 비밀을 마주하게 되는데…\r\n\r\n“너와 나의 시간을 이어 준 연주곡 ‘시크릿’\r\n그렇게 마법 같은 사랑은 시작된 거야”","prdtYear":"2021","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"103","showTs":"6","director":"서유민","prNm":"(주)하이브미디어코프","dtNm":"플러스엠 엔터테인먼트","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉","genre":"판타지,멜로/로맨스","watchGradeNm":"전체관람가","openDt":"20250127","salesAmt":130349600,"audiCnt":13627,"totalSalesAmt":7543522180,"totalAudiCnt":789390,"scrCnt":570,"showCnt":1024,"rank":5,"rankInten":0,"rankOldAndNew":"OLD","rownum":5},{"startYearDate":"2025.02.23","endYearDate":"2025.02.23","startDate":"2025년 02월 23일(일)","endDate":"2025년 02월 23일(일)","movieCd":"20233006","showDt":"20250223","thumbUrl":"/common/mast/movie/2025/01/thumb/thn_fd944ac9b0894786a1740c2d14b2bfb9.jpg","movieNm":"히트맨2","movieNmEn":"HITMAN2","synop":"‘HITMAN IS BACK!’\r\n대한민국을 포복절도하게 만든 암살요원, 이번엔 ‘암살요인 준’으로 돌아왔다!\r\n\r\n욱해서 그린 웹툰 '암살요원 준'의 성공으로 잠깐 흥행 작가가 된 '준'은\r\n시즌2 연재 시작과 동시에 '뇌절작가'로 전락하고,\r\n망작이 된 시즌2는 되려 '준'을 노리는 글로벌한 악당들의 내한 열풍을 일으킨다.\r\n\r\n아무것도 모른 채, 다시 한번 대히트를 꿈꾸며 신작 웹툰 연재에 돌입한 '준'.\r\n그러나 그의 웹툰을 모방한 테러가 발생하고,\r\n국정원은 다름 아닌 '준'을 범인으로 지목하는데…\r\n\r\n과연 ‘준’은 예언자인가, 테러리스트인가.\r\n2025년 더욱 강렬해진 그의 대히트를 기대하라!\r\n","prdtYear":"2023","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"118","showTs":"10","director":"최원섭","prNm":"베리굿스튜디오(주),스튜디오타겟(주)","dtNm":"(주)바이포엠스튜디오","repNationCd":"한국","movieType":"장편","moviePrdtStat":"개봉","genre":"코미디,액션","watchGradeNm":"15세이상관람가","openDt":"20250122","salesAmt":108480120,"audiCnt":11242,"totalSalesAmt":23802656080,"totalAudiCnt":2527216,"scrCnt":530,"showCnt":858,"rank":6,"rankInten":0,"rankOldAndNew":"OLD","rownum":6},{"startYearDate":"2025.02.23","endYearDate":"2025.02.23","startDate":"2025년 02월 23일(일)","endDate":"2025년 02월 23일(일)","movieCd":"20252194","showDt":"20250223","thumbUrl":"/common/mast/movie/2025/01/thumb/thn_e13f274ffccb4cd69bb04cdf11473c37.jpg","movieNm":"영화 이상한 과자 가게 전천당","movieNmEn":"The Supernatural Sweet Shop The Movie","synop":"“소원을 이루어 주는 과자 가게, 전천당에 오신 걸 환영합니다” \r\n\r\n초등학교 신입 교사 ‘고타로’는 학생들로부터 수상한 과자 가게에 대한 소문을 듣게 된다.\r\n그 가게를 다녀온 이후로 시험 성적이 좋지 않던 학생은 100점을, 인기 없던 학생은 고백을, \r\n연예인이 꿈이던 학생은 성대모사 능력을 받게 된다.\r\n하지만 전천당에서 과자를 산 사람들은 조금씩 변해가는데…\r\n이상한 과자 가게 ‘전천당’ 그곳의 비밀은?\r\n","prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"103","showTs":"35","director":"나카타 히데오","prNm":null,"dtNm":"(주)넥스트엔터테인먼트월드(NEW)","repNationCd":"일본","movieType":"장편","moviePrdtStat":"개봉","genre":"판타지,미스터리,드라마","watchGradeNm":"전체관람가","openDt":"20250219","salesAmt":67715100,"audiCnt":7721,"totalSalesAmt":218177100,"totalAudiCnt":26189,"scrCnt":246,"showCnt":455,"rank":7,"rankInten":0,"rankOldAndNew":"OLD","rownum":7},{"startYearDate":"2025.02.23","endYearDate":"2025.02.23","startDate":"2025년 02월 23일(일)","endDate":"2025년 02월 23일(일)","movieCd":"20244762","showDt":"20250223","thumbUrl":"/common/mast/movie/2024/11/thumb/thn_23dfd0fd1c674386be08427d66e6e756.jpg","movieNm":"서브스턴스","movieNmEn":"THE SUBSTANCE","synop":"더 나은 버전의 당신을 꿈꿔본 적 있나요?\r\n당신의 인생을 바꿔줄 신제품 ‘서브스턴스’.\r\n‘서브스턴스’는 또 다른 당신을 만들어냅니다.\r\n새롭고, 젊고, 더 아름답고, 더 완벽한 당신을.\r\n단 한가지 규칙, 당신의 시간을 공유하면 됩니다.\r\n당신을 위한 일주일, 새로운 당신을 위한 일주일, 각각 7일간의 완벽한 밸런스.\r\n쉽죠? 균형을 존중한다면… 무엇이 잘못될 수 있을까요?","prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":"Y","showTm":"141","showTs":"25","director":"코랄리 파르쟈","prNm":null,"dtNm":"(주)넥스트엔터테인먼트월드(NEW)","repNationCd":"영국","movieType":"장편","moviePrdtStat":"개봉","genre":"스릴러","watchGradeNm":"청소년관람불가","openDt":"20241211","salesAmt":61578620,"audiCnt":6191,"totalSalesAmt":4950444520,"totalAudiCnt":507433,"scrCnt":258,"showCnt":332,"rank":8,"rankInten":0,"rankOldAndNew":"OLD","rownum":8},{"startYearDate":"2025.02.23","endYearDate":"2025.02.23","startDate":"2025년 02월 23일(일)","endDate":"2025년 02월 23일(일)","movieCd":"20251800","showDt":"20250223","thumbUrl":"/common/mast/movie/2025/02/thumb/thn_caac9aff1675428c91fef67fa153a4cf.jpg","movieNm":"브루탈리스트","movieNmEn":"The Brutalist","synop":"전쟁의 상흔을 뒤로하고 미국에 정착한 건축가 ‘라즐로 토스’(애드리언 브로디). 미국 이민자의 냉혹한 현실 속에 전쟁의 트라우마를 견뎌내던 어느 날. ‘라즐로’의 천재성을 알아본 부유한 사업가 ‘해리슨’(가이 피어스)이 기념비적인 건축물 설계를 제안한다. 하지만, 시대와 공간, 빛의 경계를 넘어 대담하고 혁신적인 그의 건축 설계는 사람들의 공감을 얻지 못하고 반대에 부딪히게 된다. 후원자 해리슨의 감시와 압박, 주변의 비난이 거세질수록 오히려 더 자신의 설계에 집착하던 ‘라즐로’. 혁신적인 브루탈리즘 건축에 자신을 투영하던 ‘라즐로’는 결국 공사가 중단될 위기에 처하는데... 발 디딜 곳 없는, 소속이 불분명한 삶의 연대기 트라우마가 예술로 승화된다!","prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"214","showTs":"51","director":"브래디 코베","prNm":null,"dtNm":"유니버설픽쳐스인터내셔널 코리아(유)","repNationCd":"미국","movieType":"장편","moviePrdtStat":"개봉","genre":"드라마","watchGradeNm":"청소년관람불가","openDt":"20250212","salesAmt":54701700,"audiCnt":5407,"totalSalesAmt":531029220,"totalAudiCnt":52350,"scrCnt":166,"showCnt":201,"rank":9,"rankInten":0,"rankOldAndNew":"OLD","rownum":9},{"startYearDate":"2025.02.23","endYearDate":"2025.02.23","startDate":"2025년 02월 23일(일)","endDate":"2025년 02월 23일(일)","movieCd":"20248710","showDt":"20250223","thumbUrl":"/common/mast/movie/2025/01/thumb/thn_f33363ae9f1c4bad8ab4c44d073ccd1d.jpg","movieNm":"엘리: 몬스터 패밀리","movieNmEn":"ELLI AND HER MONSTER TEAM","synop":"\"함께라면 불가능은 없어!\"\r\n\r\n외딴 저택에서 삼촌 '챔벌린'과 단둘이 살던 유령 소녀 '엘리'\r\n어느 날, 로봇 군단을 거느리는 '퀀트릭스'가\r\n몬스터들을 모두 잡아가기 시작했다는 소식을 들은 '챔벌린'은\r\n'엘리'를 안전한 곳으로 숨기고 본인은 납치되고 만다.\r\n\r\n이에 '엘리'는 삼촌을 구하기 위해 난생처음 바깥 세상으로 나서고\r\n도착한 대도시에서 슈퍼스타 털복숭이, 채식주의 드라큘라, 다정한 프랑켄슈타인까지\r\n몬스터 친구들을 만나 삼촌을 구하기 위한 여정을 함께하게 되는데...\r\n\r\n유령소녀 '엘리' & 반전매력 몬스터 친구들의\r\n스펙터클 시티 어드벤처가 시작된다!\r\n","prdtYear":"2024","indieYn":null,"artmovieYn":null,"multmovieYn":null,"showTm":"87","showTs":"54","director":"피엣 드 라이커,예스퍼 묄러","prNm":null,"dtNm":"(주)올스타엔터테인먼트,(주)플레이그램","repNationCd":"독일","movieType":"장편","moviePrdtStat":"개봉","genre":"애니메이션","watchGradeNm":"전체관람가","openDt":"20250214","salesAmt":34901000,"audiCnt":4052,"totalSalesAmt":283487700,"totalAudiCnt":34012,"scrCnt":226,"showCnt":256,"rank":10,"rankInten":2,"rankOldAndNew":"OLD","rownum":10}]
window.onload=function(){
	// {변수:값,변수:값...}
	let html=""
	movie.forEach(function(vo){
		html+='<tr>'
		     +'<td>'+vo.rank+'</td>'
		     +'<td><img src="https://www.kobis.or.kr'+vo.thumbUrl+'"  width=30 height=30></td>'
		     +'<td>'+vo.movieNm+'</td>'
		     +'<td>'+vo.director+'</td>'
		     +'<td>'+vo.genre+'</td>'
		     +'</tr>'
	})
	document.querySelector('tbody').innerHTML=html
}
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
 margin-top: 50px;
}
.row{
  margin: 0px auto;
  width: 900px;
}
</style>
</head>
<body>
  <div class="container">
    <h3 class="text-center">일일박스오피스</h3>
    <div class="row">
     <table class="table">
       <thead>
         <tr>
          <th>순위</th>
          <th></th>
          <th>영화명</th>
          <th>감독</th>
          <th>장르</th>
         </tr>
       </thead>
       <tbody>
         
       </tbody>
     </table>
    </div>
  </div>
</body>
</html>