package imageboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import imageboard.bean.ImageboardDTO;
import imageboard.bean.ImageboardPaging;
import imageboard.dao.ImageboardDAO;

@Service
public class ImageboardServiceImpl implements ImageboardService {

	@Autowired
	private ImageboardDAO imageboardDAO;
	@Autowired
	private ImageboardPaging imageboardPaging;
	

	@Override
	public void insert(ImageboardDTO imageboardDTO) {
		imageboardDAO.insert(imageboardDTO);
	}

	@Override
	public List<ImageboardDTO> getImageboardList(String pg) {
		Map<String,String>map = new HashedMap<String, String>();
		
		int endNum = Integer.parseInt(pg)*3;
		int startNum = endNum-2;
	
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		System.out.println("startNum"+ startNum+"");
		
		return imageboardDAO.getImageboardList(map);
	}

	@Override
	public ImageboardPaging imageboardPaging(String pg) {
		int totalA= imageboardDAO.getTotalA();
		
		imageboardPaging.setCurrentPage(Integer.parseInt(pg));
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(totalA);
		imageboardPaging.makePagingHTML();
		return imageboardPaging;
	}

	@Override
	public ImageboardDTO getImageboardView(String seq) {
		return imageboardDAO.getImageboardView(seq);
	}

	@Override
	public void imageboardDelete(String[] check) {
		Map<String,String[]> map = new HashMap<String, String[]>();
		map.put("array",check);
		imageboardDAO.imageboardDelete(map);
	}
	
}
