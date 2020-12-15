<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<% 
response.setHeader("Pragma","No-cache"); //HTTP 1.0  
response.setDateHeader ("Expires", 0);  
response.setHeader ("Cache-Control", "no-cache");  
%> 
<jsp:useBean id="alram_list" class="java.util.ArrayList" scope="application" /> 
<% 
//실시간 알람기능 : application에서 가져와 해당자에게 뿌려주고 제거한다. 
String access_session = session.getId()+""; 
int remove_alram_no = -1; 
for(int i=0;i<alram_list.size();i++){ 
    Map map = (Map)alram_list.get(i); 
    String who = map.get("who")==null?"":map.get("who")+""; 
    String msg = map.get("msg")==null?"":map.get("msg")+""; 
    long msg_time = map.get("msg_time")==null?System.currentTimeMillis():Long.parseLong(map.get("msg_time")+""); 
    if(access_session.equals(who)) { 
        out.print(java.net.URLEncoder.encode(msg, "euc-kr"));//알람전송 
        remove_alram_no = i;//전송후 제거 
    }else if((System.currentTimeMillis()-msg_time)>10*1000) { 
        remove_alram_no = i;//10초 지난메세지 제거 
    }else{//아무것도하지않음 
    } 
} 
//알람을 읽었으면 제거 
if(remove_alram_no>-1){ 
    alram_list.remove(remove_alram_no); 
} 
%>

