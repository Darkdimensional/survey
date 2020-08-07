<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: 98316
  Date: 2020/2/1
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>参与问卷</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">

    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/navbar.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/survey.css" type="text/css" media="all">
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
        <div id="title" class="form-group">
        </div>
        <!--问题容器，用来装问题-->
        <div id="qarea">

        </div>



        <!--提交问卷-->
        <div class="form-group text-center row">
            <div class="col-xs-4">
                <div id="complete" class="btn btn-success" style="float: inherit;" onclick="complete()" >完成问卷</div>
            </div>
        </div>

    </form>
</div>

</body>

<script type="text/javascript" src="js/jquery.min.js" ></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>
<script src="http://pv.sohu.com/cityjson"></script>
<script>
    //获取问卷信息
    var id = window.location.href.split("=")[1];
    var user_address = getAddress();
    $.ajax({
        type:'post',
        data:{ 'id':id},
        url:'paper/findId',
        success: function (result) {
            if (result.success){
                var paper = result.data;
                var title= $("#title");
                var qarea = $("#qarea");
                var stitle = "<span  name='name' class='form-control' style='font-size: 20px;text-align: center;display:block;'>"+paper.title+"</span>";
                title.append(stitle);
                var questions = paper.questions;
                for (var i = 0; i < questions.length; i++) {
                    var temp = "";
                    var tye = questions[i].question_type;
                    temp+="<input type='text'  class='form-control qname'  value='"+(i+1)+"."+questions[i].question_name+"' name='"+tye+"'  readonly='readonly'>";
                    temp += setOption(questions[i].options,tye,i,questions[i].question_id);
                    qarea.append(temp);
                }
            }
            else {
                alert("获取问卷失败");
            }
        },
        error:function(e){
            alert("系统出错了"+e);
        }
    })
    function setOption(options ,tye,pnum,q_id) {
        var temp = "";
        temp += "<div class='quest"+pnum+"'>";
        if(tye == "1"){
            for (var i = 0; i < options.length; i++){
                temp+="<input  type='radio' name='option"+pnum+"' value='"+options[i].option_id+"'/>"
                temp+="<input  type='text' class='option-text op"+pnum+"'  value='"+options[i].option_name+"' style='border: 0px;' name='content' readonly='readonly'>";
                temp+="<br />";
            }
        }else if (tye == "2"){
            for (var i = 0; i < options.length; i++){
                temp+="<input type='checkbox' name='option"+pnum+"' value='"+options[i].option_id+"'/>";
                temp+="<input  type='text'  class='option-text op"+pnum+"'  value='"+options[i].option_name+"' style='border: 0px;' name='content' readonly='readonly'>";
                temp+="<br />";
            }
        }else if (tye == "3") {
            temp+="<input id='"+q_id+"'  type='text'  class='form-control' style='margin-top: 20px' name='textContent'>";
        }
        temp += "</div><br />";
        return temp;
    }

    //提交问卷答案

    function complete() {
        var answer = {};
        //获取ip、地址、创建时间
        var ip = returnCitySN["cip"];
        var create_date = getNowFormatDate();
        //封装答案主表的信息
        var paper = {};
        paper.paper_id = id;
        answer.user_ip = ip;
        answer.user_address = user_address;
        answer.create_date = create_date;
        answer.paper = paper;
        //封装全部答案
        var optionAnswers = [];
        //封装被选中的checkbox
        $.each($('input:checkbox:checked'),function(){
           var optionAnswer = {};
           optionAnswer.option_id = $(this).val();
           optionAnswer.content = "checked";
           optionAnswers.push(optionAnswer);
        });
        $.each($('input:radio:checked'),function(){
            var optionAnswer = {};
            optionAnswer.option_id = $(this).val();
            optionAnswer.content = "checked";
            optionAnswers.push(optionAnswer);
        });
        $.each($('input:text[name="textContent"]'),function(){
            var optionAnswer = {};
            optionAnswer.question_id = $(this).attr("id");
            optionAnswer.content = $(this).val();
            optionAnswers.push(optionAnswer);
        });
        answer.optionAnswers = optionAnswers;
        //将封装数据传入后台
        $.ajax({
            type:'post',
            url:'answer/save',
            dataType:"json",
            data:JSON.stringify(answer),
            contentType : 'application/json;charset=utf-8', //设置请求头信息
            success: function (result) {
                if (result.success){
                    alert("感谢您的问答");
                    window.location.href='index.jsp';
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

    //获取当前时间函数
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
    //获取用户所在地址
    function getAddress() {
        $.ajax({
            url: 'http://api.map.baidu.com/location/ip?ak=ia6HfFL660Bvh43exmH9LrI6',
            type: 'POST',
            dataType: 'jsonp',
            success:function(data) {
                user_address = (data.content.address_detail.province + "," + data.content.address_detail.city);
            }
        });
    }

</script>
</html>
