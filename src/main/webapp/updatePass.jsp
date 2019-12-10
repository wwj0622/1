<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basepath %>" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->
<script src="./js/axios.min.js"></script>

<script src="./js/vue.js"></script>

<title>修改密码</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container"  id="add">
	<form action="" id="form" method="post" class="form form-horizontal" id="form-member-add">
        
		
		<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="password"  v-model="user.idcard" class="input-text" value="" placeholder="" id="username" name="username">
				</div>
		</div>

		<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>请输入手机号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="password"  v-model="user.phone" class="input-text" value="" placeholder="" id="username" name="username">
				</div>
		</div>

		<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新密码：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="password" v-model="user.password" class="input-text" value="" placeholder="" id="username" name="username">
				</div>
		</div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" @click="yan" type="button" value="确认修改">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-member-add").validate({
		rules:{
			username:{
				required:true,
				minlength:2,
				maxlength:16
			},
			sex:{
				required:true,
			},
			mobile:{
				required:true,
				isMobile:true,
			},
			email:{
				required:true,
				email:true,
			},
			uploadfile:{
				required:true,
			},
			
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			//$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			//parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	});
});
</script> 

<script>
 new Vue({
	el:'#add',
	data () {
		return {
		   	user:{
				password:'',
				phone:'',
				idcard:''

			   }
			 
		   
		}
	},
	methods:{
		a(){
			if(this.password1!=this.password2)
			{
				alert('密码不一致,请重新输入');
                document.getElementById('form').reset();
			}

		},
		yan(){
			this_a=this;
			axios.post("/updatepass",this_a.user)
			.then(res => {
				console.log(res);
				var m=res.data;
				if(m.state==1)
				{
					alert('身份证错误');
					document.getElementById('form').reset();
				}
				if(m.state==2)
				{
					alert('手机号错误');
					document.getElementById('form').reset();
				}
				if(m.state==3)
				{
					alert('密码修改成功');
					document.getElementById('form').reset();
				}

			})
			.catch(err => {
				console.error(err); 
			})

		},
		xiugai(){
           

		}
	}


	 })

</script>

</body>
</html>