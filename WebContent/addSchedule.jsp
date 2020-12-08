
	<!-- Header -->
	<jsp:include page="header.jsp" />
	
	<!-- JSTL includes -->
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	
<!-- 	Just some stuff you need -->
	<header>
	  <div class="container">

	<c:choose>
	<c:when test="${not empty message }">
	  <p class="alert ${messageClass}">${message }</p>
	<%
	  session.setAttribute("message", null);
	  session.setAttribute("messageClass", null);
	%>
	</c:when>
	</c:choose>

<!--  Animal Detail goes here  -->	


	<div class="col-sm-6 col-xs-12">
		<h5> Add Feeding Schedule</h5>
		<form action="addFeedingSchedule" method="POST">
			<li><strong>Schedule Id : </strong></br><input name="schedule_id" value=""/></li>
			<li><strong>Feeding time : </strong></br><input name="feeding_time" value=""/></li>
			<li><strong>Recurrence : </strong></br><input name="recurrence" value=""/></li>
			<li><strong>Food : </strong><span></br><input name="food" value=""/></li>
			<li><strong>Notes : </strong><span></br><textarea name="notes" value=""></textarea></li>
			</br>
			<button type="submit" class="btn btn-primary">Add a new Schedule</button>
		</form>	
	</div>
	</header>
	
	<!-- Footer -->
	<jsp:include page="footer.jsp" />