package com.firstTest.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firstTest.service.Career_Service;
import com.firstTest.service.Edu_background_Service;
import com.firstTest.service.License_Service;
import com.firstTest.service.Personal_Service;
import com.firstTest.service.Skill_Service;
import com.firstTest.service.Training_Service;
import com.firstTest.vo.Personal_VO;
import com.firstTest.vo.Edu_background_VO;
import com.firstTest.vo.License_VO;
import com.firstTest.vo.Career_VO;
import com.firstTest.vo.Training_VO;
import com.firstTest.common.page.Main_Paging;
import com.firstTest.common.util.Main_Util;
import com.firstTest.vo.Skill_VO;

import org.springframework.security.access.annotation.Secured;



/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="/firstTest")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private Personal_Service personal_Service;
	@Autowired
	private Edu_background_Service edu_background_Service;
	@Autowired
	private License_Service license_Service;
	@Autowired
	private Career_Service career_Service;
	@Autowired
	private Training_Service training_Service;
	@Autowired
	private Skill_Service skill_Service;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "home";
	}
	
	/*관리자계정 관련 페이지*/
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {
	     return "admin";
	}
	
	
	/********************************************************************
	* 메인페이지에 사원들 정보를 리스트로 보여주기
	********************************************************************/
	@RequestMapping(value="/main_List", method = RequestMethod.GET)
	public String main_List(@ModelAttribute Personal_VO pvo, Model model){
		
		if(pvo.getOrder_by()==null){
			pvo.setOrder_by("p_num");
		}
		if(pvo.getOrder_sc()==null){
			pvo.setOrder_sc("DESC");
		}

		Main_Paging.setPage(pvo); //Main_Paging.java에 setPage메소드를 호출...
		
		int total = personal_Service.main_ListCnt(pvo);
		int count = total-(Main_Util.nvl(pvo.getPage())-1)*Main_Util.nvl(pvo.getPageSize());
		
		List<Personal_VO> main_List = personal_Service.main_List(pvo);
		
		model.addAttribute("main_List", main_List);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", pvo);
		model.addAttribute("mainPage","main_List");
		return "main_List";
	}
	
	/*정보입력페이지로 이동*/
	@RequestMapping(value = "/inputPage", method = RequestMethod.GET)
	public String inputPage(Locale locale, Model model) {
		logger.info("Welcome detailPage! The client locale is {}.", locale);
		return "inputPage";
	}
	
	/*상세정보 페이지로 이동...*/
	@RequestMapping(value = "/detailPage", method = RequestMethod.GET)
	public String detailPage(@ModelAttribute Personal_VO pvo, Edu_background_VO evo, 
			Career_VO cvo, License_VO lvo, Training_VO tvo, Skill_VO svo, Model model) {
		Personal_VO p_Detail = new Personal_VO();
		p_Detail = personal_Service.p_Detail(pvo);
		List<Edu_background_VO> edu_List = edu_background_Service.edu_List(evo);
		List<Career_VO> c_List = career_Service.c_List(cvo);
		List<License_VO> l_List = license_Service.l_List(lvo);
		List<Training_VO> t_List = training_Service.t_List(tvo);
		List<Skill_VO> s_List = skill_Service.s_List(svo);
		
		/*if(p_Detail != null && (!p_Detail.equals(""))) {
			p_Detail.setP_phone(p_Detail.getP_phone().toString().replaceAll("\n", "<br>"));
		}*/

		model.addAttribute("p_Detail", p_Detail);
		model.addAttribute("edu_List", edu_List);
		model.addAttribute("c_List", c_List);
		model.addAttribute("l_List", l_List);
		model.addAttribute("t_List", t_List);
		model.addAttribute("s_List", s_List);
		
		return "detailPage";
	}
	
	/*사원정보 수정 페이지로 이동...*/
	@RequestMapping(value = "/updatePage", method = RequestMethod.GET)
	public String updatePage(@ModelAttribute Personal_VO pvo, Edu_background_VO evo, 
			Career_VO cvo, License_VO lvo, Training_VO tvo, Skill_VO svo, Model model) {
		Personal_VO p_Detail = new Personal_VO();
		p_Detail = personal_Service.p_Detail(pvo);
		List<Edu_background_VO> edu_List = edu_background_Service.edu_List(evo);
		List<Career_VO> c_List = career_Service.c_List(cvo);
		List<Training_VO> t_List = training_Service.t_List(tvo);
		List<License_VO> l_List = license_Service.l_List(lvo);
		List<Skill_VO> s_List = skill_Service.s_List(svo);
		
		/*if(p_Detail != null && (!p_Detail.equals(""))) {
			p_Detail.setP_phone(p_Detail.getP_phone().toString().replaceAll("\n", "<br>"));
		}*/
		
		model.addAttribute("p_Detail", p_Detail);
		model.addAttribute("edu_List", edu_List);
		model.addAttribute("c_List", c_List);
		model.addAttribute("l_List", l_List);
		model.addAttribute("t_List", t_List);
		model.addAttribute("s_List", s_List);
		
		return "updatePage";
	}
	
	/*정보 입력 메소드*/
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(@ModelAttribute Personal_VO pvo, Edu_background_VO evo, License_VO lvo, Career_VO cvo, Training_VO tvo, Skill_VO svo, 
			HttpServletRequest request) throws IllegalStateException, IOException {
		int result1 = 0;
		Personal_VO p_num_fk = null;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		int result5 = 0;
		int result6 = 0;
		String url = "";
		
		result1 = personal_Service.p_Insert(pvo);
		p_num_fk = personal_Service.p_num_fk(pvo);
		
		//입력된 Personal테이블의 p_num값을 다른테이블의 외래키로 사용하기위해...
		evo.setP_num(p_num_fk.getP_num());	
		lvo.setP_num(p_num_fk.getP_num());
		cvo.setP_num(p_num_fk.getP_num());
		tvo.setP_num(p_num_fk.getP_num());
		svo.setP_num(p_num_fk.getP_num());
		
		/*############# edu_Insert #########################*/
		 String[] edu_name = request.getParameterValues("edu_name");
		 String[] edu_date = request.getParameterValues("edu_date");
		 String[] edu_inout = request.getParameterValues("edu_inout");
		 int e=0;
		 for(e=0; e< edu_name.length;e++){
			 evo.setEdu_name(edu_name[e]);
			 evo.setEdu_date(edu_date[e]);
			 evo.setEdu_inout(edu_inout[e]);
			 result2 = edu_background_Service.edu_Insert(evo);
		 }
		/*#############################################*/
		/*############# l_Insert #########################*/
		 String[] l_name = request.getParameterValues("l_name");
		 String[] l_date = request.getParameterValues("l_date");
		 int l=0;
		 for(l=0; l< l_name.length;l++){
			 lvo.setL_name(l_name[l]);
			 lvo.setL_date(l_date[l]);
			 result3 = license_Service.l_Insert(lvo);
		 }
		/*#############################################*/
		/*############# c_Insert #########################*/
		 String[] c_name = request.getParameterValues("c_name");
		 String[] c_start = request.getParameterValues("c_start");
		 String[] c_end = request.getParameterValues("c_end");
		 String[] c_position = request.getParameterValues("c_position");
		 String[] c_dept = request.getParameterValues("c_dept");
		 int c=0;
		 for(c=0; c < c_name.length;c++){
			 cvo.setC_name(c_name[c]);
			 cvo.setC_start(c_start[c]);
			 cvo.setC_end(c_end[c]);
			 cvo.setC_position(c_position[c]);
			 cvo.setC_dept(c_dept[c]);
			 result4 = career_Service.c_Insert(cvo);
		 }
		/*#############################################*/
		 /*############# t_Insert #########################*/
		 String[] t_name = request.getParameterValues("t_name");
		 String[] t_start = request.getParameterValues("t_start");
		 String[] t_end = request.getParameterValues("t_end");
		 String[] t_institution = request.getParameterValues("t_institution");
		 int t=0;
		 for(t=0; t < t_name.length;t++){
			 tvo.setT_name(t_name[t]);
			 tvo.setT_start(t_start[t]);
			 tvo.setT_end(t_end[t]);
			 tvo.setT_institution(t_institution[t]);
			 result5 = training_Service.t_Insert(tvo);
		 }
		/*#############################################*/
		/*############# s_Insert #########################*/
		 String[] s_ability = request.getParameterValues("s_ability");
		 String[] s_level = request.getParameterValues("s_level");
		 int s=0;
		 for(s=0; s< s_ability.length;s++){
			 svo.setS_ability(s_ability[s]);
			 svo.setS_level(s_level[s]);
			 result6 = skill_Service.s_Insert(svo);
		 }
		/*#############################################*/
		
		if(result1 == 1 && result2 == 1  && result3 == 1 && result4 == 1 && result5 == 1 && result6 == 1){
			url = "/firstTest/main_List.do";
		}

		return "redirect:"+url;
	}
	
	/*정보 수정 메소드*/
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(@ModelAttribute Personal_VO pvo, Edu_background_VO evo, License_VO lvo, Career_VO cvo, Training_VO tvo, Skill_VO svo, 
			HttpServletRequest request) throws IllegalStateException, IOException {
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		int result5 = 0;
		int result6 = 0;
		String url = "";
		
		result1 = personal_Service.p_Update(pvo);
		result2 = edu_background_Service.edu_Update(evo);
		/*############# edu_Update #########################*/
		evo.setP_num(pvo.getP_num());
		result2 = edu_background_Service.edu_Delete(evo);
		 String[] edu_name = request.getParameterValues("edu_name");
		 String[] edu_date = request.getParameterValues("edu_date");
		 String[] edu_inout = request.getParameterValues("edu_inout");
		 int e=0;
		 for(e=0; e< edu_name.length;e++){
			 evo.setEdu_name(edu_name[e]);
			 evo.setEdu_date(edu_date[e]);
			 evo.setEdu_inout(edu_inout[e]);
			 result2 = edu_background_Service.edu_Insert(evo);
		 }
		/*#############################################*/
		/*############# l_Update #########################*/
		lvo.setP_num(pvo.getP_num());
		result3 = license_Service.l_Delete(lvo);
		 String[] l_name = request.getParameterValues("l_name");
		 String[] l_date = request.getParameterValues("l_date");
		 int l=0;
		 for(l=0; l< l_name.length;l++){
			 lvo.setL_name(l_name[l]);
			 lvo.setL_date(l_date[l]);
			 result3 = license_Service.l_Insert(lvo);
		 }
		/*#############################################*/
		/*############# c_Update #########################*/
		cvo.setP_num(pvo.getP_num());
		result4 = career_Service.c_Delete(cvo);
		 String[] c_name = request.getParameterValues("c_name");
		 String[] c_start = request.getParameterValues("c_start");
		 String[] c_end = request.getParameterValues("c_end");
		 String[] c_position = request.getParameterValues("c_position");
		 String[] c_dept = request.getParameterValues("c_dept");
		 int c=0;
		 for(c=0; c < c_name.length;c++){
			 cvo.setC_name(c_name[c]);
			 cvo.setC_start(c_start[c]);
			 cvo.setC_end(c_end[c]);
			 cvo.setC_position(c_position[c]);
			 cvo.setC_dept(c_dept[c]);
			 result4 = career_Service.c_Insert(cvo);
		 }
		/*#############################################*/
		 /*############# t_Update #########################*/
		 tvo.setP_num(pvo.getP_num());
		 result5 = training_Service.t_Delete(tvo);
		 String[] t_name = request.getParameterValues("t_name");
		 String[] t_start = request.getParameterValues("t_start");
		 String[] t_end = request.getParameterValues("t_end");
		 String[] t_institution = request.getParameterValues("t_institution");
		 int t=0;
		 for(t=0; t < t_name.length;t++){
			 tvo.setT_name(t_name[t]);
			 tvo.setT_start(t_start[t]);
			 tvo.setT_end(t_end[t]);
			 tvo.setT_institution(t_institution[t]);
			 result5 = training_Service.t_Insert(tvo);
		 }
		/*#############################################*/
		/*############# s_Update #########################*/
		svo.setP_num(pvo.getP_num());
		result6 = skill_Service.s_Delete(svo);
		 String[] s_ability = request.getParameterValues("s_ability");
		 String[] s_level = request.getParameterValues("s_level");
		 int s=0;
		 for(s=0; s < s_ability.length;s++){
			 svo.setS_ability(s_ability[s]);
			 svo.setS_level(s_level[s]);
			 result6 = skill_Service.s_Insert(svo);
		 }
		/*#############################################*/
		
		if(result1 == 1 && result2 == 1  && result3 == 1 && result4 == 1 && result5 == 1 && result6 == 1){
			url="/firstTest/detailPage.do?p_num="+pvo.getP_num();
		}
		return "redirect:"+url;
	}
	
	/*사원정보 삭제메소드*/
	@RequestMapping(value="/delete")
	public String delete(@ModelAttribute Personal_VO pvo,Edu_background_VO evo, License_VO lvo, Career_VO cvo, Training_VO tvo, Skill_VO svo )
			 throws IllegalStateException, IOException {
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		int result5 = 0;
		int result6 = 0;
		String url = "";

		evo.setP_num(pvo.getP_num());
		lvo.setP_num(pvo.getP_num());
		cvo.setP_num(pvo.getP_num());
		tvo.setP_num(pvo.getP_num());
		svo.setP_num(pvo.getP_num());
		result2 = edu_background_Service.edu_Delete(evo);
		result3 = license_Service.l_Delete(lvo);
		result4 = career_Service.c_Delete(cvo);
		result5 = training_Service.t_Delete(tvo);
		result6 = skill_Service.s_Delete(svo);
		result1 = personal_Service.p_Delete(pvo);
		
		if(result1 == 1){
			url="/firstTest/main_List.do";
		}

		return "redirect:"+url;
	}
	
	/*주민등록번호 중복검사 메소드*/
	@ResponseBody
	@RequestMapping(value="/juminOverlap")
	public String juminOverlap(@RequestParam("p_number") String p_number){
		int result = 0;
		System.out.println("Ajax 주민번호 중복체크");
		result = personal_Service.juminOverlap(p_number);
		return result +"";
	}
	
	/*이메일 중복검사 메소드*/
	@ResponseBody
	@RequestMapping(value="/mailOverlap")
	public String mailOverlap(@RequestParam("p_email") String p_email){
		int result = 0;
		System.out.println("Ajax 이메일 중복체크");
		result = personal_Service.mailOverlap(p_email);
		return result +"";
	}

	
}
