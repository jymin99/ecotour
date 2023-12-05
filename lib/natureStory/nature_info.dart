import 'package:capstone/natureStory/storyWidget.dart';
import 'package:flutter/material.dart';

import 'package:capstone/style.dart';

class nature_info extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _nature_info();
  }
}

class _nature_info extends State<nature_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              buildStoryContainer(
                context,
                'https://i.ibb.co/HpZd2fM/1.png',
                '\‘서울 Z\’의 Pick! 제로 웨이스트',
                '서울에 가 본 적이 있습니까? 서울은 젊은 에너지가 넘치는 도시입니다. 특히 지금의 서울은 \‘Z세대(1990년대 중반에서 2000년대 초반에 걸쳐 태어난 젊은 세대)\’라고 불리는 이들이 트렌드를 만들고 분위기를 주도하며, 사회 전반에 영향을 끼치고 있습니다.\n \n K-POP, K-Drama를 시작으로 일본에서도 한류 붐이 일어나면서 이제는 패션, 문화 전반으로 한국 트렌드 전반에 대한 관심이 확대되고 있습니다. 특히 일본의 젊은 세대들을 중심으로, 트렌드를 주도하고 있는 한국의 Z세대들의 라이프 스타일을 워너비 하는 사람도 늘고 있습니다.\n \n트렌드와 제로 웨이스트 두 가지 모두를 생각하다.\n그렇다면 한국 Z 세대들의 최근 관심사는 무엇일까요? 그건 바로 지속 가능한 환경을 위한 활동입니다. 코로나19 이후 환경문제에 대한 관심이 세계 전반에서 높아지기 시작했습니다. 어쩔 수 없이 사용하는 마스크를 비롯해 이전보다 훨씬 늘어버린 일회용 쓰레기들, 세계 곳곳에서 나타나는 이상기후들은 사람들로 하여금 자연스레 환경으로 관심을 돌리게 했습니다.\n \n한국의 젊은 세대들 또한 환경문제를 직시하게 되었습니다. 그리고 그들의 관심은 곧 \‘제로 웨이스트\’라는 소비 활동으로 이어졌습니다. 서울에서는 Z세대를 중심으로 소비를 하되 환경을 생각하는 \‘착한 소비\’를 하자는 것이 트렌드로 떠오르고 있습니다. 일회용 컵 대신 텀블러를 가져 다니고 친환경 제품을 구입하려고 노력합니다.\n 트렌드에 민감하고 시류를 잘 읽어내는 한국의 가게들 역시 Z세대들과 함께 조금씩 지속 가능한 환경을 위한 걸음을 같이 하기 시작했습니다. 서울에서 친환경 제품을 판매하거나 제로 웨이스트를 지향하는 가게들은 단순히 환경만을 생각하는 가게가 아닙니다. 그곳의 감각적인 인테리어와 제품들은 쇼핑 욕구와 방문 욕구를 불러일으켜 지속 가능한 삶을 자연스럽게 실천하게 만듭니다. 그렇다면 지금부터 서울의 매력적인 친환경 가게들을 구경하러 가볼까요? \n \n JOIN THE CIRCLE AROMATICA 제로스테이션 \n동그란 원은 시작과 끝이 없습니다. 언제나 그 속에서 순환하며 돌아가죠. 마지막으로 서울에서 지속가능성을 경험할 곳은 \‘AROMATICA\’ 입니다. AROMATICA는 합성향료와 유해 성분이 없는 안전한 천연 유기농 화장품을 판매하고 있어요. 피부에 자극이 적은 순한 재료를 사용하는 것은 물론이고, 화장품에 사용되는 용기도 재활용이 용이한 100% 재생 플라스틱과 90% 재생 유리 용기를 사용하여 친환경적인 상품을 개발하고 있습니다. \n \n 신사동 가로수길에 위치한 AROMATICA 제로스테이션은 AROMATICA의 환경 보호 의식을 가장 잘 나타낸 곳입니다. AROMATICA 제로스테이션은 외벽 벽돌, 매장 내 가구, 카페 유리잔 등 모든 것이 재활용 소재를 활용해서 만든 제품으로 인테리어가 되어 있습니다. AROMATICA 제로스테이션은 AROMATICA 제품을 판매하는 것은 물론 다양한 종류의 친환경 생활용품도 판매합니다. 또 상품과 함께 상품의 내용물을 빈 용기에 담아 구입할 수 있는 \'리필 스테이션\'과 다 쓴 플라스틱 용기를 가져가면 그 플라스틱을 더 세밀하게 분리하는 기계를 체험할 수 있는 \'무한 플라스틱 사이클 존\', 자연에서 얻은 원료만 사용한 AROMATICA의 \'티 카페\'가 있어 친환경과 관련된 체험 활동이 가능합니다.\nAROMATICA 제로스테이션에서는 매주 수요일과 금요일에 \“자원순환 환경교육\” 을 진행합니다. 네이버 예약을 통해 참가할 수 있으며, 자원순환 교육에 참여할 경우 용기 재사용을 실천하는 아로마티카 리필스테이션 체험(200ml)이 제공해 준다고 하니 제로스테이션에서 쇼핑, 카페, 환경보호 활동 등 여러 가지 활동을 동시에 즐겨보아요.'
              ),

              SizedBox(height:10,),

              buildStoryContainer(
                context,
                'https://i.ibb.co/rkbPf6C/1.png',
                '1박 2일 국내 여행 시 배출되는 \n 탄소량은?',
                '내용',
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

