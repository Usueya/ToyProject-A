package org.spring.my.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class MapServiceImpl implements MapService{

	@Override
	public Map<String, String> getXY(String address) throws Exception{
		Map<String, String> result = new HashMap<>();
		
		//String query = "서울특별시 관악구 관악로 145";
		 StringBuilder urlBuilder = new StringBuilder("https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode"); /*요청URL*/
	        urlBuilder.append("?" + URLEncoder.encode("query","UTF-8") + "=" +URLEncoder.encode(address,"UTF-8")); /*주소*/

	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", "99gnlsqvs2");
	        conn.setRequestProperty("X-NCP-APIGW-API-KEY", "XzD0IxjyU52Zshhh2b24EeBjpD0hqn7199uOZXKO");

	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        
	        StringBuilder sb = new StringBuilder();
	        String line;
	        
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        //System.out.println(sb.toString());
	        
	        //JSON파싱하기
	        //{} > jason object
	        //[] > 배열 list > index 존재 > jason array
	        
	        JSONParser parser = new JSONParser();
	        JSONObject object = (JSONObject)parser.parse(sb.toString());
	        
	        JSONArray array = (JSONArray)object.get("addresses");
	        //System.out.println(array.toString());

	        object = (JSONObject)array.get(0);
	        //System.out.println(object.toString());
	        
	        String x = (String)object.get("x");
	        String y = (String)object.get("y");
	        //System.out.println("x: "+x);
	        //System.out.println("y: "+y);

	        
	        result.put("x", x);
	        result.put("y", y);
		
		return result;
	}

}
