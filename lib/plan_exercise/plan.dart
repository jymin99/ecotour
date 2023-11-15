import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';


class PlanListPage extends StatefulWidget {
  const PlanListPage({super.key});

  @override
  State<PlanListPage> createState() => _PlanListPageState();
}

class _PlanListPageState extends State<PlanListPage> {
  final _items=<Plan>[];//계회 저장 리스트

  final _planController=TextEditingController();

  @override
  void dispose(){
    _planController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _planController,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: ()=>_addPlan(Plan(_planController.text)),
                      child: const Text('+'),),
                  ],
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('plan').snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return const CircularProgressIndicator();
                    }
                    final documents=snapshot.data!.docs;
                    return Expanded(
                        child: ListView(
                          children: documents
                            .map((doc)=>_buildItemWidget(doc)).toList(),
                        ),
                    );
                  }
                ),
              ],
            ),
        ),
    );
  }

  Widget _buildItemWidget(DocumentSnapshot doc){
    final plan=Plan(doc['title'],isDone: doc['isDone']);
    return ListTile(
      onTap:()=>_togglePlan(doc),
      title: Text(
        plan.title,
        style:plan.isDone
          ?const TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic,
        )
            :null,
      ),
      trailing: IconButton(
        icon:const Icon(Icons.delete_forever),
        onPressed: ()=>_deletePlan(doc),
      ),
    );
  }

  //계획 추가 메소드
void _addPlan(Plan plan){
    FirebaseFirestore.instance
    .collection('plan')
    .add({'title':plan.title,'isDone':plan.isDone});
    _planController.text='';
}

//계획 삭제
void _deletePlan(DocumentSnapshot doc){
    FirebaseFirestore.instance.collection('plan').doc(doc.id).delete();
}

//완료
void _togglePlan(DocumentSnapshot doc){
    FirebaseFirestore.instance.collection('plan').doc(doc.id).update({
      'isDone': !doc['isDone'],
    });
}

}

class Plan{
  bool isDone=false;
  String title='';

  Plan(this.title,{this.isDone=false});

}




