part of 'IMPORTS_search_jobtile_employee.dart';

class SearchJobTileBodyBuilder extends StatelessWidget {
  final List<CompanyJobModel> jobs;

  const SearchJobTileBodyBuilder({Key? key, required this.jobs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchJobTileController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedWrapper(
          index: jobs.length,
          durationStyle: WrapDurationStyle.veryFast,
          child: ListView.builder(
            physics: AppPhysics.alwaysScrollablePhysics,
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              final job = jobs[index];
              return JobApplicationCard(job: job);
            },
          ),
        ),
      );
    });
  }
}
// // start search storage
//
// void storeSearchWord({String word=' '}){
//   List<String> words=[];
//   if(generalStorage.hasData('searchWords')){
//     jsonDecode(generalStorage.read('searchWords')).forEach((e){
//       words.add(e);
//     });
//   }
//   if(!words.contains(word)){words.insert(0,word);}
//   generalStorage.write('searchWords', jsonEncode(words));
// }
//
// List<String> fetchSearchWords(){
//   List<String> words=[];
//   if(generalStorage.hasData('searchWords')){
//     jsonDecode(generalStorage.read('searchWords')).forEach((e){
//       words.add(e);
//     });
//   }
//   return words;
// }
//
//
// void deleteSearchWord({required int index}){
//   List<String> words=[];
//   if(generalStorage.hasData('searchWords')){
//     jsonDecode(generalStorage.read('searchWords')).forEach((e){
//       words.add(e);
//     });
//   }
//   words.removeAt(index);
//   generalStorage.write('searchWords', jsonEncode(words));
// }
//
// // end auth storage
