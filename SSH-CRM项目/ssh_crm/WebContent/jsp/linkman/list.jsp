<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>联系人列表</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css" type=text/css
	rel=stylesheet>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
<SCRIPT language=javascript>
		//切换切面
		function changePage(page) {
			var currentPage = $("#totalPage").html();
			if(page>0&&page<=currentPage){
				$("#linkmanForm_currentPage").attr("value",page);
				$("#linkmanForm").submit();
			} 
		}
		
		//改变pageSize
		function changePageSize(pageSize) {
			$("#linkmanForm_pageSize").attr("value",pageSize);
			$("#linkmanForm").submit();
			
		}
		
		$(document).ready(function(){
			//回显pageSize
			$("#size").find("option[value="+<s:property value="#pageBean.pageSize"/>+"]").attr("selected","selected");
		});
</SCRIPT>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	
		
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_019.jpg"
						border=0></TD>
					<TD width="100%" background="${pageContext.request.contextPath }/images/new_020.jpg"
						height=20></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_021.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_022.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_022.jpg" border=0></TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>当前位置：联系人管理 &gt; 联系人列表</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0
							width="100%" align=center border=0>
							<TBODY>
								<TR>
									<TD height=25>
									<FORM id="linkmanForm" name="linkmanForm"
										action="${pageContext.request.contextPath }/LinkmanAction_list"
										method=post>
										<TABLE cellSpacing=0 cellPadding=2 border=0>
											<TBODY>
												<TR>
													<!--隐藏域，显示当前页面显示数  -->
													<input type="hidden" id="linkmanForm_pageSize" name="pageSize" value="<s:property value="#pageBean.pageSize"/>">
													<!--隐藏域，显示当前页码  -->
													<input type="hidden" id="linkmanForm_currentPage" name="currentPage" value="<s:property value="#pageBean.currentPage"/>">
													<TD>联系人名称：</TD>
													
													<TD><INPUT class=textbox id=sChannel2
														style="WIDTH: 80px" maxLength=50 name="lkm_name"></TD>
													
													<TD><INPUT class=button id=sButton2 type="submit"
														value=" 筛选 " name=sButton2></TD>
												</TR>
											</TBODY>
										</TABLE>
									</FORM>
									</TD>
								</TR>
							    
								<TR>
									<TD>
										<TABLE id=grid
											style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
											cellSpacing=1 cellPadding=2 rules=all border=0>
											<TBODY>
												<TR
													style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
													<TD>联系人名称</TD>
													<TD>性别</TD>
													<TD>办公电话</TD>
													<TD>手机</TD>
													<TD>操作</TD>
												</TR>
												<s:iterator  value="#pageBean.list" var="linkman">
													<TR
														style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
														<TD><s:property value="lkm_name"/></TD>
														<TD><s:property value="lkm_gender=='1'?'男':'女'"/></TD>
														<TD><s:property value="lkm_phone"/></TD>
														<TD><s:property value="lkm_mobile"/></TD>
														
														<TD>
															<a href="${pageContext.request.contextPath }/LinkmanAction_update">修改</a>
															&nbsp;&nbsp;
															<a href="${pageContext.request.contextPath }/">删除</a>
														</TD>
													</TR>
												</s:iterator>
												
											</TBODY>
										</TABLE>
									</TD>
								</TR>
								
								<TR>
									<TD><SPAN id=pagelink>
											<DIV
												style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
												共[<B id="totalCount"><s:property value="#pageBean.totalCount"/></B>]条记录,[<B id="totalPage"><s:property value="#pageBean.totalPage"/></B>]页
												,每页显示
												<select  id="size" onchange="changePageSize(this.value)">
													<option value="3" >3</option>
													<option value="5" >5</option>
												</select>
												条
												[<A href="javascript:void(0)" onclick="changePage(<s:property value="#pageBean.currentPage-1"/>)">前一页</A>]
												
												[<A href="javascript:void(0)" onclick="changePage(<s:property value="#pageBean.currentPage+1"/>)">后一页</A>] 
												到
												<input type="text" size="3" id="page" name="page" value="<s:property value="#pageBean.currentPage"/>" />
												页
												
												<input type="button" value="Go" />
											</DIV>
									</SPAN></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
					<TD width=15 background="${pageContext.request.contextPath }/images/new_023.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_023.jpg" border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_024.jpg"
						border=0></TD>
					<TD align=middle width="100%"
						background="${pageContext.request.contextPath }/images/new_025.jpg" height=15></TD>
					<TD width=15><IMG src="${pageContext.request.contextPath }/images/new_026.jpg"
						border=0></TD>
				</TR>
			</TBODY>
		</TABLE>
	
</BODY>
</HTML>
