package com.sr178.iseek.common.context;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;

import com.sr178.iseek.common.utils.Tools;





public class PageTag implements Tag { 

	private PageContext pageContext;
	private Tag parent;
	private String urls;
	private String para1;
	private String value1;
	private String para2;
	private String value2;
	private String para3;
	private String value3;
	private String para4;
	private String value4;
	private String datePara1;
	private Date dateValue1;
	private String datePara2;
	private Date dateValue2;
	
	private String paraStr;
	
    public PageTag() {
    	super();
    }
	    
   
	public void setPageContext(final PageContext pageContext) {
    	this.pageContext = pageContext;
    }
    
    public void setParent(Tag parent) {
    	this.parent = parent;
    }
    public int doStartTag() throws JspTagException {
    	return SKIP_BODY;
    }
    
    private static final String FIRST_PAGE_TAG = "FIRST_PAGE_TAG";
    private static final String UP_PAGE_TAG = "UP_PAGE_TAG";
    private static final String NEXT_PAGE_TAG = "NEXT_PAGE_TAG";
    private static final String END_PAGE_TAG = "END_PAGE_TAG";
    
    private static final String CURRENT_PAGE_NUM_TAG="CURRENT_PAGE_NUM_TAG";
    private static final String ALL_PAGE_NUM_TAG="ALL_PAGE_NUM_TAG";
    private static final String ALL_PAGE_SIZE_NUM_TAG="ALL_PAGE_SIZE_NUM_TAG";
    private static final String PER_PAGE_SIZE_NUM_TAG = "PER_PAGE_SIZE_NUM_TAG";
    
    
    private static final String TAG_FORMAT = "<div class=\"col-xs-2\"><p class=\"text-left\" style=\"margin:0;\">共"+ALL_PAGE_SIZE_NUM_TAG+"条记录，"+CURRENT_PAGE_NUM_TAG+"/"+ALL_PAGE_NUM_TAG+" 页</p></div><div class=\"col-xs-10\"><p class=\"text-right\" style=\"margin:0;\">"+FIRST_PAGE_TAG+""+UP_PAGE_TAG+""+NEXT_PAGE_TAG+""+END_PAGE_TAG+"跳转到第<input id='toPageInputText' type='text' class='form-control' name='toPage' value='"+CURRENT_PAGE_NUM_TAG+"' onkeydown='if(event.keyCode==13)document.getElementById(&quot;pageGo&quot;).click()' />页<a type='button' class='btn btn-default' href='javascript:gotoPage(document.getElementById('toPageInputText').value);'>确定</a></p></div>";
    
    
    public int doEndTag() throws JspTagException {
    	try {
    		long totalPage = ((Long) pageContext.getRequest().getAttribute("totalPage")).longValue() - 1;
    		long totalSize = ((Long) pageContext.getRequest().getAttribute("totalSize")).longValue();
    		int currentPage = ((Integer) pageContext.getRequest().getAttribute("toPage")).intValue();
      		int pageSize = ((Integer) pageContext.getRequest().getAttribute("pageSize")).intValue();
        	String sessionID;
        	if (pageContext.getRequest().getAttribute("sessionID") == null) {
        		sessionID = "";
        	} else {
        		sessionID = (String) pageContext.getRequest().getAttribute("sessionID");
        	}
    		
    		String url = "";
	    	String requestAldUrl = "";
	    	if (pageContext.getRequest().getAttribute("requestAldUrl") != null) {
	    		requestAldUrl = (String) pageContext.getRequest().getAttribute("requestAldUrl");
	    	}
    		if (Tools.isEmpty(urls)) {
    	    		url = requestAldUrl;
    		} else {   	    	
    	    	if (urls.indexOf("?") == 0) {
    	    		url = requestAldUrl + urls;
    	    	} else {
    	    		url = urls;
    	    	}
    		}
    		//url已有参数个数，当添加参数时，如果已有参数个数为0，则在参数前加“？”，否则加&
    		int paraNum = 0;
    		
    		if (url.indexOf("?") != -1) {
    			paraNum++;
    		}
    		//因为参数太多，统一写到这里
    		if (!Tools.isEmpty(paraStr)) {
				String[] paraArr = paraStr.split(",");
				if (paraArr != null && paraArr.length > 0) {
					for (int i = 0; i < paraArr.length; i=i+2) {
						String para = paraArr[i];
						String value = "";
						//最后一个参数没有相应值
						if ((i+1) < paraArr.length) {
							value = URLEncoder.encode(paraArr[i+1],"UTF-8");
						}
						if (!Tools.isEmpty(para) && paraNum == 0 && !Tools.isEmpty(value)) {
							url = url + "?" + para + "=" + value;
							paraNum++;
						} else if (!Tools.isEmpty(para) && paraNum > 0 && !Tools.isEmpty(value)) {
							url = url + "&amp;" + para + "=" + value;
							paraNum++;
						}
					}	
				}
			}
    		
    		if (!Tools.isEmpty(para1) && paraNum == 0 && !Tools.isEmpty(value1)) {
    			url = url + "?" + para1 + "=" + value1;
    			paraNum++;
    		} else if (!Tools.isEmpty(para1) && paraNum > 0 && !Tools.isEmpty(value1)) {
    			url = url + "&amp;" + para1 + "=" + value1;
    			paraNum++;
    		}
    		
    		if (!Tools.isEmpty(para2) && paraNum > 0 && !Tools.isEmpty(value2)) {
    			url = url + "&amp;" + para2 + "=" + value2;
    			paraNum++;
    		} else if (!Tools.isEmpty(para2) && paraNum == 0 && !Tools.isEmpty(value2)) {
    			url = url + "?" + para2 + "=" + value2;
    			paraNum++;
    		}
    		
    		if (!Tools.isEmpty(para3) && paraNum > 0 && !Tools.isEmpty(value3)) {
    			url = url + "&amp;" + para3 + "=" + value3;
    			paraNum++;
    		} else if (!Tools.isEmpty(para3) && paraNum == 0 && !Tools.isEmpty(value3)) {
    			url = url + "?" + para3 + "=" + value3;
    			paraNum++;
    		}
    		
    		if (!Tools.isEmpty(para4) && paraNum > 0 && !Tools.isEmpty(value4)) {
    			url = url + "&amp;" + para4 + "=" + value4;
    			paraNum++;
    		} else if (!Tools.isEmpty(para4) && paraNum == 0 && !Tools.isEmpty(value4)) {
    			url = url + "?" + para4 + "=" + value4;
    			paraNum++;
    		}
    		
    		String dateValue1Str = "";
    		if (dateValue1 != null) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				dateValue1Str = sdf.format(dateValue1);
			}
    		if (!Tools.isEmpty(datePara1) && paraNum > 0 && !Tools.isEmpty(dateValue1Str)) {
    			url = url + "&amp;" + datePara1 + "=" + dateValue1Str;
    			paraNum++;
    		} else if (!Tools.isEmpty(datePara1) && paraNum == 0 && !Tools.isEmpty(dateValue1Str)) {
    			url = url + "?" + datePara1 + "=" + dateValue1Str;
    			paraNum++;
    		}
    		String dateValue2Str = "";
    		if (dateValue2 != null) {
    			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    			dateValue2Str = sdf.format(dateValue2);
    		}
    		if (!Tools.isEmpty(datePara2) && paraNum > 0 && !Tools.isEmpty(dateValue2Str)) {
    			url = url + "&amp;" + datePara2 + "=" + dateValue2Str;
    			paraNum++;
    		} else if (!Tools.isEmpty(datePara2) && paraNum == 0 && !Tools.isEmpty(dateValue2Str)) {
    			url = url + "?" + datePara2 + "=" + dateValue2Str;
    			paraNum++;
    		}
        	//struts国际化
//    		ActionSupport actionSupport = new ActionSupport();
        	String nextPageText = "下一页";//actionSupport.getText("nextPageText");
        	String upPageText = "上一页";//actionSupport.getText("upPageText");
        	
        	String emptyLinknextPageText =  "<a  type='button' class='btn btn-default' >" + nextPageText + "</a>";
        	String emptyLinkupPageText =  "<a  type='button' class='btn btn-default' >" + upPageText + "</a>";
        	//只有下一页
        	String nextStr = "";
        	String upString = "";
        	String firstStr = "";
        	String endStr = "";
        	if (currentPage == 0 && totalPage > 0) {
        		if (paraNum <= 0) {
        			nextStr = "<a  type='button' class='btn btn-default' href='" + Tools.UrlFormat(url + "?toPage=" + (currentPage + 1), sessionID) + "'>" + nextPageText + "</a>";
        			upString = emptyLinkupPageText;
        		} else {
        			nextStr =  "<a type='button' class='btn btn-default' href='" + Tools.UrlFormat(url + "&amp;toPage=" + (currentPage + 1), sessionID) + "'>" + nextPageText + "</a>";	
        			upString = emptyLinkupPageText;
        		}
        	} else if ((currentPage == 0) && (totalPage <= 0)) {
        		nextStr = emptyLinknextPageText;
        		upString = emptyLinkupPageText;
        	} else if ((currentPage > 0) && (totalPage > currentPage)) {
        		if (paraNum <= 0) {
        			nextStr = "<a type='button' class='btn btn-default' href='" + Tools.UrlFormat(url + "?toPage=" + (currentPage + 1), sessionID) + "'>" + nextPageText + "</a>";
        			upString = "<a type='button' class='btn btn-default' href='" + Tools.UrlFormat(url + "?toPage=" + (currentPage - 1), sessionID) + "'>" + upPageText + "</a>";
        		} else {
        			nextStr = "<a type='button' class='btn btn-default' href='" + Tools.UrlFormat(url + "&amp;toPage=" + (currentPage + 1), sessionID) + "'>" + nextPageText + "</a>";
        			upString = "<a type='button' class='btn btn-default' href='" + Tools.UrlFormat(url + "&amp;toPage=" + (currentPage - 1), sessionID) + "'>" + upPageText + "</a>";
        		}
        	} else if ((currentPage > 0) && (totalPage <= currentPage)) {
        		if (paraNum <= 0) {        
        			nextStr = emptyLinknextPageText;
        			upString = "<a type='button' class='btn btn-default' href='" + Tools.UrlFormat(url + "?toPage=" + (currentPage - 1), sessionID) + "'>" + upPageText + "</a>";
        		} else {
        			nextStr = emptyLinknextPageText;
        			upString = "<a type='button' class='btn btn-default' href='" + Tools.UrlFormat(url + "&amp;toPage=" + (currentPage - 1), sessionID) + "'>" + upPageText + "</a>";
        		}
        	}
        	String firstPageText = "首页";//actionSupport.getText("FirstPageText");
        	String endPageText = "尾页";//actionSupport.getText("EndPageText");
        	if(paraNum <= 0){
        			firstStr = "<a type='button' class='btn btn-default' href='" + Tools.UrlFormat(url + "?toPage=" + 0, sessionID) + "'>"+firstPageText+"</a>";
        			endStr = "<a type='button' class='btn btn-default' href='" + Tools.UrlFormat(url + "?toPage=" + (totalPage), sessionID) + "'>"+endPageText+"</a>";
        		}else{
        			firstStr = "<a type='button' class='btn btn-default' href='" + Tools.UrlFormat(url + "&amp;toPage=" + 0, sessionID) + "'>"+firstPageText+"</a>";
        			endStr = "<a type='button' class='btn btn-default' href='" + Tools.UrlFormat(url + "&amp;toPage=" + (totalPage), sessionID) + "'>"+endPageText+"</a>";
        	}
        	
        	String endUrlStr="";
        	if(paraNum<=0){
        		endUrlStr = url+"?";
        	}else{
        		endUrlStr = url+"&";
        	}
        	
        	String result = TAG_FORMAT.replaceAll(FIRST_PAGE_TAG, firstStr)
        			.replaceAll(END_PAGE_TAG, endStr)
        			.replaceAll(UP_PAGE_TAG, upString)
        			.replaceAll(NEXT_PAGE_TAG, nextStr)
        			.replaceAll(CURRENT_PAGE_NUM_TAG, (currentPage+1)+"")
        			.replaceAll(ALL_PAGE_NUM_TAG, (totalPage+1)+"")
        			.replaceAll(ALL_PAGE_SIZE_NUM_TAG, totalSize+"")
        			.replaceAll(PER_PAGE_SIZE_NUM_TAG, pageSize+"")
        			;
        	
        	result=result+"<script>function gotoPage(pageNum){location.href='"+endUrlStr.replaceAll("&amp;", "&")+"toPage='+(pageNum-1)+'';}</script>";
        	pageContext.getOut().write(result);
	} catch (IOException e) {
    		throw new JspTagException("IO Error" + e.getMessage());
    	}
    	return EVAL_PAGE;
    }
    
    public void release() {
    	
    }
	public Tag getParent() {
		return parent;
	}

	

	public void setPara1(String para1) {
		this.para1 = para1;
	}


	public void setValue1(String value1) {
		this.value1 = value1;
	}


	public void setPara2(String para2) {
		this.para2 = para2;
	}


	public void setValue2(String value2) {
		this.value2 = value2;
	}


	public void setPara3(String para3) {
		this.para3 = para3;
	}


	public void setValue3(String value3) {
		this.value3 = value3;
	}


	public void setUrls(String urls) {
		this.urls = urls;
	}


	public void setDatePara1(String datePara1) {
		this.datePara1 = datePara1;
	}


	public String getDatePara1() {
		return datePara1;
	}


	public void setDateValue1(Date dateValue1) {
		this.dateValue1 = dateValue1;
	}


	public Date getDateValue1() {
		return dateValue1;
	}


	public void setDatePara2(String datePara2) {
		this.datePara2 = datePara2;
	}


	public void setDateValue2(Date dateValue2) {
		this.dateValue2 = dateValue2;
	}


	public void setPara4(String para4) {
		this.para4 = para4;
	}


	public String getPara4() {
		return para4;
	}


	public void setValue4(String value4) {
		this.value4 = value4;
	}


	public String getValue4() {
		return value4;
	}

	/**
	 * @param paraStr the paraStr to set
	 */
	public void setParaStr(String paraStr) {
		this.paraStr = paraStr;
	}
}
