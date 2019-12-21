<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>查看突击考勤记录</title>
<link rel="stylesheet" type="text/css" href="skin/css/base.css">
	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript">
        $(function () {
            $.ajax({
                type: 'post',
                url: 'three/getOnelog',
                data: {"cid":"${param.cid}"},
                dataType: 'json',
                success: function (rs) {
                    $(rs).each(function (index, cus) {
                        var date = new Date(cus.day);
                        var newtime = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
                        var biaoxian=null;
                        if (cus.status==0){
                            biaoxian="正常";
                        }else if (cus.status==1) {
                            biaoxian="请假";
						}else if (cus.status==2) {
                            biaoxian="迟到";
                        }else{
                            biaoxian="旷课";
						}

                        var tr = "<tr class='datatr' align='center' bgcolor='#FFFFFF'onMouseMove='javascript:this.bgColor='#FCFDEE';' onMouseOut='javascript:this.bgColor='#FFFFFF';' height='22' >\n" +
                            "        <td>" + cus.logid + "</td>\n" +
                            "        <td>" +newtime + "</td>\n" +
                            "        <td >" + cus.stu.sname+ "</td>\n" +
                            "        <td >" + cus.cou.cname+ "</td>\n" +
                            "        <td >" + biaoxian+ "</td>\n" +
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
    当前位置:突击考勤记录信息>>查看突击考勤记录
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
		<td width="20%">记录时间</td>
		<td width="15%">学生名</td>
		<td width="15%">课程名</td>
		<td width="10%">表现</td>
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