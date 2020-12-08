
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
<div class="row text-right"> <button class="btn btn-primary"><a href="addFeedingSchedule">Add Feeding Schedule</a></button></div>
	
	<c:forEach var="s" items="${schedules}"> 
		<div class="col-sm-6 col-xs-12 text-left">
			<h5> Edit Feeding Schedule</h5>
			<form action="editFeedingSchedule" method="POST" id="updateFeedingSchedule">
				<input type="hidden" name="schedule_id" value="${s.schedule_ID}"/>
				<li><strong>Feeding time : </strong></br><input name="feeding_time" value="${s.feeding_time}"/></li>
				<li><strong>Recurrence : </strong></br><input name="recurrence" value="${s.recurrence}"/></li>
				<li><strong>Food : </strong><span></br><input name="food" value="${s.food}"/></li>
				<li><strong>Notes : </strong><span></br><textarea name="notes" >${s.notes}</textarea></li>
				</br>
				<button role="submit" class="btn btn-primary">Save Edited Schedule</button>
			</form>
			</br>
			<form action="deleteFeedingSchedule" method="POST">
				<input type="hidden" name="schedule_id" value=""/>
				<button role="submit" class="btn btn-primary">Delete this Schedule</button>
			</form>
			</br></br>
		</div>
	</c:forEach> 
	</div>
