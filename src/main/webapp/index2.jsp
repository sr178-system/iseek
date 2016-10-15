<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="utf-8">
        <title>中国一川（澳门）国际有限公司--积分游戏、消费增值平台、员工内部薪酬结算、办公、游戏理财及娱乐休闲平台！</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->        
        <!--
        <link rel="stylesheet" href="http://www.17sucai.com/preview/140327/2014-06-05/azmind_3_xd/assets/css/reset.css">        
        <link rel="stylesheet" href="http://www.17sucai.com/preview/140327/2014-06-05/azmind_3_xd/assets/css/style.css">
        -->
        <link rel="stylesheet" href="css/style.css">
		<style type="text/css">
       		#vip_logo { width:1150px; margin:0 auto; padding-top:15px; color:#000; } 
			#vip_logo a { float:left; display:block; font-size:18px; }
			#vip_logo a.zhongwen { 
				
				margin-top:20px;
				margin-left:100px;			
				padding: 9px 20px;				
				color: #fff;
				font-weight: bold;
				border-radius: 6px;
				border: 1px solid #1382d3;
				background: #1681cf\0;
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#902895e7, endColorstr=#901681cf);
				background: -webkit-linear-gradient(top, #2895e7 0%,#1681cf 100%);
				background: -moz-linear-gradient(top, #2895e7 0%,#1681cf 100%);
				background: -o-linear-gradient(top, #2895e7 0%,#1681cf 100%);
				background: -ms-linear-gradient(top, #2895e7 0%,#1681cf 100%);
				background: linear-gradient(top, #2895e7 0%,#1681cf 100%);
				
			}
			#vip_logo a.yingwen { 
				
				margin-top:20px;
				margin-left:20px;
				padding: 9px 20px;	
				color: #fff;
				font-weight: bold;
				border-radius: 6px;
				border: 1px solid #1382d3;
				background: #1681cf\0;
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#902895e7, endColorstr=#901681cf);
				background: -webkit-linear-gradient(top, #2895e7 0%,#1681cf 100%);
				background: -moz-linear-gradient(top, #2895e7 0%,#1681cf 100%);
				background: -o-linear-gradient(top, #2895e7 0%,#1681cf 100%);
				background: -ms-linear-gradient(top, #2895e7 0%,#1681cf 100%);
				background: linear-gradient(top, #2895e7 0%,#1681cf 100%);
				
			}
			
			#vip_logo a.zhongwen:hover,#vip_logo a.yingwen:hover { 
							
				color: #fff;
				font-weight: bold;
				border-radius: 6px;
				border: 1px solid #1382d3;
				background: #1681cf\0;
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#901681cf, endColorstr=#902895e7);
				background: -webkit-linear-gradient(top, #1681cf 0%,#2895e7 100%);
				background: -moz-linear-gradient(top, #1681cf 0%,#2895e7 100%);
				background: -o-linear-gradient(top, #1681cf 0%,#2895e7 100%);
				background: -ms-linear-gradient(top, #1681cf 0%,#2895e7 100%);
				background: linear-gradient(top, #1681cf 0%,#2895e7 100%);
				
			}
			
			#vip_logo .vipLogo { opacity:0.5; filter:alpha(opacity=50);}
			#vip_logo dd { margin-left:280px; text-shadow:1px 1px 6px rgba(255,255,255,0.5); }
			#vip_logo .user_mana { font-size:30px; margin-bottom:15px; margin-top:30px; }
			#vip_logo .mana_info { font-size:20px; }
			
			
			/* web_bg 全屏背景
			--------------------------*/
			#web_bg { position:absolute; width:100%; height:100%; z-index:-1; }
			#web_bg li { display:none; }
			#web_bg li img { position:fixed; width:100%; height:100%; opacity:0.6; filter:alpha(opacity:60); }
			
        </style>        

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>
<SCRIPT>
<!--
function openwindow(url) {
   window.open(url,'new','toolbar=no,scrollbars=yes,width=800,height=850');
    }
//-->
</SCRIPT>
<script language="JavaScript"> 
 function checkdate(){
  if (Form.ygid.value=="") {      alert("请写入您的用户名!");      return false;    } 
  if (Form.pa.value=="") {      alert("请写入登录密码!");      return false;    }
  if (Form.validcode.value=="") {      alert("请写入验证码!");      return false;    }
  if (Form.sfz.value==0) {      alert("请您认真查看协议及声明，只有同意后才可以继续");      return false;    }
  return true;  }  
</script>


<script src="js/opacity.js"></script>
<script>
window.onload = function () {
	
	var oWebBg = document.getElementById('web_bg');	
	var aLi = oWebBg.getElementsByTagName('li');
	var aImg = oWebBg.getElementsByTagName('img');
	var timer = null;
	var num = 0;
	
	/////////定时器////////////////////////////////////
	autoPlay();
		
	clearInterval(timer);
	function autoPlay(){
		
		for(var i=0; i<aLi.length; i++){
			aLi[i].style.display = 'none';
			aImg[i].style.opacity = '0.7';
		}
		for(var i=0; i<aLi.length;i++){
			
			aLi[num].style.display = 'block';				
			opacity( aImg[num],2,100 );
			/*opacity( aLi[num],2,100,function () {
	
				setTimeout (function () {
					opacity( aLi[num],2,10 );
				},1000)
				
			});*/
		}
		num++;
		if(num==aLi.length)num=0;
		
	}
	
	timer = setInterval(function(){	
		autoPlay();
	},3500);
	/////////////////////////////////////////////
	
};
</script>


		<script language="javascript" src="js/ajax.js"></script>
		<SCRIPT type=text/javascript>
		    <!--
		    if(self!=top){top.location=self.location;} 
		    function ShowSoftKeyboard(obj)
		    {
		        if((typeof(CheckLoaded) == "function"))
		        {
		            password1 = obj;
		            showkeyboard();
		            Calc.password.value = '';
		        }
		        else
		        {
		            return false;
		        }
		    }
		    // -->
		    function logins(){
		    	if (Form.ygid.value=="") {      alert("请写入您的用户名!");      return false;    } 
		    	if (Form.pa.value=="") {      alert("请写入登录密码!");      return false;    }
		    	if (Form.validcode.value=="") {      alert("请写入验证码!");      return false;    }
		    	if (Form.sfz.value==0) {      alert("请您认真查看协议及声明，只有同意后才可以继续");      return false;    }
			    var ajaxobj = new Ajax();
			    ajaxobj.url="login?adminName="+Form.ygid.value+"&adminPassword="+Form.pa.value+"&randString="+Form.validcode.value;
			    ajaxobj.callback=function(){
				    var responseMsg = eval('(' + ajaxobj.gettext() + ')');
				    if(responseMsg.erroCodeNum!=0){
				    	if(responseMsg.erroCodeNum==1){
				    		alert("验证码过期");
				    	}else if(responseMsg.erroCodeNum==2){
				    		alert("验证码错误");
				    	}else if(responseMsg.erroCodeNum==3){
				    		alert("用户名或密码错误");
				    	}else if(responseMsg.erroCodeNum==4){
				    		location.href='updateuser';
				    	}
					    return;
				    }else{
				    	location.href='/manager';
				    }
			    }
			    ajaxobj.send();
		    }
    	</SCRIPT>


<!--web_bg 全屏背景-->
<ul id="web_bg">
    <li style="display:block;"><img src="images/vip_bg1.jpg" /></li>
    <li><img src="images/vip_bg2.jpg" /></li>    
</ul>






<!--logo-->
<dl id="vip_logo">
	<dt>
    	<a href="http://www.zgyce.com"><img src="images/vip_logo.png" alt="" width="250" class="vipLogo"></a>
    	<a href="index.asp" class="zhongwen">中文版</a>
        <a href="index_eng.asp" class="yingwen">English</a>
    </dt>
</dl>
<!--login区-->

<div class="login_area">

<div class="user_mana"><img src="images/mana_info.png" alt="" height="80"></div>
<div class="login">
<div class="tit">
<ul>
<li><a target="_blank" href="http://p.zgyce.com"><span>棋牌娱乐</a></span></li>
<li><a target="_blank" href="http://dy.zgyce.com"><span>一川影院</a></span></li>
<li><a target="_blank" href="http://yxgame.zgyce.com"><span>休闲游戏</span></a></li>
<li><a target="_blank" href="http://gw.zgyce.com"><span>一川导购</span></a></li>
<li><a target="_blank" href="http://hy.zgyce.com"><span>起点货源网</span></a></li>
<li><a target="_blank" href="http://yb.zgyce.com"><span>一币天下商城</span></a></li>
</ul>
</div>
<form method="POST" action="vip/chkinidex.asp" name="Form" onSubmit="return false">
<div class="left">
<ul style="padding-top:5px; margin-left:43px;">
<li><a target="_blank" href="http://www.zgyce.com"><img src="images/a01_y.png"></a></li>
<li><a href="reg"><img src="images/a02_y.png"></a></li>
</ul>
</div>
<div class="right">
<table width="385" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="bt" width="85" align="right">用户名：</td>
    <td width="300"><input type="text" name="ygid" value="<% if(request.getParameter("id")!=null){%><%=request.getParameter("id")%><%}%>" class="text"></td>
  </tr>
  <tr>
    <td class="bt" width="85" align="right">登录密码：</td>
    <td><input type="password" name="pa" class="text"></td>
  </tr>
  <tr>
    <td class="bt" width="85" align="right">验证码：</td>
    <td><input type="text" name="validcode" class="text2"><div class="check"><img src="VerifyCode.jsp" height="18" title="点击刷新" onclick="this.src='VerifyCode.jsp?'+Math.random()"></div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><font size="2" color="#FF0000">
		<span style="font-size: 11pt"> <select size="1" name="sfz">
		<option selected value="0">==请选择是否同意协议及声明==</option>
		<option value="0">不同意！</option>
		<option value="1">同意协议及声明，自愿参与！</option>
		</select></span></font><a href="javascript:openwindow('sfz.html?id=')" class="xy">查看协议及声明</a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" class="submit" onClick="logins();" value="提交登陆"></td>
  </tr>
</table>
</form>
</div>
</div>

</div>

</body>
</html>

