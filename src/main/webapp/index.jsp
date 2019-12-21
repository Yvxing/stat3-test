<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>学生信息管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/skin/css/base.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>


    <script type="application/javascript">
        $(function () {
            search(1);
        });

        function search(obj) {
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/three/showInfo',
                data: {
                    "currentpage": obj,
                    "keyCode": "%" + $("#info").val() + "%",
                },
                dataType: 'json',
                success: function (rs) {
                    // 给表单添加数据之前去删除表单数据 rs我们pageInfo
                    $(".datatr").remove();
                    $(rs.list).each(function (index, cus) {
                        var date = new Date(cus.intime);
                        var date2 = new Date(cus.outtime);
                        var newtime = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
                        var newtime2 = date2.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();

                        var lixiao=null;
                        if (cus.orin==0){
                            lixiao="未毕业";
                        }else{
                            lixiao="已毕业";
                        }

                        var tr = "<tr class='datatr' align='center' bgcolor='#FFFFFF'onMouseMove='javascript:this.bgColor='#FCFDEE';' onMouseOut='javascript:this.bgColor='#FFFFFF';' height='22' >\n" +
                            "<td><input name='id' type='checkbox' id='id' value='" + cus.sid + "'class='ck'></td>\n" +
                            "        <td>" + cus.sname + "</td>\n" +
                            "        <td >" + newtime+ "</td>\n" +
                            "        <td>" + newtime2 + "</td>\n" +
                            "        <td>" +lixiao + "</td>\n" +
                            "        <td><a href=\"${pageContext.request.contextPath}/customer-look.jsp?sid=" + cus.sid + "\">查看详情</a></td>" +
                            "    </tr>";

                        $("#tr2").after(tr);
                    });

                    $("#mm").each(function () {
                        $(this).find("td").remove();   //通过循环每一个tr，得到各自下的td
                    });
                    var td = "<td height=\"28\" colspan=\"12\">&nbsp;\n" +
                        " <a href=\"javascript:zheng()\" class=\"coolbg\">全选</a>\n" +
                        "<a href=\"javascript:fan()\" class=\"coolbg\">反选</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "<a href=\"javascript:batchDelete()\" class=\"coolbg\">&nbsp;删除&nbsp;</a>\n" +
                        "                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "当前是第" + rs.pageNum + "页\n" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "<a href=\"javascript:search(1)\" class=\"coolbg\">首页</a>\n" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "<a href=\"javascript:search(" + rs.prePage + ")\" class=\"coolbg\">上一页</a>\n" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "<a href=\"javascript:search(" + rs.nextPage + ")\" class=\"coolbg\">下一页</a>\n" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "<a href=\"javascript:search(" + rs.pages + ")\" class=\"coolbg\">尾页</a>\n" +
                        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "共有" + rs.pages + "页";
                    $("#mm").append(td);

                },
                error: function () {
                    alert("查询出现异常");
                }
            });
        }

        function zheng() {
            var arr = $(".ck");
            for (var i = 0; i < arr.length; i++) {
                arr[i].checked = true;
            }
        }

        function fan() {
            var arr = $(".ck");
            for (var i = 0; i < arr.length; i++) {
                arr[i].checked = !arr[i].checked;
            }
        }

        function batchDelete() {
            var idarr = new Array();
            // 获取选中状态的复选框
            var arr = $("[name='id']:checked");
            for (var i = 0; i < arr.length; i++) {
                var val = arr[i].value;
                idarr[i] = val;// 集合了我们选中的所有项的id值
            }
            if (idarr.length > 0) {
                $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/three/bachDelete',
                        data: {
                            "ids": idarr.toString()
                        },
                        dataType: 'text',
                        success: function (resultData) {
                            if (resultData=="true") {
                                window.location.href = "${pageContext.request.contextPath}/index.jsp";
                            }
                        }
                    })
            } else {
                alert("选中删除的数据");
            }
        }


        function outData(){
            window.location.href="${pageContext.request.contextPath}/cus/outData";
        }


    </script>
</head>
<body leftmargin="8" topmargin="8" background='skin/images/allbg.gif'>

<!--  快速转换位置按钮  -->
<table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
    <tr>
        <td height="26" background="skin/images/newlinebg3.gif">
            <table width="58%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <input type='button' class="coolbg np" onClick="location='/customer-add.jsp';" value='添加学生信息'/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<!--  搜索表单  -->

<table width='98%' border='0' cellpadding='1' cellspacing='1' bgcolor='#CBD8AC' align="center" style="margin-top:8px">
    <tr bgcolor='#EEF4EA'>
        <td background='skin/images/wbg.gif' align='center'>
            <table border='0' cellpadding='0' cellspacing='0'>
                <tr>
                    <td width='100'>
                        姓名关键字：
                    </td>
                    <td width='160'>
                        <input type='text'   id="info" name='keyCode' style='width:120px'/>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;<input name="imageField" onclick="search(1)" type="image"
                                                 src="${pageContext.request.contextPath}/skin/images/frame/search.gif"
                                                 width="45" height="20" border="0" class="np"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<!--  内容列表   -->
<form name="form2">

    <table id="infotb" width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center"
           style="margin-top:8px">
        <tr align="center" bgcolor="#FAFAF1" height="22" id="tr2">
            <td width="4%">序号</td>
            <td width="6%">姓名</td>
            <td width="10%">入校时间</td>
            <td width="10%">正常毕业时间</td>
            <td width="8%">是否毕业</td>
            <td width="10%">操作</td>
        </tr>

        <tr bgcolor="#FAFAF1" id="mm">

        </tr>

    </table>

</form>


</body>
</html>