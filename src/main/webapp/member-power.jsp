<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basepath %>" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Insert title here</title>

<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<script src="./js/axios.min.js"></script>
<script src="./js/vue.js"></script>
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

<title>添加用户 - H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container"  id="add">
	<form action="" method="post" class="form form-horizontal" id="form-member-add">
        <input type="hidden" id="uid" value="${id}">
	    
	    <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户ID：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text"  class="input-text" disabled :value="user.id" placeholder="" id="username" name="username">
			</div>
		</div>


		<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" disabled class="input-text" :value="user.usercode" placeholder="" id="username" name="username">
				</div>
		</div>

		<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">用户角色：</label>
				<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
					<select class="select" size="1" name="city" :id="rid" v-model="user.roleid">
						<option v-for="(r,i) in role" :value="r.id"  >{{r.name}}</option>
					</select>
					</span> 
				</div>
		</div>





		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="sex" type="radio" id="sex-1" checked>
					<label for="sex-1">男</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-2" name="sex">
					<label for="sex-2">女</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-3" name="sex">
					<label for="sex-3">保密</label>
				</div>
			</div>
		</div>
	

		<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text"   v-model="user.idcard" placeholder="" id="username" name="username">
				</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" v-model="user.phone" placeholder="" id="username" name="username">
			</div>
		</div>
	
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="button" @click="updateuser" value="提交">
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
			id:'',
			usercode:'',
			password:'',
			phone:'',
			idcard:'',
			roleid:''
			},
			
			role:[],
		    id:'',
		    rid:'',
		    aid:''
			
			
		}
	},
	methods: {
		 a(){
			  var uid= document.getElementById('uid').value;
	           this.aid=uid;
		   },
		 b(){
			   this_a=this;
				axios.get("/selectRole",null)
				.then(res => {
					console.log(res);
					this_a.role=res.data;
				})
				.catch(err => {
					console.error(err); 
				})
		   },
		 c(){
			   this_a=this;
			   var uid= document.getElementById('uid').value;
	           axios.post("/IdUser",{id:uid})
			   .then(res => {
				   console.log(res);
				   this_a.user= res.data.user;
				   this_a.user.roleid=res.data.roleName.id;
				  
			   })
			   .catch(err => {
				   console.error(err); 
			   })
		   },
		   updateuser:function(){
				this_a=this;
				axios.post("/updatepower",this_a.user)
				.then(res => {
					console.log(res);
					alert('修改成功');
					layer.close(layer.index);
					window.parent.location.reload();
				})
				.catch(err => {
					console.error(err); 
				})

		   }
         
		
	},
	created (){
		this.b();
		this.c();
	
	}
	

	


	 })

</script>

</body>
</html>
