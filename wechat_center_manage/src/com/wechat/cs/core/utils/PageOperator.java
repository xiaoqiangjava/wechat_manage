package com.wechat.cs.core.utils;

/**
 * 通用分页操作类（有些情况可能不通用）
 * @author salcon
 * @date 2013-12-30
 *
 */
public class PageOperator{
	
public String getPager(String url,int sum,int currnum,int length, String condtion,String language) throws Exception{
       
         String showsum = "总共";
         String showitem = "条数据";
         String showfirstpage = "首页";
         String showuppage    = "上一页";
         String shownextpage  = "下一页";
         String showlastpage  = "末页";
         String showjump     ="跳转到";
         String showselect   = "请选择";
         String showtotal    = "共";
         String showpage     = "页";

         String pagerinfo = "";
         StringBuffer sbinfo = new StringBuffer();

         int pagenum = 0;
         
         if(sum%length == 0){
               
              pagenum = sum/length;
             
         }else{
             pagenum = sum/length +1;
         }
         
        String first = "";
         if(url.indexOf("?")!=-1){
             first ="&";
         }else{
             first ="?";
         }
         String pageUrl = "";
         sbinfo.append(showsum+"<font color=\"red\">"+sum+"</font>"+showitem+"   ");
        
         String firstUrl = url+first+"currpage="+1+"&"+condtion; 
         sbinfo.append("<a href=\""+firstUrl+"\">"+showfirstpage+"</a>  ");
         if(1==currnum){ 
             
             sbinfo.append(showuppage);
             
         }else{
             
             pageUrl = url+first+"currpage="+(currnum-1)+"&"+condtion;
             sbinfo.append("<a stlye=\"text-decoration: none;\" href=\""+pageUrl+"\" >"+showuppage+"</a>");
         }
    
         String tempstr = "";
         if(pagenum<10){
             for (int i = 1; i < pagenum+1; i++)
             {   
                 pageUrl = url+first+"currpage="+i+"&"+condtion;
                 if(i==currnum){
                     
                     tempstr = "<a stlye=\"text-decoration: none;\" href=\""+pageUrl+"\" ><b><font color=\"red\">"+i+"</font></b></a> ";
                 } else{
                     tempstr = "<a stlye=\"text-decoration: none;\" href=\""+pageUrl+"\" >"+i+"</a> ";
                 }
                sbinfo.append(tempstr);
             }
         }else if(pagenum>=10){
          
//            sbinfo.append(". . . ");
        	
        	int min = currnum % 10 > 0?(currnum-currnum%10)+1:currnum-9;
    		int max = currnum % 10 > 0?(((currnum-currnum%10)+11)>pagenum?pagenum+1:((currnum-currnum%10)+11)):
    			(currnum+1)>pagenum?pagenum+1:(currnum+1);
            for (int i = min; i < max; i++)
            {   
                pageUrl = url+first+"currpage="+i+"&"+condtion;
                if(i==currnum){
                    
                    tempstr = "<a stlye=\"text-decoration: none;\" href=\""+pageUrl+"\" ><b><font color=\"red\">"+i+"</font></b></a> ";
                } else{
                    tempstr = "<a stlye=\"text-decoration: none;\" href=\""+pageUrl+"\" >"+i+"</a> ";
                }
                sbinfo.append(tempstr);
            }
            
        }else{
        }
        
        if(currnum == pagenum){
               
             sbinfo.append(shownextpage); 
           
        }else{
             pageUrl = url+first+"currpage="+(currnum+1)+"&"+condtion;
             sbinfo.append("<a href=\""+pageUrl+"\">"+shownextpage+"</a>");
         
        }  
         
        String endUrl = url+first+"currpage="+pagenum+"&"+condtion;
        sbinfo.append(" <a href=\""+endUrl+"\">"+showlastpage+"</a>   "); 
        
        String  selecturl = url+first+condtion;
        sbinfo.append(showjump+"<select onchange=\"window.location.href='"+selecturl+"&currpage='+this.value;\">");
        
        for (int i = 1; i < pagenum+1; i++)   
        {
        	if(i==currnum){
        		sbinfo.append("<option value=\""+i+"\" selected>"+i+"</option>");
        	}else{
        		sbinfo.append("<option value=\""+i+"\">"+i+"</option>");
        	}
            
        }
        sbinfo.append("</select>");
        sbinfo.append("  "+showtotal+"<font color=\"red\">"+pagenum+"</font>"+showpage); 
        pagerinfo = sbinfo.toString();
         
        return pagerinfo;
     } 
     
     /**
      * 获取分页字符串
      * 如：首页 上一页 1 2 3 ... 7 8 9 10 下一页 末页
      * @param url
      * @param sum
      * @param currnum
      * @param length
      * @param condtion
      * @return
      * @throws Exception
      */
     public String getPager(String url,int sum,int currnum,int length, String condtion) throws Exception{
         
         return getPager(url, sum,currnum,length,  condtion, null);
     }
     
     /**
      * 重写获取分页字符串方法，少了一个条件
      * 如：首页 上一页 1 2 3 ... 7 8 9 10 下一页 末页
      * @param url
      * @param sum
      * @param currnum
      * @param length
      * @return
      * @throws Exception
      */
     public String getPager(String url,int sum,int currnum,int length) throws Exception{
         
         return getPager(url, sum,currnum,length,  "", null);
     }

     
     //前台分页
     public String getFrontPager(String url,int sum,int currnum,int length) throws Exception{
         return getFrontPager(url, sum,currnum,length,  "", null);
     }	
     
     // 前台分页
     public String getFrontPager(String url,int sum,int currnum,int length, String condtion,String language) throws Exception{
         
         String showuppage    = "上一页";
         String shownextpage  = "下一页";

         String pagerinfo = "";
         StringBuffer sbinfo = new StringBuffer();

         int pagenum = 0;
         
         if(sum%length == 0){
               
              pagenum = sum/length;
             
         }else{
             pagenum = sum/length +1;
         }
         
        String first = "";
         if(url.indexOf("?")!=-1){
             first ="&";
         }else{
             first ="?";
         }
         String pageUrl = "";
        //上一页
         if(1==currnum){ 
//             sbinfo.append("<span>"+showuppage+"</span>");
         }else{
             pageUrl = url+first+"currpage="+(currnum-1)+"&"+condtion;
             sbinfo.append("<a class=\"ui-btn ui-btn-inline \" data-ajax=\"false\" href=\""+pageUrl+"\" >"+showuppage+"</a>");
         }
         sbinfo.append(" &nbsp;&nbsp;&nbsp; ");
        //下一页
        if(currnum == pagenum){
//             sbinfo.append("<span>"+shownextpage+"</span>"); 
        }else{
             pageUrl = url+first+"currpage="+(currnum+1)+"&"+condtion;
             sbinfo.append("<a class=\"ui-btn ui-btn-inline \" data-ajax=\"false\" href=\""+pageUrl+"\">"+shownextpage+"</a>");
        }  
        pagerinfo = sbinfo.toString();
         
        return pagerinfo;
     } 

     /**
      * <span class="page_nav_area">
	        <a href="javascript:void(0);" class="btn page_first">首页</a>
	        <a href="javascript:void(0);" class="btn page_prev"><i class="arrow"></i></a>
	            <span class="page_num">
	                <label>1</label>
	                <span class="num_gap">/</span>
	                <label>2</label>
	            </span>
	        <a href="javascript:void(0);" class="btn page_next"><i class="arrow"></i></a>
	        <a href="javascript:void(0);" class="btn page_last">末页</a>            
	    </span>
	    <span class="goto_area">
	        <input type="text" />
	        <a href="javascript:void(0);" class="btn page_go">跳转</a>
	    </span>
      **/
     //微信公众平台 分页样式
     public String getMPager(String url,int sum,int currnum,int length, String condtion) throws Exception{
    	 
    	 String pagerinfo = "";
    	 StringBuffer sbinfo = new StringBuffer();
    	 sbinfo.append("<span class=\"page_nav_area\">");
    	 
    	 int pagenum = 0;
    	 if(sum%length == 0){ pagenum = sum/length;}else{pagenum = sum/length +1; } //--总页数
    	 String first = "";
    	 if(url.indexOf("?")!=-1){ first ="&"; }else{first ="?";}
    	 String pageUrl = "";
    	 //首页，上页
    	 if(1==currnum){
    		 //首页
             sbinfo.append("<a href=\"javascript:void(0);\" class=\"btn page_first\" style='display:none'>首页</a>");
             //上页
             sbinfo.append("<a href=\"javascript:void(0);\" class=\"btn page_prev\" style='display:none'><i class=\"arrow\"></i></a>");
    	 }else{
    		 if(pagenum >= 3){
    			 pageUrl = url+first+"pageNo=1&"+condtion;
    			 sbinfo.append("<a href=\""+pageUrl+"\" class=\"btn page_first\" >首页</a>&nbsp;"); 
    		 }
    		 pageUrl = url+first+"pageNo="+(currnum-1)+"&"+condtion;
    		 sbinfo.append("<a href=\""+pageUrl+"\" class=\"btn page_prev\" ><i class=\"arrow\"></i></a>");
    	 }
    	 //当前页/总页数
    	 if(pagenum != 1){
    		 sbinfo.append("&nbsp;<span class=\"page_num\"> "+
 			 		"<label>"+currnum+"</label>"+
 			 		"<span class=\"num_gap\">/</span>"+
 			 		"<label>"+pagenum+"</label>"+
 			 		"</span>&nbsp;");
    	 }
    	 //下页，末页
    	 if(currnum == pagenum){
    		 //下页
    		 sbinfo.append("<a href=\"javascript:void(0);\" class=\"btn page_next\" style='display:none'><i class=\"arrow\"></i></a>"); 
    		 //末页
             sbinfo.append("<a href=\"javascript:void(0);\" class=\"btn page_last\" style='display:none'>末页</a>"); 
    	 }else{
    		 pageUrl = url+first+"pageNo="+(currnum+1)+"&"+condtion;
    		 sbinfo.append("<a href=\""+pageUrl+"\" class=\"btn page_next\" ><i class=\"arrow\"></i></a>&nbsp;");
    		 
    		 if(pagenum >= 3){
    			 pageUrl = url+first+"pageNo="+pagenum+"&"+condtion;
    			 sbinfo.append("<a href=\""+pageUrl+"\" class=\"btn page_last\" >末页</a>"); 
    		 }
    	 }  
    	 sbinfo.append("</span>");
    	 pagerinfo = sbinfo.toString();
    	 
    	 return pagerinfo;
     } 
     
}