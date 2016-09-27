package com.firstTest.common.page;

import com.firstTest.common.util.Main_Util;
import com.firstTest.common.vo.Main_CommonVO;

public class Main_Paging {
	
	public static void setPage(Main_CommonVO cvo){
		int page = Main_Util.nvl(cvo.getPage(), 1);
		int pageSize = Main_Util.nvl(cvo.getPageSize(), 10);
		
		if(cvo.getPage()==null){
			cvo.setPage(page+"");
		}
		if(cvo.getPageSize()==null){
			cvo.setPageSize(pageSize+"");
		}
		
		int start_row = (page-1)*pageSize + 1;
		int end_row = (page-1)*pageSize+pageSize;
		
		cvo.setStart_row(start_row+"");
		cvo.setEnd_row(end_row+"");
	}

}
