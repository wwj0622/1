<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<!--[if lt IE 9]>
	<script type="text/javascript" src="lib/html5shiv.js"></script>
	<script type="text/javascript" src="lib/respond.min.js"></script>
	<![endif]-->
	
	<script src="mao/vue.js" ></script>
	<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
	<!--[if IE 6]>
	<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<![endif]-->
	
	
	<title>采购单管理</title>
</head>
<body>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container" id="app">
	<div class="text-c"> 
		根据交货时间查询
		<input type="Date" v-model="beginTime"  id="datemin" class="input-text Wdate" style="width:150px;">
		-
		<input type="Date" v-model="endTime"  id="datemax" class="input-text Wdate" style="width:150px;">
		<button  @click="search" class="btn btn-success radius" id="" name="">
		<i class="Hui-iconfont">&#xe665;</i> 搜索
		</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:void(0);" @click="delAllSupllier" class="btn btn-danger radius">
				<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
			</a> 
			<a href="javascript:;" @click="member_add" class="btn btn-primary radius">
				<i class="Hui-iconfont">&#xe600;</i> 添加采购单
			</a>
		</span> 
	</div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"></th>
					<th width="70">采购订单号</th>
					<th width="100">供货商名称</th>
					<th width="100">交货地址</th>
					<th width="60">交货时间</th>
					<th>备注信息</th>
					<th width="60">付款状态</th>
					<th width="40">详情</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
			 
			<tr class="text-c" v-for='(buy,i) in buyList'>
					<td><input name=""  v-model="checkedBuy" type="checkbox" :value="buy.bid"></td>
					<td class="text-l">{{buy.bid}}</td>
					<td>{{buy.supplier.sname}}</td>
					<td>{{buy.baddress}}</td>
					<td>{{buy.btime}}</td>
					<td class="text-l">{{buy.bremark}}</td>
					<td>{{buy.bstate==1?"已付款":"未付款"}}</td>
					<td>
						<a href="javascript:void(0);" @click="buyDetail(buy.bid)">点击查看详情</a>
					</td>
					<td class="f-14 product-brand-manage">
						<a style="text-decoration:none" @click="member_edit('编辑采购单','mao/edit-buy.jsp?bid='+buy.bid,'4','','510')" href="javascript:;" title="编辑">
							<i class="Hui-iconfont">&#xe6df;</i>
						</a> 
						<a style="text-decoration:none" class="ml-5" @click="member_del(this,buy.bid)" href="javascript:;" title="删除">
							<i class="Hui-iconfont">&#xe6e2;</i>
						</a>
					</td>
				</tr>
			 <tr>
		    	 <td colspan="4">
	                <a href="javascript:;" @click="jump(1)">首页</a>
	                <a href="javascript:;" @click="jump(pageInfo.prePage)">上页</a>
	                <a href="javascript:;" @click="jump(pageInfo.nextPage)">下页</a>
	                <a href="javascript:;" @click="jump(pageInfo.pages)">尾页</a>
            	</td>
		   	 </tr>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
var v =  new Vue({
	el:'#app',
	data:{
		buyList:[],
		pageInfo:[],
		inputContent:'',
		checkedBuy:[],
		state:'',
		beginTime:'',
		endTime:'',
		stateeee:''
	},
	methods:{
		buyDetail(bid){
			location.href="mao/show-buyDetail.jsp?bid="+bid;
		},
		member_add(){
    		location.href="mao/add-buy.jsp";
    	},
		jump(page){
		 	var _this = this;
	        $.ajax({
	            type: "GET",
	            url: "/buy/getAllBuy",
	            data: {pn:page},
	            dataType: "json",
	            success: function (response) {
	            	_this.buyList = response.data.list;
	            	_this.pageInfo = response.data;
	            },
	        });
         },
         search(){
        	 console.log(this.beginTime);
        	 console.log(this.endTime);
        	var _this = this;
        	
 	        $.ajax({
 	            type: "GET",
 	            url: "/buy/getBuyByTime",
 	            data: {beginDate:_this.beginTime,endDate:_this.endTime},
 	            dataType: "json",
 	            success: function (response) {
 	            	_this.buyList = response.data;
 	            },
 	        });
         },
         member_del(obj,bid){
        	var _this = this;
   			$.ajax({
   				type: "GET",
   	            url: "/buy/delBuy",
   	            data: {bid:bid},
   	            dataType: "json",
   				success: function(data){
   					
   					layer.msg('已删除!',{icon:1,time:1000});
   					/* location.href="mao/show-buy.jsp"; */
   					_this.a();	
   				},
   				error:function(data) {
   					console.log(data.msg);
   				},
   			});		
         },
         delAllSupllier(){
        	 console.log(this.checkedBuy);
        	 var _this = this;
    			$.ajax({
    				type: "GET",
    	            url: "/buy/delBuy",
    	            data: {bid:_this.checkedBuy},
    	            dataType: "json",
    	            traditional: true,
    				success: function(data){
    					layer.msg('已删除!',{icon:1,time:1000});
    					/* location.href="mao/show-buy.jsp"; */
    					_this.a();
    				},
    				error:function(data) {
    					console.log(data.msg);
    				},
    			});		
         },
         member_edit(title,url,id,w,h){
        	 layer_show(title,url,w,h);
         },
         a(){
        	   var _this = this;
               $.ajax({
                   type: "GET",
                   url: "/buy/getAllBuy",
                   data: null,
                   dataType: "json",
                   success: function (response) {
                   	_this.buyList = response.data.list;
                   	_this.pageInfo = response.data;
                   },
               });
         }
        
         
	},
	created(){  
             this.a();
       }

});

</script>


<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->


<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
/*用户-添加*/

/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
				$(obj).remove();
				layer.msg('已停用!',{icon: 5,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
				$(obj).remove();
				layer.msg('已启用!',{icon: 6,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});
	});
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}

</script> 



</body>
</html>