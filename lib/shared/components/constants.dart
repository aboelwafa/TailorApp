
void printFullText(String text)
{
  final Pattern=RegExp('.{1,800}');
  Pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}
String? uId='';