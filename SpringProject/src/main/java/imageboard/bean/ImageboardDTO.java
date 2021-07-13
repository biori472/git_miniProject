package imageboard.bean;

import java.sql.Date;

import lombok.Data;

@Data
public class ImageboardDTO {
	/*
	seq
	imageId--상품코드 /imageName--상품명 / imagePrice--단가 
	imageQty--개수 / imageContent-내용 / image1--파일선택이미지 / logtime--등록시간
	*/
	private int seq;
	private String imageId, imageName, imageContent,image1 ;
	private int imagePrice, imageQty;
	private Date logtime;
	
	private String image2;
	
	
	
	
}
