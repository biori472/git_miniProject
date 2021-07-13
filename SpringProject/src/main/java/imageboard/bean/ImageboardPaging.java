package imageboard.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ImageboardPaging {
	
	private int currentPage;//현재페이지
	private int pageBlock;//한페이지에 보여줄 페이지 블럭수
	private int pageSize;//3개씩 끊어 출력원함
	private int totalA;//게시글 전체수 
	private StringBuffer pagingHTML;
	
public void makePagingHTML() {
		//버퍼생성
		pagingHTML = new StringBuffer();
		
		//총 페이지 수 ? 토탈게시글수+한페이지출력코드개수-1 / 3
		int totalP = (totalA + pageSize-1)/pageSize ; 
		
		//한 페이지에 보여줄 시작 및 끝번호
		int startPage = (currentPage-1) / pageBlock * pageBlock +1;
		
		//
		int endPage = startPage + pageBlock -1;
		
		if(endPage > totalP) endPage=totalP;
		
		if(startPage>pageBlock)
			//pagingHTML.append("<a id='paging' href='imageboardList.jsp?pg="+(startPage-1)+"'>[이전]</a>");
			pagingHTML.append("<span id='paging' onclick='imageboardPaging("+(startPage-1)+")'>[이전]</span>");
		
		for(int i=startPage; i<=endPage; i++) {
			
			if(i==currentPage) {
				//pagingHTML.append("[  <a id='currentPaging' href='imageboardList.jsp?pg="+i+"'>"+i+"</a>  ]");
				pagingHTML.append("<span id='currentPaging' name='currPageValue' onclick='imageboardPaging("+i+")'>"+i+"</span>");
			}else {
				//pagingHTML.append("[  <a id='paging' href='imageboardList.jsp?pg="+i+"'>"+i+"</a>  ] ");
				pagingHTML.append("<span id='paging' name='notCurrPageValue' onclick='imageboardPaging("+i+")'>"+i+"</span>");
				}
		}//for
		
		if(endPage< totalP)
			//pagingHTML.append("<a id='paging' href='imageboardList.jsp?pg="+(endPage+1)+"'>[다음]</a>");
			pagingHTML.append("<span id='paging' name='back' onclick='imageboardPaging("+(endPage+1)+")'>[다음]</span>");


	}
	
}
