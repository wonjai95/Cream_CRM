package com.spring.Creamy_CRM;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

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
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String url = "http://127.0.0.1:5000/instaCrawling/" + keyword;
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
			// TODO Auto-generated catch block
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
	
	
}
