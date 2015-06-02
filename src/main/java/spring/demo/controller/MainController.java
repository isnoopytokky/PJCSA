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

import spring.demo.address.Address;
import spring.demo.model.Member;
import spring.demo.model.Members;
import spring.demo.service.DistrictsService;
import spring.demo.service.MemberService;
import spring.demo.service.ProvincesService;

@Controller
public class MainController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProvincesService provincesService;
	
	
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
	
	@RequestMapping("/ajax")
    public ModelAndView helloAjaxTest(@RequestParam String message) {
        return new ModelAndView("ajax", "message", message);
    }
	
	@RequestMapping(value="/index")
	public ModelAndView index2(Map<String,Object> map){
		List members =  memberService.getAllMember();
		Members listMembers = new Members();
		map.put("member", new Member());
		map.put("members", members);
		map.put("listMembers", listMembers);
		map.put("provincesList", Address.getProvincesList(provincesService));
			
		return new ModelAndView("index");
	}
	
	@RequestMapping(value="/excel")
	public ModelAndView indexExcel(Map<String,Object> map){
		List members =  memberService.getAllMember();
		Members listMembers = new Members();
		map.put("member", new Member());
		map.put("members", members);
		map.put("listMembers", listMembers);
		map.put("provincesList", Address.getProvincesList(provincesService));
		map.put("provincesOpt", Address.getProvincesOptions(provincesService));
			
		return new ModelAndView("indexExcel");
	}
	
	@RequestMapping(value="/excelAJS")
	public ModelAndView indexExcelAJS(Map<String,Object> map){
		List members =  memberService.getAllMember();
		map.put("member", new Member());
		map.put("members", members);
		map.put("provincesList", Address.getProvincesList(provincesService));
		map.put("provincesOpt", Address.getProvincesOptions(provincesService));
			
		return new ModelAndView("indexExcelAJS");
	}

    @RequestMapping(value="/pdf/{filename}",method = RequestMethod.GET)
    public void doDownload(HttpServletResponse response,@PathVariable("filename") String file) throws IOException {
 
    	File currentDirectory = new File(new File(".").getAbsolutePath());
    	System.out.println(currentDirectory.getCanonicalPath());
    	System.out.println(currentDirectory.getAbsolutePath());
    	
        InputStream is = new FileInputStream(currentDirectory.getAbsolutePath()+"/pdf/"+file);

        // set file as attached data and copy file data to response output stream
        response.setHeader("Content-Disposition", "attachment; filename=\"" + file + ".license\"");
        FileCopyUtils.copy(is, response.getOutputStream());

        // delete file on server file system
        //licenseFile.delete();

        // close stream and return to view
        response.flushBuffer();
 
    }
}
