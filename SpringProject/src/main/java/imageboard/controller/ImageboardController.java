package imageboard.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardPaging;
import imageboard.bean.ImageboardDTO;
import imageboard.bean.ImageboardPaging;
import imageboard.service.ImageboardService;

@RequestMapping(value="imageboard")
@Controller
public class ImageboardController {

		@Autowired
		private ImageboardService imageboardService;

	@RequestMapping(value = "imageboardWriteForm", method = RequestMethod.GET)
	public String imageboardWriteForm(Model model) {
		model.addAttribute("display", "/imageboard/imageboardWriteForm.jsp");
		return "/index";
	}

	@RequestMapping(value = "imageboardList", method = RequestMethod.GET)
	public String imageboardList(@RequestParam (required=false, 
								defaultValue="1")String pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/imageboard/imageboardList.jsp");
		return "/index";
	}
	
	@RequestMapping(value = "imageboardView", method = RequestMethod.GET)
	public String imageboardView(@RequestParam String seq,@RequestParam String pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("seq", seq);
		model.addAttribute("display", "/imageboard/imageboardView.jsp");
		return "/index";
	}
	
	/* <input type="file" name="img" > name이 1개인 경우 */
	/*
	 * @RequestMapping(value="imageboardWrite" , method=RequestMethod.POST)
	 * 
	 * @ResponseBody public void imageboardWrite(@ModelAttribute ImageboardDTO
	 * imageboardDTO ,@RequestParam MultipartFile img) { //img tmp라는 임시파일로 올라옴
	 * 
	 * String
	 * filePath="D:\\Spring\\workspace\\SpringProject\\src\\main\\webapp\\storage";
	 * String fileName=img.getOriginalFilename(); File file=new File(filePath,
	 * fileName);//tmp라는 임시파일로 올라온 파일을 진짜 생성해준다 //파일 복사 input, output생성 후 예외 처리 try
	 * { FileCopyUtils.copy(img.getInputStream(),new FileOutputStream(file)); }
	 * catch (IOException e) { e.printStackTrace(); }
	 * imageboardDTO.setImage1(fileName);//파일 이름 image1에 넣어준다. }
	 */

	/*
	 * .............................................................................
	 * ............
	 */

	/* <input type="file" name="img" > name이 2개 이상인 경우 */
	
	/*@RequestMapping(value = "imageboardWrite", method = RequestMethod.POST)
	@ResponseBody
	public void imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO, @RequestParam MultipartFile[] img) { // img tmp라는 임시파일로


		String filePath = "D:\\Spring\\workspace\\SpringProject\\src\\main\\webapp\\storage";
		String fileName;
		File file;
		
		
		//tmp라는 임시파일로 올라온 파일을 진짜 생성해준다
		// 파일 복사 input, output생성 후 예외 처리
		
		if (img[0] != null) {
			fileName = img[0].getOriginalFilename();// String fileName=img[0].getOriginalFilename();//for문 돌려야한다.
			file = new File(filePath, fileName);// File file=new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			imageboardDTO.setImage1(fileName);// 파일 이름 image1에 넣어준다.

		} else {
			imageboardDTO.setImage1("");// 파일 이름 image1에 넣어준다.
		}
		//-------------------------------------------//
		if (img[1] != null) {
			fileName = img[1].getOriginalFilename();// String fileName=img[0].getOriginalFilename();//for문 돌려야한다.
			file = new File(filePath, fileName);// File file=new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img[1].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			imageboardDTO.setImage2(fileName);// 파일 이름 image1에 넣어준다.

		} else {
			imageboardDTO.setImage2("");// 파일 이름 image1에 넣어준다.
		}
	}*/
	
	
	/* <input type="file" name="img[]" > 한번에 여러개의 파일이 들어오는 경우 */
	@RequestMapping(value = "imageboardWrite", method = RequestMethod.POST)
	@ResponseBody
	public void imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO, @RequestParam("img[]") List<MultipartFile> list) { // img tmp라는 임시파일로
	
		String filePath = "D:\\Spring\\workspace\\SpringProject\\src\\main\\webapp\\storage";
		String fileName;
		File file;
		
		for(MultipartFile img : list) {
			fileName=img.getOriginalFilename();
			file=new File(filePath, fileName);
		
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			imageboardDTO.setImage1(fileName);// 파일 이름 image1에 넣어준다.
			imageboardDTO.setImage2("");// 파일 이름 image2에 넣어준다.
			//DB와  연결, DB가서 저장->돌아와서->다시 DB가는 형태로 움직이기 때문에, DB에 계속 쌓인다. 
			imageboardService.insert(imageboardDTO);
		}//MultipartFile for문
		
	}//name="img[]"	
	
	@RequestMapping(value="getImageboardList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getImageboardList(@RequestParam (required=false, 
											defaultValue="1")String pg) {
		//1페이지 당 3개씩 가져오기.
		List<ImageboardDTO> list = imageboardService.getImageboardList(pg);
		
		ImageboardPaging imageboardPaging = imageboardService.imageboardPaging(pg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg",pg);
		mav.addObject("imageboardPaging",imageboardPaging);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="getImageboardView", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getImageboardView(@RequestParam String seq) {
		
		System.out.println("seq= "+seq);
		//1페이지 당 3개씩 가져오기.
		ImageboardDTO imageboardDTO = imageboardService.getImageboardView(seq);
		
		ModelAndView mav = new ModelAndView();
		//mav.addObject("pg",pg);
		mav.addObject("imageboardDTO", imageboardDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "imageboardDelete", method=RequestMethod.GET)
	public ModelAndView imageboardDelete(String[] check) {
		System.out.println("check = " + check[0]);
		imageboardService.imageboardDelete(check);
		return new ModelAndView("redirect:/imageboard/imageboardList") ;
	}

	
}
