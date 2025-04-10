<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Import CSV</title>
</head>
<body>
    <h2>Upload CSV File</h2>

    <form method="post" action="upload" enctype="multipart/form-data">
        <input type="file" name="file" accept=".csv" required />
        <button type="submit">Upload</button>
    </form>

    <c:if test="${not empty message}">
        <p style="color:red;">${message}</p>
    </c:if>
</body>
</html>
