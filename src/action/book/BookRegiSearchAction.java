package action.book;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import action.Action;
import vo.ActionForward;

public class BookRegiSearchAction implements Action {
	
	public static StringBuilder sb;
	private String clientID="P3nq6LUKrLz6LOPOVOMf"; //네이버 개발자 센터에서 발급받은 clientID입력
	private String clientSecret = "f_078uxS96";        //네이버 개발자 센터에서 발급받은 clientSecret입력

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookRegiSearchAction!");
		ActionForward forward =null;

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String title = URLEncoder.encode(request.getParameter("keyword"), "UTF-8");
		JSONObject json = new JSONObject();
		
		String apiURL = "https://openapi.naver.com/v1/search/book?query=="+ title; 
        URL url = new URL(apiURL); //API 기본정보의 요청 url을 복사해오고 필수인 query를 적어줍니당! 
        
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("X-Naver-Client-ID", clientID);
        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        int responseCode = con.getResponseCode();
        BufferedReader br;
        if (responseCode == 200) { 
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else { 
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        sb = new StringBuilder();
        String line;

        while ((line = br.readLine()) != null) {
            sb.append(line + "\n");
        }
        
        br.close();
        con.disconnect();
     // JSONObjet를 가져와서 key-value를 읽습니다.
        JSONParser jParse = new JSONParser();
      //JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다. 
        JSONObject jsonObj = (JSONObject) jParse.parse(sb.toString());
        //JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다. 
       
        JSONObject personObject =null;
        JSONArray bookArray = (JSONArray) jsonObj.get("items");
//        for(int i=0; i < bookArray.size(); i++) { 
//        	System.out.println("======== book : " + i + " ========"); 
//        	personObject = (JSONObject) bookArray.get(i); 
//        	System.out.println(personObject.get("title")); 
//        	System.out.println(personObject.get("link")); 
//        	System.out.println(personObject.get("image")); 
//        	System.out.println(personObject.get("author")); 
//        	System.out.println(personObject.get("price")); 
//        	System.out.println(personObject.get("discount")); 
//        	System.out.println(personObject.get("publisher")); 
//        	System.out.println(personObject.get("pubdate")); 
//        	System.out.println(personObject.get("isbn")); 
//        	System.out.println(personObject.get("description")); 
//    	} 
	        
		out.print(bookArray);
		return null;
	}

}
