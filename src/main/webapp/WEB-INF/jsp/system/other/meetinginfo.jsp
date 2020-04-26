<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en"
      class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie10 no-ie11 no-ios no-ios7 ipad">
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/system/other/meetinginfo.js"></script>
</head>
<body class="" style="">

<%--<div class="m-b-md">
    <form class="form-inline" role="form" id="searchForm"
          name="searchForm">
        <div class="form-group">
            <label class="control-label"> <span
                    class="h4 font-thin v-middle">开始时间:</span></label> <input
                class="input-medium ui-autocomplete-input" id="startTime"
                name="cardTranInfoFormMap.startTime"/>
        </div>

        <div class="form-group">
            <label class="control-label"> <span
                    class="h4 font-thin v-middle">结束时间:</span></label> <input
                class="input-medium ui-autocomplete-input" id="endTime"
                name="cardTranInfoFormMap.endTime"/>
        </div>
        <a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
    </form>
</div>--%>
<header class="panel-heading">
    <div class="doc-buttons">
        <c:forEach items="${res}" var="key">
            ${key.description}
        </c:forEach>
    </div>
</header>
<div class="table-responsive">
    <div id="container" style="height: 400px; min-width: 310px"></div>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/js/stock/highstock.js"></script>
<script src="${pageContext.request.contextPath}/js/stock/modules/exporting.js"></script>
<script type="text/javascript">

</script>