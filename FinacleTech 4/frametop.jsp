<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.techunified.webclient.acl.UserAcl"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Bank Saudi Fransi</title>
		<meta http-equiv="Content-Type"
			content="text/html; charset=windows-1256">
		<link href="css/frames-styles.css" rel="stylesheet" type="text/css">
	</head>
	<%
		UserAcl user = (UserAcl) session.getAttribute("user");
	%>
	<body class="bottomframe">
		<table cellSpacing=0 cellPadding=0 width="100%" border=0>
			<tbody>
				<tr>
					<td width="100%">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td>&nbsp;</td>
									<td align="left">
										<font color="#003399" face="Arial" size="4"><b><%=user.getUser().getRoleId()%><b><font>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>
