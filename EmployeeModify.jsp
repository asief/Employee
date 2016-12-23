<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Employee Modify Screen</title>
<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>  
<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<script>
function doAjaxPost() 
{
    var name = $('#employeeName').val();
    $.ajax({
    type: "POST",
    dataType: 'json',
    url: "/Employee/EmployeeModify",
    data: "employeeName=" + name,
    success: function(response)
    {
    	alert(JSON.stringify(response));
    	var employeeData = JSON.stringify(response);
    	$("#employeeTable").show();
    	document.getElementById('name').value = employeeData.employeeName;
    },
    error: function(e)
    {
    	console.log(e);
    }
    });
}
</script>
</head>
<body>
	<h2>Modify Employee Information</h2>
	<form:form method="POST">
		<table>
			<tr>
				<td>Name:</td>
				<td><form:input path="employeeName" id="employeeName" /><br></td>
			</tr>
			<tr>
				<td colspan="2"><br>
				<input type="button" value="Search Employee" 
					onclick="doAjaxPost()" ><br>
				<br></td>
			</tr>
			<tr>
				<td><div id="info" style="color: red;"></div></td>
			</tr>
		</table>
	</form:form>
	<table id="employeeTable" hidden="true">
	<thead>
	<tr><th>Name</th><th>Id</th><th>Age</th><th>Project Code</th></tr>
	</thead>
	<tbody>
	<tr><td><span id="name"></span></td><td><span id="id"></span></td><td><span id="age"></span></td><td><span id="projectCode"></span></td></tr>
	</tbody>
	</table>
	
</body>
</html>