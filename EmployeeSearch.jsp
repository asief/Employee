<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Employee Search Screen</title>
    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>  
<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<script>
function doAjaxPost() 
{
    var name = $('#name').val();
    if(name == null || name.length == 0)
    {
    	document.getElementById("errorName").innerHTML = "First Name is required";
    	$("#employeeTable").hide();
    	return false;	
    }
    document.getElementById("errorName").innerHTML = "";
    $.ajax({
    type: "POST",
    dataType: 'json',
    url: "/Employee/EmployeeSearch",
    data: "name=" + name,
    success: function(response)
    {
    	var aaData = [];
    	for (var i = 0; i < response.length; i++) 
    	{
    		aaData.push({
                "Name": response[i].name,
                "Age": response[i].age,
                "Id": response[i].id
            });
		}
        	$("#employeeTable").dataTable({
        		"aaData":aaData,
        		"aoColumns": [{ "mData": "Name" }, 
        		              { "mData": "Age" },
        		              { "mData": "Id" }] 
        		});
            $("#employeeTable").show();
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
<h2>Employee Information</h2>
<form:form method="POST">
   <table>
    <tr>
        <td>Name: <form:input path="name" id="name"/></td>
        <td><span id="errorName" style="color: red;"></span></td>
    </tr>
    
    <tr>
        <td colspan="2">
          <br><input type="button" value="Search Employee"  onclick="doAjaxPost()" ><br><br>
        </td>
    </tr>
    <tr>
       <td><div id="info" style="color: red;"></div></td>
    </tr>
</table>  
<table id="employeeTable" hidden="true">
    <thead>
    <tr><th>Name</th><th>Age</th><th>Id</th></tr>
  </thead>
  <tbody>
  </tbody>  
  </table>
</form:form>
</body>
</html>