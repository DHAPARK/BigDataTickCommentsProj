package _trash;

public class Parsing_DB {

	public static String subStrByte(String str, int cutlen){
        if(!str.isEmpty()){
            str = str.trim();
            if(str.getBytes().length <= cutlen) {
                return str;
            }else{
                StringBuffer sbStr = new StringBuffer(cutlen);
                int nCnt = 0;
                for(char ch: str.toCharArray()){
                    nCnt += String.valueOf(ch).getBytes().length;
                    if(nCnt > cutlen) break;
                    sbStr.append(ch);
                }
                return sbStr.toString();
            }
        } else {
            return "";
        }
    }

}
