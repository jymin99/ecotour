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


              // Other widgets can be added here
            ],
          ),
        ),
      ),
    );
  }
}

//틀 복사해서 쓰기
// buildStoryContainer(
// context,
// '',
// '',
// '내용',
// 'url'
// ),
//
// SizedBox(height:10,),
