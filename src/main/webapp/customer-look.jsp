<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>查看课程信息</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript">
        $(function () {
            $.ajax({
                type: 'post',
                url: 'three/getOneInfo',
                data: {"sid":${param.sid}},
                dataType: 'json',
                success: function (rs) {
                    $(rs.cous).each(function (index, cus) {
                        var tr = "<tr class='datatr' align='center' bgcolor='#FFFFFF'onMouseMove='javascript:this.bgColor='#FCFDEE';' onMouseOut='javascript:this.bgColor='#FFFFFF';' height='22' >\n" +
                            "<td><input name='id' type='checkbox' id='id' value='" + cus.cid + "'class='ck'></td>\n" +
                            "        <td>" + cus.cname + "</td>\n" +
                            "        <td >" + cus.dur+ "</td>\n" +
                            "        <td><a href=\"${pageContext.request.contextPath}/three/csDel?cid=" + cus.cid +","+${param.sid}+ "\">移除</a></td>" +
                            "        <td><a href=\"${pageContext.request.contextPath}/logs.jsp?cid=" + cus.cid +","+${param.sid}+ "\">查看上课记录</a></td>" +
                            "    </tr>";

                        $("#tr2").after(tr);
                    });
        }
			})
		})
	</script>

        </head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
<tr>
 <td height="26" background="skin/images/newlinebg3.gif">
  <table width="58%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td >
    当前位置:课程信息>>查看课程信息
 </td>
 </tr>
</table>
</td>
</tr>
</table>
<%--添加课程--%>
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
	<tr>
		<td height="26" background="skin/images/newlinebg3.gif">
			<table width="58%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<input type='button' class="coolbg np" onClick="location='/course-add.jsp?sid='+${param.sid};" value='添加课程'/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<form name="form2">

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr align="center" bgcolor="#FAFAF1" height="22" id="tr2">
		<td width="10%">序号</td>
		<td width="20%">课程名</td>
		<td width="30%">上课时间</td>
		<td width="10%">操作</td>
		<td width="10%">查看</td>
	</tr>


<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<a href="/index.jsp" class="coolbg">返回</a>
</td>
</tr>
</table>

</form>
  

</body>
</html>