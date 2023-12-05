import 'package:capstone/nature/donationWidget.dart';
import 'package:flutter/material.dart';

import 'package:capstone/style.dart';

class DonationList extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _DonationList();
  }
}

class _DonationList extends State<DonationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              buildDonationContainer(
                context,
                'https://i.ibb.co/8b2pbSk/wwf.jpg',
                'WWF(세계자연기금)',
                '세계 최대 비영리 자연보전기관 WWF(세계자연기금, WORLD WIDE FUND FOR NATURE)는 1961년에 설립되었으며, 국제본부는 스위스 글랑에 위치해 있습니다.\n 전  세계 100여 개 국가에서 600만 명 이상의 후원자들과 함께 활발히 활동하고 있는 WWF의 초창기 명칭은 “세계 야생동물 기금(WORLD WILDLIFE FUND)”이었으나, 해당 명칭이 기관의 활동 범위를 모두 반영하지 못한다는 판단하에 미국과 캐나다를 제외한 국가에서는 1986년 “세계자연기금(WORLD WIDE FUND FOR NATURE)”으로 공식 명칭을 변경하였습니다. 그러나 명칭 변경 후 15개 이상의 언어로 번역이 이루어지며 혼란이 생기자, 꾸준히 사용되어온 약자 WWF로 국제 명칭을 통일하기로 2001년 결정했습니다.\n WWF는 다양한 이해관계자들의 기여와 협력의 힘을 매우 중요하게 생각합니다. 오늘날 세계가 직면하고 있는 복잡한 환경 문제는 우리 모두의 적극적인 동참이 필요하기 때문입니다. 해양과 기후·에너지, 산림, 담수, 야생동물, 식량 등 자연보전 전 영역에 걸쳐 활동하고 있는 WWF는 이에 대한 효과를 더욱 높이고 지속가능한 발전을 이루기 위해 각 분야의 전문가들을 비롯해 국제기구와 지역사회, 기업, 정부 및 시민단체와 파트너십을 형성하여 일하고 있습니다. 또한 WWF는 자연 서식지의 보전, 생물종 멸종 방지, 생산과 소비의 생태발자국 감소를 세부 목표로 두고 2030년까지 자연을 보전 및 회복시키고, 2050년까지 지속가능하고 건강한 지구에서 사람과 자연이 조화롭게 살아갈 수 있는 미래를 만들고자 힘쓰고 있습니다.\n WWF-KOREA(세계자연기금 한국본부)는 지난 2014년 공식 설립되었습니다. 한국 본부는 시민들의 기후위기 인식 제고를 위해 지구촌 전등 끄기 캠페인 ‘어스아워(EARTH HOUR)’를 비롯하여 기업, 정부, 학계, 시민사회 등 각 분야의 전문가들과 파트너십을 형성했습니다. 그리고 현재까지 지속가능한 비즈니스 모델 구축을 위한 각종 연구와 정책 제언, 소비자 캠페인 등을 함께 진행하고 있습니다. 뿐만 아니라 생물종 및 서식지 보전, 생산 방식의 전환 등의 활동도 함께 수행하고 있으며, 점차 국내에서의 활동 분야와 범위를 넓히고 영향력을 키워가고 있습니다.\n',
                'https://www.wwfkorea.or.kr/support_wwf.php',
              ),

              SizedBox(height:10,),
              buildDonationContainer(
              context,
              'https://i.ibb.co/wNtXKVs/greenpeace.png',
              '그린피스(GREENPEACE)',
              '행동을 통한 긍정적인 변화\n 그린피스는 전 지구적인 환경문제의 원인을 밝혀내고, 이를 해결하기 위해 평화적이고 창의적인 방식으로 활동하는 캠페인 단체입니다. 그린피스는 지구를 위한 변화를 만드는 가장 큰 힘은 바로 \'시민의 힘\'이라고 믿습니다.\n그린피스는 지구의 목소리를 대신하기 위해 활동합니다.\n해결책\n우리는 단순히 문제를 지적하는 데서 그치지 않고, 연구와 조사 활동을 통해 건강한 미래와 깨끗한 지구를 만들기 위한 효과적인 해결책을 제시합니다.\n독립성\n그린피스는 정치적, 상업적 독립성을 유지하기 위해 정부, 기업 혹은 정당으로부터 그 어떤 후원도 받지 않으며, 오로지 개인 및 독립재단의 후원으로만 운영됩니다.\n글로벌\n환경문제에는 국경이 없습니다. 국제환경단체로서 그린피스는 초국가적 환경문제에 대응하고 범세계적인 지식과 자원을 활용합니다.\n비폭력\n그린피스는 양심에 기반한 행동을 하며, 평화에 헌신합니다. 그린피스의 모든 액션',
              'https://supporter.ea.greenpeace.org/kr/s/donate'
              ),

              SizedBox(height:10,),
              buildDonationContainer(
              context,
              'https://i.ibb.co/9y1GJ3k/image.png',
              '에너지전환포럼',
              '창립선언문\n지구는 태양의 빛이 닿는 우주에서 유일하게 생명을 품은 행성입니다. 인간을 비롯해 약 1,000만 종의 생명체가 탄생하고 생존하며 소멸하는 터전이자, 그들의 미래 후손이 살아갈 보금자리입니다. 그래서 지구는 어떤 생명이나 세대만의 전유물이 아니라 온전히 보전해 후대에 물려줘야 할 모든 생명의 공동자산입니다. 하지만 인류는 산업혁명 이후 문명을 유지‧확장해 가는 과정에 기후변화와 환경오염을 유발하는 다량의 화석에너지 사용으로 지구생태계를 위험에 빠뜨려 왔습니다. 이와 함께 여러 차례의 대형원전사고로 심각한 위험이 확인된 원자력을 후대에 방사능폐기물을 떠넘기는 방식으로 확대해 왔습니다. 오늘날 지구 평균기온 상승과 잦은 이상기후, 수자원 고갈 및 해수면 상승, 대기‧수질‧토양오염, 광범위한 생태계 방사능 축적 등은 모두 이러한 문명의 이기와 자만이 자초한 결과들입니다.\n그럼에도 인류는 무분별한 에너지사용이 초래한 기후변화와 환경오염에 대응할수록 더 많은 에너지를 소비하고 더 큰 위험을 감당해야 하는 굴레에 갇혀 있습니다. 인구증가·도시화·경제성장에 따른 에너지사용 증가는 기후변화를, 기후변화는 가뭄이나 홍수 등의 수자원변화와 식량부족을, 수자원·식량부족은 더 많은 양의 에너지사용을 요구하는 악순환을 반복하고 있습니다. 온난화와 기후변화로 폭염·한파일수가 증가할수록 더 많은 에너지를 소비할 수밖에 없습니다. 인류가 사용하는 에너지 절대량을 줄여가면서 기존 화석에너지와 원자력을 재생에너지로 전환해 가는 노력만이 이런 악순환의 고리를 끊고 지구 생명체의 항구적이고 안전한 미래를 담보할 수 있습니다. \n(사)에너지전환포럼은 에너지전환이라는 시대적 과제 해결에 동참하고자 하는 각계 전문가와 시민사회, 산업계, 정치권 등이 소속과 당적, 분야, 이해관계를 모두 내려놓고 뜻을 모아 결성한 국내 최초의 에너지전환 분야 오픈 플랫폼입니다. 우리 포럼은 시민사회와 산업계를 비롯해 경제·환경·행정·정책·법률·금융·공학·소통 분야 최고 전문가들이 중심이 되어 정부 및 국회에 다양한 정책을 제안하고, 시민 참여와 발언이 보장되는 열린 논의의 장을 수시로 마련할 것입니다. 원자력과 화석에너지 중심 에너지체계가 미래세대와 지구환경에 끼치는 영향을 직시하여 에너지 절약과 효율 향상, 재생에너지 중심으로 에너지체계를 전환하도록 촉진하고 안내하는 다양한 역할을 수행할 것입니다. 더 나아가 우리는 에너지전환에 대한 대국민 공감대 확대를 통해 더 많은 국민과 국제사회가 지구 생명체 일원으로서 책임과 의무를 다할 수 있도록 힘쓸 것입니다. \n이제 막 돛을 올린 우리의 항로는 갈 길이 멀고 파도는 거셉니다. 에너지 생산, 유통, 소비 전 분야에 걸쳐 전 세계적으로 급격한 패러다임 변화와 혁신이 일어나고 있지만, 우리나라는 그 변화의 맨 바깥에서 달라진 환경을 실감하지 못하고 있습니다. 압축 경제성장 과정에 원자력과 화석에너지 중심의 에너지체계를 공고히 했고, 지금도 많은 정책과 제도, 산업과 시장이 이들 위주로 형성·운영되고 있습니다. 에너지의 약 95%를 수입하는 자원빈국임에도 장기간 저(低)가격 정책만을 고수해 온 탓에 에너지 효율과 재생에너지 비중은 OECD 최저수준입니다. 반면 원전과 석탄화력 밀집도는 세계 최고수준이며, 경제를 떠받치고 있는 산업은 에너지다소비·저효율 늪에 빠져 시나브로 대내외 경쟁력을 잃고 있습니다. \n(사)에너지전환포럼은 대한민국 에너지산업과 정책, 시장이 ‘경로의존성(path dependency)’을 타개해 과거의 타성과 관성에 함몰되지 않도록 감시자 역할을 수행하는 동시에, 세계 11위 경제대국의 위상에 걸맞은 글로벌 경쟁력을 갖춰 나갈 수 있도록 다양한 전략을 제시하는 공익법인의 역할을 흔들림 없이 수행하겠습니다. 에너지 절약과 효율 향상, 지속적인 재생에너지 확대가 실현될 수 있도록 산·학·연·민·관·정(産·學·硏·民 · 官·政) 누구나 협력하고 상의할 수 있는 논의의 구심체가 되겠습니다. 우리 포럼은 에너지전환을 둘러싼 생각의 차이를 좁히고 공감대를 넓히며, 에너지전환 과정의 갈등을 최소화하고 최적의 대안을 도출하기 위해 매진할 것입니다. 아울러 에너지전환의 가장 중요한 이해관계자인 국민이 바른 판단을 할 수 있도록 객관적인 정보와 신뢰성 높은 연구결과를 제공하는 일에도 노력을 다할 것입니다. 에너지전환이 우리 사회의 거대한 흐름이자 주류 담론이 되고, 우리 산업이 글로벌 시장의 주인공이 되는 그날까지 (사)에너지전환포럼은 끊임없이 고민하고 내달리겠습니다.\n2018년 2월 12일\n사단법인 에너지전환포럼\n창립총회 참가자 일동',
              'https://mrmweb.hsit.co.kr/v2/Member/MemberJoin.aspx?action=join&server=FkrJ7x0tmV4552sbnqpjnw=='
              ),
              SizedBox(height:10,),
              buildDonationContainer(
              context,
              'https://i.ibb.co/6WszHNL/image.jpg',
              '환경운동연합',
              '30년간 생명을 지켜온 우리나라의 가장 오래된 환경단체\n운동연합은 /‘공해반대시민운동협의회/’, /‘공해추방운동청년협의회/’가 1988년 통합하여 출범한 /‘공해추방운동연합(공추련)/’을 직접적인 뿌리로 합니다. 공추련은 1987년 6월 항쟁 이후 높아진 시민들의 사회참여 기운에 힘입어 대중적인 환경운동을 열었습니다.\n공추련의 창립 직후 부산, 광주, 목포 등 전국에서 회사원, 주부, 학생, 전문가들이 회원으로 참여하는 환경단체들이 하나, 둘 만들어지기 시작했습니다. 1992년 브라질 리우에서 개최된 유엔환경개발회의를 계기로 한층 시야가 깊어지고 넓어진 한국의 환경운동은 새로운 변화를 추구하게 됩니다. 피해자 중심의 반공해운동에서 시민으로 폭을 넓힌 환경운동으로 발전하며, 지역에 국한된 활동에서 전국적 연대 나아가 지구환경 보전을 추구하기 위한 연합체를 결성하게 된 것입니다.\n이에 1993년 4월 2일 공추련 등 전국 8개의 환경단체들(서울 공해추방운동연합, 부산 공해추방시민운동협의회, 진주 남강을지키는시민모임, 광주 환경운동시민연합, 대구 공해추방운동협의회, 울산 공해추방운동연합, 마산·창원공해추방시민운동협의회, 목포녹색연구회)이 통합되어 전국 조직인 ‘환경운동연합’이 태어났습니다.\n \n아시아 최대 규모의 환경단체\n지구의벗\n환경운동연합은 창립 이후 지금까지 현장성, 대중성, 전문성을 바탕으로  아시아 최대의 환경단체로 성장했습니다.\n1990년대 지리산·점봉산·덕유산보호, 시화호 살리기, 동강 살리기(동강댐 저지), 가야산 골프장 저지, 핵폐기장 강행저지, 새만금 살리기, 서·남해안 습지 보전, 비무장지대 보호, 팔당 상수원 보호, 낙동강 살리기, 시민 대기 조사, 대만 핵폐기물 반대운동, 그리고 2000년대 천성산 살리기, 계룡산 국립공원 관통도로 백지화, 부안 핵폐기장 백지화, 청주 원흥이 두꺼비 서식지 보전, 서해안 기름유출사고 대응, 한반도대운하 백지화, 후쿠시마 방사능 누출 대응까지 전국의 환경 현장에서 역할을 다하기 위해 노력하고 있습니다. 현재 환경연합에는 현장을 지키는 전국의 풀뿌리 지역조직 54개와 시민환경연구소, 환경법률센터, 월간 함께사는 길, 에코생협, 시민환경정보센터 등 전문성과 대중성을 높이기 위한 전문기관과 협력기관들이 있습니다.또한 핵물질 이용 반대, 멸종위기종 및 고래 보호, 기후변화 대응과 같은 지구환경문제 해결을 위하여 리우회의 참석 등 국제 연대에 적극적으로 참여하고 있습니다.\n2002년에는 세계 3대 환경단체 중 하나인 /‘지구의 벗/’ 회원단체로 정식 가입하여 /‘지구의 벗 한국/’으로 지구적 책임을 다하기 위해 협력하',
              'http://kfem.or.kr/?page_id=168739'
              ),

              SizedBox(height:10,),
              buildDonationContainer(
              context,
              'https://i.ibb.co/hWsz1Dj/image.png',
              '환경재단',
              '환경재단은 지속가능한 지구를 위해 정부·기업·시민사회와 함께하는 실천공동체입니다. \n \n그린리더란?\n지구의 지속가능성을 방해하는 장벽을 뛰어넘고\n해결을 위해 도전하고\n혁신적인 방법을 찾는 사람들\n\n2025년까지 500만명의 글로벌 그린리더들을 육성하여 글로벌 환경운동을 주도합니다.이를 위해 지식의 지평을 넓히고 연대를 강화할 에코캠퍼스를 세웁니다.\n\n우리가 먼저 그린리더가 되고,\n그린리더와 연대하며,\n함께 그린리더를 육성하겠습니다.\n \n이를 위해\n01\n공부합니다.\n02\n현장을 찾아갑니다.\n03\n실천합니다.\n04\n함께 이룹니다.\n \n로고 상단의 평행하고 반복적인 가로획을 하나의 연장선상에서 선으로 시각화하였습니다.로고의 글자들이 하나의 지향점을 바라보고 일직선으로 향해 있는 모습은 환경재단의 역사성과 지속가능성, 환경에 대한 신념을 드러냅니다.',
              'https://greenfund.org/m31.php'
              ),

              SizedBox(height:10,),
              buildDonationContainer(
              context,
              'https://i.ibb.co/L9xMqs3/image.png',
              '녹색전환연구소',
              '1. 녹색전환을 위한 장기적인 비전의 제시\n녹색전환연구소는 긴 호흡을 가지고 생태문명사회를 만들어가기 위해 필요한 장기적인 비전이 무엇인지를 계속해서 제시하고자 합니다. 이 비전은 청사진이 아니고, 연구소 혼자서 만들어가는 것도 아닙니다. 전세계 여러 지역 풀뿌리의 실험과 목소리, 다양한 주장과 생각들을 끌어 모으고, 활발하게 토론하면서 진화해나갈 것입니다.\n \n 2. 녹색전환을 위한 새로운 언어의 생산\n 언어는 우리의 정신을 담고 있다고 합니다. 그런데 지금 우리의 언어는 경제성장주의, 과학기술제일주의, 인간예외주의 등에 깊이 빠져있어서 좀처럼 헤어나지 못하고 있습니다. 녹색전환을 위해서는 오래된 타성에서 벗어나서 성찰하는 힘을 가진 새로운 언어를 만들어야 합니다. 녹색전환연구소에서는 자기성찰의 언어, 연대하며 신뢰하고 소통하는 언어를 계속 생산하고자 합니다.\n \n3. 녹색전환을 위한 네트워크 구축\n 녹색전환은 삶의 전면적인 재편이기 때문에 모든 분야, 그리고 모든 수준에서 연대가 필요합니다. 따라서 녹색전환연구소는 이러한 다차원적이면서도 실질적인 연대를 위한 네트워크 형성에 활동의 우선순위를 두고자 합니다.',
              'http://igt.or.kr/about/sponsor'
              ),

              SizedBox(height:10,),
              buildDonationContainer(
              context,
              'https://i.ibb.co/qnHwNMx/mighty-earth.png',
              'Mighty Earth',
              '마이티 어스(Mighty Earth)는 지구의 생명을 보호하기 위해 노력하는 국제적인 대변단체입니다. 저희의 목표는 지구의 절반을 자연을 위해 보호하고, 생명이 번성할 수 있는 기후를 확보하는 것입니다. 저희는 영향력에 집착하며, 세계에서 가장 효과적인 환경 운동 단체가 되기를 염원합니다.\n저희 팀은 주요 산업체들에게 글로벌 공급망에서 팜오일, 고무, 코코아, 동물 사료 등에서 대량의 산림 파괴와 기후 오염을 줄이도록 설득하여 변화를 이루어냈습니다. 이 과정에서 열대 지역의 원주민과 지역사회의 생계를 개선하기도 했습니다.\n저희는 슈퍼마켓과 주요 농업기업들로부터 육류의 환경 영향을 줄이기 위한 중요한 약속을 받았으며, 깨끗한 에너지에 수십억 달러의 투자를 이끌어내기도 했습니다. 또한 세계적으로 새로운 산림 및 기후 정책을 진전시켜 왔으며, 환경 파괴와 경제 성장 사이의 연결고리를 끊는 데 도움을 주었습니다. 마이티 어스의 접근 방식, 팀, 그리고 저희의 업적은 인사이드 필란트로피, 블룸버그, 뉴 리퍼블릭, 뉴욕 타임즈 매거진, 뉴욕 타임즈 등 다양한 언론 매체에 소개되었습니다.\n마이티 어스는 캠페인, 커뮤니케이션, 의사 결정자들과의 실질적인 협력을 통해 산업 전반을 빠르게 변화시킬 수 있는 "완벽한 폭풍"을 만들어 대변단체로서 변화를 이루어냅니다. 최근 저희의 작업은 정부가 기후 대책과 보다 포괄적인 환경 보호를 소홀히 한 결과, 세계적으로 더 많은 기업들에 초점을 맞추었습니다. 정부가 자신의 역할을 제대로 수행하지 않을지라도, 일은 계속되어야 합니다. 역설적으로, 이러한 환경 문제에서 가장 책임 있는 산업들 중 일부가 이 문제에 대처할 수 있는 최적의 위치에 있습니다.\n마찬가지로, 산업 리더들의 행동 변화는 정치적 재정렬의 기회를 제공하며, 개혁된 기업들이 더 나은 거버넌스를 지원하거나 적어도 방해하지 않도록 할 수 있습니다. 이에 따라 정부의 조치는 기업들이 정책 변화를 예상하여 새로운 조치를 취하도록 영감을 주며, 지속 가능한 환경 보호에 대한 지역사회의 참여는 지속적인 문화적 투자를 만들어 개선을 고정시킬 수 있습니다. 저희의 목표는 경제 전반에 걸쳐 이러한 민간 부문, 정부, 지역사회의 행동의 선순환을 창출하는 것입니다. 이 과정은 다음 10년 동안 세계적인 탄소 배출 감소를 위해 필요한 근본적인 변화의 기반이 될 것으로 믿습니다.',
              'https://secure.mightyearth.org/page/94944/donate/1'
              ),

              SizedBox(height:10,),
              buildDonationContainer(
              context,
              'https://i.ibb.co/ngGysZ9/image.png',
              '녹색연합',
              '녹색연합\n녹색연합은 1991년 창립하여 우리나라 자연을 지키는 환경단체입니다. 주요 생태축인 백두대간과 DMZ를 보전하고 야생동물과 그들의 서식지를 지킵니다. 기후위기를 가속화하는 현장을 감시하며 에너지가 정의로운 세상, 쓰레기가 없는 지구, 자연과 사람이 조화로운 사회를 그려갑니다.\n정부지원금 0% 시민들의 후원으로만 운영됩니다.\n전국 2만여 명 회원이 녹색연합과 함께 녹색 삶으로의 변화를 만듭니다.\n교육, 법률, 정책, 출판 3개 전문기구 [녹색교육센터], [녹색법률센터], [작은것이아름답다]와 전국 9개 지역조직이 협력합니다.\n평균 근속년수 10년, 생활에서 실천으로 고민하고 성장하는 40명의 활동가가 함께 합니다.\n하는일\n우리는 생명존중, 생태순환사회, 비폭력평화, 녹색자치의 가치를 닮아갑니다.\n생태계보전 : 보전과 보호의 원칙을 우선으로, 자연에 해를 최소한 하는 것은 자연과 인간이 공존하는 유일한 길입니다.\n야생동물 : 지구 생태계는 서로 연결되어 있습니다. 하나의 종이 없어지면 그 종을 의지하던 다른 종도 위험합니다.\n생활환경 : 삶과 삶터를 바꾸는 운동이 우리와 지구를 살립니다.기후위기 : 지구의 기후는 ‘변화’하는 수준을 넘어 ‘위기’상황 입니다. 위기를 직면하고 우리는 지금 행동해야 합니다.\n에너지전환 : 기후위기를 막는 첫 행동은 에너지전환입니다.\n평화와 생태 : 평화와 생태는 나란히, 더불어 가야 합니다.\n<녹색연합 4대강령>\n<녹색연합 정관>\n \n변화\n발로 뛰는 현장에서 답을 찾고, 가장 마지막까지 현장에 남습니다.\n새만금간척사업의 부당함을 주장하며 국내 최초 ‘미래세대 환경소송’을 진행하다.\n주한 미군 한강 독극물 방류를 폭로하여 미군의 공식 사과 이끌어내고 SOFA에 환경조항을 신설케하다.\n백두대간 보호운동의 성과로 백두대간 보전법 제정, 법 제정 10년 후 약 700km 백두대간 전수조사로 훼손실태를 알리다.\n민간 최초 울진삼척지역 산양 서식지 전수 조사하다.\n울진 금강소나무숲길 개통, 전국 최초 주민참여형 예약탐방제 실시하다.\n4대강 사업 반대활동 후원회원 강의친구365를 모집, 4대강 사업으로 인한 변화상 모니터링, 책임자처벌, 보 해체 등 재자연화 활동을 이어오다.\n웅담채취용 사육곰 문제를 여론화, 중성화 수술 완료로 사육곰 증식을 끝내다.\n로드킬 신고 모니터링 어플리케이션 ‘굿로드’ 개발하여 정부 로드킬 통합 시스템으로 협력하다.\n시민모금으로 도축위기에 처한 사육곰 4마리를 임시보호소로 구출하다.환경부의 부동의 결정을 이끌어 내 설악산 오색 케이블카 건설을 막아내다.\n<녹색연합 2022 활동보고서>\n<녹색연합 2021 활동보고서>\n<녹색연합 2020 활동보고서>\n<녹색연합 2019 활동보고서>\n<녹색연합 20주년 기념 백서>',
              'https://www.greenkorea.org/support/'
              ),

              SizedBox(height:10,),
              buildDonationContainer(
              context,
              'https://i.ibb.co/yhcFYgk/image.jpg',
              '한국내셔널스터스트',
              '한국내셔널트러스트는\n \'시민\'이 자연과 문화유산의 \'주인\'이 됩니다.내셔널트러스트운동은 영리를 목적으로 하지 않으며 정부로부터의 간섭과 정치적 영향력에서자유로운 순수 비영리 민간운동입니다.\n\n내셔널트러스트운동의 이념과 기원\n내셔널트러스트운동은 시민들의 자발적인 자산기증과 기부를 통해 보존가치가 높은 자연환경과 문화유산을 확보하여 시민의 소유로 영구히 보전하고 관리하는 시민운동을 의미합니다. 이 운동은 산업혁명을 통해 급격한 경제성장을 이룩했던 영국에서 1895년 시작되었습니다.\n 당시 영국은 무분별한 개발과 자연환경 파괴 그리고 자연·문화유산의 독점적 소유에 의한 각종 사회문제가 발생합니다. 물질적 풍요가 인간의 존엄과 삶의 질을 개선할 수 있다는 환상이 사라질 즈음, 시민들 스스로 내셔널트러스트(National Trust)를 탄생시켰습니다. 1895년 변호사 로버트 헌터(Robert Hunter), 사회 활동가 옥타비아 힐(Octavia Hill), 목사 하드윅 론즐리(Canon Hardwicke Rawnsley) 세 사람에 의해 출범한 영국내셔널트러스트의 정식 명칭은 \‘자연이 아름답고 역사적으로 중요한 장소를 보전하기 위한 내셔널트러스트(National Trust for places of Historic Interest and Natural Beauty)\'입니다. 1907년 내셔널트러스트 특별법(the National Trust Act)의 제정으로 내셔널트러스트가 확보한 자연·문화유산에 대해서는 개인이나 국가의 소유가 아닌 \‘시민의 유산\’으로 사회적 소유가 실현될 수 있는 계기를 맞게 됩니다. 이러한 제도화로 인해 내셔널트러스트가 확보한 시민유산은 \‘양도불능의 원칙\’이 보장됨에 따라 \‘영원한 보전(permanent preservation)\'이 가능해 질 수 있었습니다.\n현재 영국내셔널트러스트는 전국토의 1%를 소유하고 430만 명의 회원이 활동하는 영국 최대의 사적 토지소유자이자 시민단체로서, 정부정책의 감시자로서 역할뿐 아니라 정부를 능가하는 자연·문화유산 보전 담당자로서의 역할을 수행하고 있습니다. 또한, 2007년 12월 \‘세계내셔널트러스트기구(International National Trusts Organization=INTO)\'가 발족됨에 따라 전 세계 30여 개국이 활동하는 국제적 자연·문화유산 보전운동으로 확산되고 있습니다.\n\n한국에서의 내셔널트러스트운동\n공유화 정신이 잘 실현되었던 우리나라에서도 \'내셔널트러스트\'와 동일한 전통적인 가치관이 존재하였습니다. 관습법상의 \'동유재산\'이 바로 그러한 제도입니다. 동유재산은 지역 공동체의 운명과 함께하는 자연환경[예:공동으로 이용하는 어장(漁場), 목장(牧場), 송산(松山) 등]을 공동체 모두의 소유로 관리하고 운영하는 제도입니다. 즉 동유재산은 자손만대의 생존을 위해 꼭 필요한 것으로, 미래세대를 위한 현재세대에게 신탁된 것입니다. 이러한 이유로 공동체의 구성원 모두가 동의하였더라도 처분이나 매각할 수 없는 지위를 지니고 있습니다. 관습법의 지위가 인정되지 않는 지금, 시민운동인 내셔널트러스트운동을 통해 전통적 가치를 복원하고 미래세대를 위해 물려주어야 할 자연·문화유산의 확보를 위해 노력하고 있습니다.\n \n한국에서의 내셔널트러스트운동은 90년대 초반, 지역에서 특정 자연환경과 문화유산 보전을 위해 시민 성금모금 형태로 초기의 운동이 이루어졌습니다. 한국사회에서 내셔널트러스트운동을 본격적으로 모색하게 된 시기는 90년 중반 \‘그린벨트 해제 반대운동\’ 을 계기로 시작되게 됩니다. 그린벨트라는 정부의 제도적 보전장치가 훼손됨에 따라 기존 그린벨트 지역 소유자들의 사유재산을 보장하면서 녹지공간을 보전할 수 있는 새로운 시민운동을 모색하면서 \‘내셔널트러스트운동\’ 이 제기됩니다.\n 90년대 그린벨트 보전운동은 2000년 한국내셔널트러스트의 출범으로 이어지고 우리사회에 본격적인 내셔널트러스트운동의 계기를 맞게 됩니다. 한국내셔널트러스트는 출범이후, 미래세대를 위해 영구 보전할 수 있는 시민유산 확보를 위한 활동과 이를 제도적으로 뒷받침할 수 있는 \‘내셔널트러스트법\’ 제정활동을 진행하였습니다. 이러한 노력으로 \‘강화 매화마름 군락지\’, \‘최순우 옛집\’, \‘동강 제장마을\’, \‘나주 도래마을 옛집\’, \‘권진규 아틀리에\’, \‘연천 DMZ 일원 임야\’ 등 시민유산을 확보하여 보전·관리하고 있습니다.\n 또한 \‘내셔널트러스트법\’ 제정활동을 주도하여 2006년 3월, 법률 제7912호 \‘문화유산과 자연환경자산에 관한 국민신탁법(이하 국민신탁법)\’ 의 이론적 기반을 제공하였습니다. 하지만 현행 국민신탁법은 정부입법을 통해 졸속으로 추진되면서 당초의 목적과는 달리 내셔널트러스트운동을 통해 확보된 자산의 영구보전이 실현 불가능할 뿐 아니라 정부의 과도한 개입과 규제로 인해 시민운동의 자율성이 상실될 수 밖에 없는 한계를 지니게 되었습니다.\n \n따라서 한국내셔널트러스트는 현행 국민신탁법의 개정 또는 대체입법 활동을 통해 우리사회 내셔널트러스트운동의 활성화와 내셔널트러스트운동을 추진하고 있는 단체에게 법적으로 공평한 혜택이 부여될 수 있도록 노력하고 있습니다.\n한국내셔널트러스트는 자연-문화유산확보 사업과 올바른 내셔널트러스트법 제정활동 이외에 전국 각 지역에서 내셔널트러스트운동을 진행하고 있는 단체와의 네트워크 사업 및 업무지원과 다양한 시민참여 활동을 전개하고 있습니다.',
              'https://nationaltrust.or.kr/bbs/board.php?bo_table=B32'
              ),

              SizedBox(height:10,),
              buildDonationContainer(
              context,
              'https://i.ibb.co/y8msG0t/image.png',
              '숲과나눔',
              '숲과나눔\n몇 그루의 나무가 모여야 \‘숲\’이라고 할 수 있을까요?\n제 그늘과 내음과 씨앗과 열매를 다른 나무,다른 사람, 너른 세상과 나누기 시작하면 \‘숲\’이 됩니다. \‘나눔\’이 됩니다.\n \n핵심가치\n공공성, 투명성, 전문성, 독립성\n \n인재상 \n과학에 기반한 사고를 하는 인재. 합리성과 비판적 사고력을 갖추고 항상 혁신하는 자세로 해당 분야 최고의 전문성을 추구하는 인재와 함께합니다.\n협력의 힘을 믿는 인재\n혼자보다 함께 함으로써 더 큰 힘을 발휘할 수 있다는신념으로, 소통과 협동을 중시하고 주변 사람들과 조화를이루고자 하는 인재와 함께합니다. \n공공의 가치를 존중하는 인재\n사회 구성원이라는 인식과 그에 맞는 도덕적 품성을 갖추고난제 해결을 위한 행동과 실천으로 사회에 기여하고자 하는인재와 함께합니다.',
              'https://koreashe.org/donation/'
              ),

              SizedBox(height:10,),
              buildDonationContainer(
              context,
              'https://i.ibb.co/0ZkcyL4/image.png',
              '아름다운가게',
              '아름다운가게는 물건의 재사용과 재순환을 도모하여 우리 사회의 생태적-친환경적 변화를 추구하며, 우리의 삶의 근본이 변하게 하여 사람과 자연이 아름답게 공존하게 하는 \‘조용한 생활의 혁명\’을 긴 안목으로 전망합니다. 아름다운가게는 재사용과 재순환의 과정에서 얻어지는 수익금과 기부금을 지치고 힘든 이웃들과 그들을 위해 일하는 사람들, 단체들과 함께 나눕니다. 아름다운가게는 재사용가게를 운영하면서 지역사회 주민들의 생활 속에 뿌리내리고 그 지역 풀뿌리 시민들의 문화와 공육(共育)의 사랑방이 되고자 노력합니다. 더 나아가 아름다운가게는 저개발국가의 가난하고 소외된 사람들에게 경제활동의 기회를 제공하며 그들이 생산한 물건들에 대해 공정한 가격을 지불하여 경제적 자립을 돕기 위한 사업인 \‘공정무역\’(Fair Trade)에 정성과 힘을 기울일 것입니다.',
              'https://donation.beautifulstore.org/?utm_click=%ED%9B%84%EC%9B%90%7C%EC%95%84%EB%A6%84%EB%8B%A4%EC%9A%B4%EC%9D%B4%EC%9B%83%ED%94%8C%EB%9E%AB%ED%8F%BC&_gl=1*1z0wz15*_gcl_au*Njg0MzA5Nzk5LjE3MDE2ODc2ODM.*_ga*OTUyNTAzMDU2LjE3MDE2ODc2ODM.*_ga_NLGK74R7WV*MTcwMTY4NzY4My4xLjAuMTcwMTY4NzY4My42MC4wLjA.&_ga=2.42920421.1542326426.1701687683-952503056.1701687683'
              ),

              SizedBox(height:10,),
              buildDonationContainer(
              context,
              'https://i.ibb.co/VwqSLmZ/goodwillstore.png',
              '굿윌스토어',
              '환경보호\n굿윌스토어에 기부하거나 쇼핑을 하면 지역 사회의 장애인들을 도울 뿐만 아니라 우리가 그간 자각하지 못했던 많은 문제들을 다시금 생각하고 해결할 수 있습니다. 사용하지 않는 물건을 기증하면 환경보호에 큰 도움이 됩니다.\n \n국내 이산화탄소 배출량은 OECD 국가 중 4위를 기록했는데, 이는 회원국 35개국 중 이산화탄소 배출량이 집계된 26개 나라 중에서 미국, 일본, 독일에 이어 6억 7,970만 톤으로 네 번째로 큰 규모입니다.\n출처 : 영국에너지회사 브리티시페트롤리엄 2017년 ‘세계에너지 통계 보고서’\n \n 미세먼지의 증가나 물의 오염 등 환경의 변화로 우리는 많은 것을 잃었고,더 큰 환경의 변화를 앞두고 있습니다. 물품을 만들기 위해서는 연료와, 여러 가지 화학 물질이 사용됩니다. 그리고 물품의 쓰임이 다해져 없어져야 할 때도 큰 오염을 낳습니다. 우리가 사용하는 생활 용품을 아껴 쓰면 그만큼 물품을 적게 만들게 될 것입니다. 이와 같은 실천이 불필요한 자원의 낭비를 막고, 환경 오염에 도움이 될 것입니다.\n \n자연은 조상에게 물려 받은 것이 아니라 우리가 잠시 머물기 위해 후손들에게 빌려 쓰는 것입니다.\n1\n자연은 잠시 빌려 사용하고 원래대로 되돌려 놓는 것\n2\n편리함 보다는 자연의 훼손을 최소화하는 선택\n3\n생태계 동식물들과 함께 공유해야 하는 것\n4\n자연은 누구와도 친구가 되는 곳\n5\n누구도 피해 받지 않을 권리가 있는 곳\n자연이 있기에\n우리가 있습니다.\n굿윌스토어가 환경보호에 앞장섭니다.',
              'https://goodwillstore.org/donation/application.php'
              ),

              SizedBox(height:10,),




              // Other widgets can be added here
            ],
          ),
        ),
      ),
    );
  }
}

//틀 복사해서 쓰기
// buildDonationContainer(
          // context,
          // '',
          // '',
          // '내용',
          // 'url'
          // ),
          //
          // SizedBox(height:10,),
