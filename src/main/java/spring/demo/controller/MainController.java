package spring.demo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.demo.model.Member;
import spring.demo.model.Members;
import spring.demo.service.MemberService;


@Controller
public class MainController {
	@Autowired
	private MemberService memberService;
	
	
	/**
     * Size of a byte buffer to read/write file
     */
    private static final int BUFFER_SIZE = 4096;
             
    /**
     * Path of the file to be downloaded, relative to application's directory
     */
    private String filePath = "/pdf/Test.pdf";
	
	@RequestMapping("/")
	public ModelAndView index(){		
		return new ModelAndView("redirect:index");
	}
	
	@RequestMapping(value="/index")
	public ModelAndView index2(Map<String,Object> map){
		List members =  memberService.getAllMember();
		Members listMembers = new Members();
		map.put("member", new Member());
		map.put("members", members);
		//map.put("listMembers", listMembers);
	//	map.put("provincesList", Address.getProvincesList(provincesService));
			
		return new ModelAndView("index");
	}
	
	@RequestMapping("/ajax")
    public ModelAndView helloAjaxTest(@RequestParam String message) {
        return new ModelAndView("ajax", "message", message);
    }
	
	
	@RequestMapping(value="/report")
	public ModelAndView report(){			
		return new ModelAndView("report/index");
	}
	
	@RequestMapping(value="/news")
	public ModelAndView news(){			
		return new ModelAndView("news/index");
	}
	
	@RequestMapping(value="/about")
	public ModelAndView about(){			
		return new ModelAndView("about/index");
	}
}
