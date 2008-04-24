<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- Page displaying link to webservice. --%>

<style type="text/css">
.highlighted {
    color: red;
}
</style>

<!-- serviceLink.jsp -->
<div align="center" ><div class="plainbox" style="width:700px; font-size:14px; overflow: auto">

	<c:choose>
		<c:when test="${requestScope.pageTitle != null}">
		    <c:set var="pageTitle" value="${requestScope.pageTitle}"></c:set>
		</c:when>
		<c:otherwise>
		    <c:set var="pageTitle" value="Resource link"></c:set>
		</c:otherwise>
	</c:choose>

	<h1>${pageTitle}</h1>
	<div>${requestScope.pageDescription}</div>
	
	<form action="">
	
	    <div  style="margin-top: 10px;">
	       <c:set var="encodedLink" value="${fn:replace(link, '&', 'XXXXX')}"></c:set>
	       <span style="float: right;"><a href="javascript:openPopWindow('linkPreview.do?link=${encodedLink}', 800, 800)" style="1em;">preview</a></span>
	       <span style="float: left;">Add this HTML to embed the results of this template in your web page:</span> 
	    </div>
	    <%-- Don't split following line --%>
	    <textarea style="width:100%;height:100px;"><iframe width=&quot;700&quot; height=&quot;500&quot; frameborder=&quot;1&quot; scrolling=&quot;yes&quot; marginheight=&quot;0&quot; marginwidth=&quot;0&quot; src=&quot;${link}&amp;format=html&quot;></iframe></textarea>
	    
	    <div style="margin-top: 10px;">
	       <span style="float:right;"><a href="javascript:openPopWindow('${link}&amp;format=tab;', 800, 1000)">preview</a></span>
	       <span style="float:left;">Web service link to this template. 
	       Use this URL to fetch tab delimited results for this template in your own program.
	       </span> 
	    </div>
	    <%-- Don't split following line --%>
	    <textarea style="width:100%;height:100px;">${link}&amp;format=tab</textarea>
	    
	</form>
	
	<c:if test="${requestScope.highlightedLink != null}">
		<div>
		   If you want to get results for different parameters, edit the highlighted constraints 
		   in the URL to the values you need. <a href="javascript:display('highLinkId', true)">Show</a> link with constraint values highlighted in red.
	    </div>
	    <div id="highLinkId" style="display: none; text-">
	       ${requestScope.highlightedLink}
	    </div>
	</c:if>
	
	<span style="float:left;">For other options and detailed help <a href="http://intermine.org/wiki/TemplateWebService">click here</a>.</span> 
    <span style="float:right;"><a href="javascript:history.go(-1)">Go back</a></span>

</div></div>
<!-- /serviceLink.jsp -->

