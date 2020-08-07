<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: 98316
  Date: 2020/1/29
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>问卷设计</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">

    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/navbar.css" type="text/css" media="all">
</head>
<body style="padding: 5px;">

<nav class="link-effect-2" id="link-effect-2">
    <ul class="nav navbar-nav">
        <li>
            <a class="scroll" href="index.jsp"><img src="images/logo.png" alt="icon"><span>首页</span></a>
        </li>
        <li><a class="scroll" href=""><span>产品介绍</span></a></li>
        <li><a class="scroll" href=""><span>联系客服</span></a></li>
        <li><a class="scroll" href="answer_square.jsp"><span>我要答卷</span></a></li>
        <li><a class="scroll" href="newPaper.jsp"><span>创建问卷</span></a></li>
    </ul>
</nav>

<top id="top"></top>

<!--问卷主体-->
<div class="container">
    <form id="form" class="form center-block">
        <!--问卷标题-->
        <div class="form-group">
            <textarea id="title" name="name" class="form-control text-center" style="font-size: 20px;" placeholder="请输入问卷标题"></textarea>
        </div>
        <!--问题容器，用来装问题-->
        <div>

        </div>

        <!--添加问题-->
        <div id="add-question" class="dropdown">
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" value="-1">添加问题</button>
            <div class="dropdown-menu">
                <button type="button" class="dropdown-item" value="1">单选</button>
                <button type="button" class="dropdown-item" value="2">多选</button>
                <button type="button" class="dropdown-item" value="3">填空</button>
            </div>
            <!--发布问卷-->
            <div id="complete" class="btn btn-success" style="float: right" onclick="complete()" >完成问卷</div>
        </div>

    </form>
</div>

</body>
<script type="text/javascript" src="js/jquery.min.js" ></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>
<script type="text/javascript">
    //问题数量
    var num=0;
    //添加问题
    $("#add-question").click(function(e){
        var index = e.target.value;
        if (index == "-1"){
            return;
        }else if(index == "1"){
            var pnum = num;
            var radionum = 1;
            var temp="";
            temp+="<div class='quest "+num+" form-group'>";
            temp+="<div class='pull-right'>";
            temp+="<span class='btn btn-xs btn-primary' onclick='up("+num+")'>上移</span>";
            temp+="<span class='btn btn-xs btn-primary' onclick='down("+num+")'>下移</span>";
            temp+="<span class='btn btn-xs btn-primary' onclick='del("+num+")'>删除</span>";
            temp+="</div><br />";
            //题目名称
            temp+="<input type='text'  class='form-control qname'  value='请选择一个选项' name='1' placeholder='点击编辑题目名称'>";
            //选项
            temp+="<div class='quest"+pnum+"'>";
            temp+="<input type='radio' name='option"+pnum+"'/>"
            temp+="<input  type='text' class='option-text op"+pnum+"'  value='选项"+radionum+++"' name='content' placeholder='点击选项名称'><br />";
            temp+="</div><br />";
            temp+="<span class='add"+pnum+" btn btn-xs btn-primary' onclick='radd("+pnum+","+radionum+")'>添加选项</span>";
            temp+="</div>";
            num++;
            $(this).prev().append(temp);
        }else if(index == "2"){
            var pnum = num;
            var radionum = 1;
            var temp="";
            temp+="<div class='quest "+num+" form-group'>";
            temp+="<div class='pull-right'>";
            temp+="<span class='btn btn-xs btn-primary' onclick='up("+num+")'>上移</span>";
            temp+="<span class='btn btn-xs btn-primary' onclick='down("+num+")'>下移</span>";
            temp+="<span class='btn btn-xs btn-primary' onclick='del("+num+")'>删除</span>";
            temp+="</div><br />";
            //题目名称
            temp+="<input type='text'  class='form-control qname'  value='请选择以下选项 (多选)' name='2' placeholder='点击编辑题目名称'>";
            //选项
            temp+="<div class='quest"+num+"'>";
            temp+="<input type='checkbox' name='option"+pnum+"'/>";
            temp+="<input  type='text'  class='option-text op"+pnum+"'  value='选项"+radionum+++"' name='content' placeholder='点击编辑选项名称'><br />";
            temp+="</div><br />";
            temp+="<span class='add"+num+" btn btn-xs btn-primary' onclick='cadd("+pnum+","+radionum+")'>添加选项</span>";
            temp+="</div>";
            num++;
            $(this).prev().append(temp);
        }else if (index == "3"){
            var temp="";
            temp+="<div class='quest "+num+" form-group'>";
            temp+="<div class='pull-right'>";
            temp+="<span class='btn btn-xs btn-primary' onclick='up("+num+")'>上移</span>";
            temp+="<span class='btn btn-xs btn-primary' onclick='down("+num+")'>下移</span>";
            temp+="<span class='btn btn-xs btn-primary' onclick='del("+num+")'>删除</span>";
            temp+="</div><br />";
            //题目名称
            temp+="<input class='form-control qname' style='border: 0px solid #fff;' value='请填写本项内容' name='3' placeholder='点击编辑题目名称'>";
            //选项
            temp+="<div class='quest"+num+"'>";
            temp+="<input  type='text'  class='form-control' style='margin-top: 20px' name='content' readonly='readonly'>";
            temp+="</div><br />";
            temp+="</div>";
            num++;
            $(this).prev().append(temp);
        }
    })
    //删除问题
    function del(num){
        $("."+num).remove();
    }
    //上移
    function up(num){
        //克隆当前标签
        var clone=$("."+num).clone(true);
        //获得上一个标签，将克隆的元素放置其before
        var prev=$("."+num).prev();
        prev.before(clone);
        //删除当前标签
        $("."+num+":eq(1)").remove();
    }
    //下移
    function down(num){
        //克隆当前元素
        var clone=$("."+num).clone();
        //获得下一个元素，将克隆的元素放置在其after
        var next=$("."+num).next();
        next.after(clone);
        //删除当前标签
        $("."+num+":eq(-2)").remove();
    }
    //添加单选选项
    function radd(pnum,radionum){
        var temp = "";
        var rdiv= $("."+"quest"+pnum);
        var rad = $("."+"add"+pnum);
        temp+="<input type='radio' name='option"+num+"' placeholder='点击编辑选项'/>"
        temp+="<input  type='text' class='option-text op"+pnum+"'  value='选项"+radionum+++"' name='content' placeholder='点击选项名称'>";
        temp+="<br />";
        rdiv.append(temp);
        rad.attr("onclick","radd("+pnum+","+radionum+")");
    }

    //添加多选选项
    function cadd(pnum,radionum){
        var temp = "";
        var rdiv= $("."+"quest"+pnum);
        var rad = $("."+"add"+pnum);
        temp+="<input type='checkbox' name='option"+pnum+"' placeholder='点击编辑选项'/>";
        temp+="<input  type='text' class='option-text op"+pnum+"'  value='选项"+radionum+++"' name='content' placeholder='点击选项名称'>";
        temp+="<br />";
        rdiv.append(temp);
        rad.attr("onclick","cadd("+pnum+","+radionum+")");
    }

    //提交问卷
    function complete() {
        var paper = {};
        var user = {};
        var user_id = "${sessionScope.user_session.user_id}";
        var title = $("#title").val();
        var create_time = getNowFormatDate();
        var status = '1';
        var questions = getQuestions();
        user.user_id = user_id;

        paper.user = user;
        paper.title = title;
        paper.create_time = create_time;
        paper.status = status;
        paper.questions = questions;

        $.ajax({
            type:'post',
            url:'paper/save',
            dataType:"json",
            data:JSON.stringify(paper),
            contentType : 'application/json;charset=utf-8', //设置请求头信息
            success: function (result) {
                if (result.success){
                    alert("发布成功");
                    window.location.href='myPaper.jsp';
                }
                else {
                    alert("发生错误");
                }
            },
            error:function(e){
                alert("出错了"+e);
            }
        })
    }

    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate;
        return currentdate;
    }

    function getQuestions() {
        var questions = [];
        var qnames =  $(".qname");
        for (var i = 0; i < qnames.length; i++){
            var j = {};
            j.question_name = qnames[i].value;
            j.question_sort = i;
            j.question_type = qnames[i].name;
            j.required_flag = "1";
            j.options =  getOptions(i);
            questions.push(j);
        }
        return questions;
    }

    function getOptions(pnum) {
        var options = [];
        var onames = $(".op"+pnum+"");
        for(var i = 0; i < onames.length;i++){
            var j = {};
            j.option_name = onames[i].value;
            j.option_sort = i;
            options.push(j);
        }
        return options;
    }
</script>

</html>
