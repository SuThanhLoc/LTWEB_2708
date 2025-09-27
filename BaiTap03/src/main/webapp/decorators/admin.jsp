<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><dec:title default="Admin Page" /></title>
    <link href="<c:url value='/assets/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/css/style.css'/>" rel="stylesheet">
</head>
<body>
    <%@include file="/common/header.jsp" %>
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <%@include file="/common/left.jsp" %>
            </div>
            <div class="col-md-9 py-3">
                <dec:body/>
            </div>
        </div>
    </div>
    
    <%@include file="/common/footer.jsp" %>
    
    <script src="<c:url value='/assets/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>
