package com.spring.Creamy_CRM.User_service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.python.jline.internal.InputStreamReader;
import org.python.util.PythonInterpreter;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class PythonServiceImpl implements PythonService{

	@Override
	public void pytest(HttpServletRequest req, Model model) throws IOException {
		
		String title = "연휴에는 휴식이 필요해";
		String url = "https://www.melon.com/search/total/index.htm?q="+title+"&section=&mwkLogType=T";
		
		Document doc;
		List<String> list_url = new ArrayList<String>();
		List<String> list_hidden = new ArrayList<String>();
		
		try {
			doc = Jsoup.connect(url).get();
			Elements list = doc.select(".list_dj_collection");
			list_url = list.select("a").eachText();
			Elements lists = list.select("input[type=hidden]");
			list_hidden = list.select("input[type=hidden]").eachAttr("value");
			
			int num = 0;
			for(int i = 0; i < list_url.size(); i++) {
				if(title.equals(list_url.get(i))) {
					//0일때 -> 0
					if(i == 0)
						num = 0;
					else {
						num = i / 2;
					}
				}
			}
			
			String select_numseq = list_hidden.get(num);
			String detail_url = "https://www.melon.com/mymusic/dj/mymusicdjplaylistview_inform.htm?plylstSeq="+select_numseq;
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
