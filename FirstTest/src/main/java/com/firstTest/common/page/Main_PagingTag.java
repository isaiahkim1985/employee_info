package com.firstTest.common.page;

import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import javax.servlet.jsp.JspException;

public class Main_PagingTag extends TagSupport {
	
	private static final long serialVersionUID = 1L;

	
	private int page = 1;
	private int total = 1;
	private int list_size = 10;
	private int page_size = 10;
	
	@Override
	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().println(getPaging());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	
	public void setPage(int page){
		this.page = page;
	}
	
	public void setTotal(int total){
		this.total = total;
	}
	
	public void setList_size(int list_size) {
		this.list_size = list_size;
	}
	
	public void setPage_size(int page_size) {
		this.page_size = page_size;
	}
	
	public String getPaging() {
		String ret = "";
		
		if(page<1)
			page = 1;
		if(total < 1)
			return "";
		
		// page�� 1�������̰� page_size�� 2�̸�, currentFirst�� 1 
		int currentFirst = ((page-1)/page_size) * page_size + 1;
		
		// currentlast�� 2
		int currentlast = ((page-1)/page_size) * page_size + page_size;
		
		// nextFirst�� 3
		int nextFirst = (((page-1)/page_size)+1) * page_size + 1;
		
		// prevLast�� 0
		int prevLast = (((page-1)/page_size)-1) * page_size + 1;
		
		int lastPage = 1;
		lastPage = total / list_size;
		
		/* lastPage(�� ��������)�� total�� 11�̰� list_size�� 10�̸� 1�� ������.
		 * �׷��� �� ������ ���� ������ �������� ������ ������ ���ڵ带 �����
		 * �������� �ʿ��ϴٴ� �ǹ�. */
		if(total%list_size != 0) 
			lastPage = lastPage + 1;
		
		// currentlast�� lastPage���� ũ�� ������ �������� ����
		currentlast = (currentlast>lastPage)?lastPage:currentlast;
		
		ret += " <div class='paginate'> ";
		
		if(page > 1){
			ret += " <a href=\"javascript:goPage('1')\"><span><img src='/resources/common/btn_paginate_first.gif' alt=''/></span></a>";
		} else {
			ret += " <span><img src='/resources/common/btn_paginate_first.gif' alt=''/></span> ";
		}
		
		if(prevLast > 0){
			ret += " <a href=\"javascript:goPage('"+prevLast+"');\"><span><img src='/resources/common/btn_paginate_prev.gif' alt=''/></span></a> ";
		} else {
			ret += " <span><img src='/resources/common/btn_paginate_prev.gif' alt=''/></span> ";
		}
		
		for (int j = currentFirst; j < currentFirst+page_size && j<=lastPage; j++) {
			if(j <= currentlast) {
				if(j == page){
					ret += " <a href='#' class='on textAn'>"+j+"</a> ";
				} else {
					ret += " <a href=\"javascript:goPage('"+j+"');\" class='textAn'>"+j+"</a> ";
				}
			}
		}
		
		if(nextFirst <= lastPage) {
			ret += " <a href=\"javascript:goPage('"+nextFirst+"')\"><span><img src='/resources/common/btn_paginate_next.gif' alt=''/></span></a> ";
		} else {
			ret += " <span><img src='/resources/common/btn_paginate_next.gif' alt=''/></span> ";
		}
		
		if(page<lastPage){
			ret += " <a href=\"javascript:goPage('"+lastPage+"')\"><span><img src='/resources/common/btn_paginate_last.gif' alt=''/></span></a> ";
		} else {
			ret += " <span><img src='/resources/common/btn_paginate_last.gif' alt=''/></span> ";
		}
		ret += " </div> ";
		return ret;
	}
	
	

}
