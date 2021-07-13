package imageboard.dao;

import java.util.List;
import java.util.Map;

import imageboard.bean.ImageboardDTO;

public interface ImageboardDAO {

	public void insert(ImageboardDTO imageboardDTO);

	public List<ImageboardDTO> getImageboardList(Map<String, String> map);

	public ImageboardDTO getImageboardView(String seq);

	public int getTotalA();

	public void imageboardDelete(Map<String, String[]> map);

}
