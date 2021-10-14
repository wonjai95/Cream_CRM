package com.spring.Creamy_CRM;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.Creamy_CRM.Host_controller.HostController;

@Controller
public class PythonCrawlingController {
	private static final Logger logger = LoggerFactory.getLogger(HostController.class);
	
	
	@RequestMapping("/host/snsCrawling")
	public String snsCrawlingPage(HttpServletRequest req, Model model) {
		logger.info("url -> snsCrawling");
		
		return "host/crawling/sns_crawling";
	}

	
	@RequestMapping("/host/snsCrawling_test")
	public ModelAndView snsCrawling_test(HttpServletRequest req, Model model) {
		logger.info("url -> snsCrawling_test");
		
		ModelAndView mav = new ModelAndView();
		String strKeyword = req.getParameter("keyword");
		String keyword = "";

		try {
			keyword = URLEncoder.encode(strKeyword, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

		String url = "http://192.168.219.100:6000/instaCrawling/" + keyword;
		String sb = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

			String line = null;

			while ((line = br.readLine()) != null) {
				sb = sb + line + "\n";
			}
			System.out.println("========br======");
			if (sb.toString().contains("ok")) {
				System.out.println("test : " + sb.toString());
				
			}
			br.close();

			System.out.println("" + sb.toString());
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.addObject("test1", sb.toString()); // "test1"는 jsp파일에서 받을때 이름, 
        									   //sb.toString은 value값(여기에선 test)
		mav.addObject("fail", false);
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		mav.setViewName("host/crawling/sns_crawling_img");   // jsp파일 이름
		
		return mav;
	}
	
	@RequestMapping("/host/just_img")
	public String sns_img(HttpServletRequest req, Model model) {
		logger.info("url -> just_img");
		
		return "host/crawling/just_img";
	}
	
	
	@RequestMapping("/host/reviewML")
	public ModelAndView reviewML(HttpServletRequest req, Model model) {
		logger.info("url -> reviewML");
		
		ModelAndView mav = new ModelAndView();
		String strReview = req.getParameter("review").trim();
		String review = "";

		try {
			review = URLEncoder.encode(strReview, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}


		String url = "http://192.168.219.100:6000/getReviewML/" + review;
		String sb = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

			String line = null;

			while ((line = br.readLine()) != null) { sb = sb + line + "\n"; }
			if (sb.toString().contains("ok")) { System.out.println("test : " + sb.toString()); }
			br.close();

			System.out.println("결과 : " + sb.toString());
			
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.addObject("predict", sb.toString()); // "test1"는 jsp파일에서 받을때 이름, sb.toString은 value값(여기에선 test)
		mav.addObject("fail", false);
		model.addAttribute("predict", sb.toString());
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		mav.setViewName("host/review/reviewML");   // jsp파일 이름
		
		return mav;
	}
	
	//플레이리스트 진입
	@RequestMapping("/host/playlist_py")
	public String playlist_py(HttpServletRequest req, Model model) {
		logger.info("url -> playlist_py");
		
		pL_recommend_first(req,model);
		
		return "host/crawling/playlist_py";
	}
	
	//플레이리스트 진입
		@RequestMapping("/host/playlist_py2")
		public String playlist_py2(HttpServletRequest req, Model model) {
			logger.info("url -> playlist_py2");
			
			String title = req.getParameter("keyword");
			model.addAttribute("keyword",title);
			
			pL_recommend(req,model);
			
			return "host/crawling/playlist_py";
		}
	
	//플레이리스트 멜론 웹크롤링
	public List<String> getPLmelonURL(String[] input_list){
		List<String> return_list = new ArrayList<String>();
		
		for(String title : input_list) {
			String url = "https://www.melon.com/search/total/index.htm?q="+title+"&section=&mwkLogType=T";
			System.out.println(url);
			Document doc;
			List<String> list_url = new ArrayList<String>();
			List<String> list_hidden = new ArrayList<String>();
			
			try {
				doc = Jsoup.connect(url).get();
				Elements list = doc.select(".list_dj_collection");
				list_url = list.select("a").eachText();
				Elements lists = list.select("input[type=hidden]");
				list_hidden = list.select("input[type=hidden]").eachAttr("value");
				
				for(String i : list_hidden)
					System.out.println("i : "+i);
				
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
				return_list.add(detail_url);
				
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return return_list;
	}
	
	//플리 파이썬_첫진입
		public ModelAndView pL_recommend_first(HttpServletRequest req, Model model) {
			logger.info("url -> pL_recommend_first");
			
			ModelAndView mav = new ModelAndView();
			String review = "연휴에는 휴식이 필요해";
			
			try {
				review = URLEncoder.encode(review, "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}

			String url = "http://192.168.219.100:6000/pL_recommend/" + review;
			String sb = "";
			try {
				HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

				String line = null;

				while ((line = br.readLine()) != null) { sb = sb + line; }
				if (sb.toString().contains("ok")) { System.out.println("test : " + sb.toString()); }
				br.close();

				System.out.println("결과 : " + sb.toString());
				
				
				
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			mav.addObject("predict", sb.toString()); // "test1"는 jsp파일에서 받을때 이름, sb.toString은 value값(여기에선 test)
			mav.addObject("fail", false);
			String titles = sb.toString();
			System.out.println("titles : "+titles);
			System.out.println("---------------");
			String[] lists = titles.split("-");
			//url list
			List<String> urlList = getPLmelonURL(lists);
			
			model.addAttribute("first_title",lists[0]);
			model.addAttribute("predict", sb.toString());
			model.addAttribute("url_list",urlList);
			model.addAttribute("title_list",lists);
			
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			mav.setViewName("host/review/playlist_py");   // jsp파일 이름
			
			return mav;
		}
	
	//플리 파이썬
	public ModelAndView pL_recommend(HttpServletRequest req, Model model) {
		logger.info("url -> playlist_ml");
		
		ModelAndView mav = new ModelAndView();
		String strReview = req.getParameter("keyword").trim();
		String review = "";

		try {
			review = URLEncoder.encode(strReview, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

		String url = "http://192.168.219.100:6000/pL_recommend/" + review;
		String sb = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

			String line = null;

			while ((line = br.readLine()) != null) { sb = sb + line; }
			if (sb.toString().contains("ok")) { System.out.println("test : " + sb.toString()); }
			br.close();

			System.out.println("결과 : " + sb.toString());
			
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.addObject("predict", sb.toString()); // "test1"는 jsp파일에서 받을때 이름, sb.toString은 value값(여기에선 test)
		mav.addObject("fail", false);
		
		String titles = sb.toString();
		System.out.println("titles : "+titles);
		System.out.println("---------------");
		String[] lists = titles.split("-");
		//url list
		List<String> urlList = getPLmelonURL(lists);
		
		model.addAttribute("first_title",lists[0]);
		model.addAttribute("predict", sb.toString());
		model.addAttribute("url_list",urlList);
		model.addAttribute("title_list",lists);
		
		
		model.addAttribute("predict", sb.toString());
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		mav.setViewName("host/review/playlist_py");   // jsp파일 이름
		
		return mav;
	}
	
	
}
