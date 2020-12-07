
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

<div class="row">
	<div class="col-sm-4 col-xs-12">
		<ul class="text-left">
			<h5> Animal Info</h5>
			<h6>(Select feeding schedule for ${animal.name })</h6>
			<li><strong>Name : </strong><span>${animal.name }</span></li>
			<li>
				<strong>Feeding time : </strong>
				</br>
				<select>
					<option>1</option>
					<option>2</option>
				</select>
			</li>
			<li><strong>Phylum : </strong><span>${animal.taxPhylum}</span></li>
			<li><strong>Class : </strong><span>${animal.taxClass}</span></li>
			<li><strong>Order : </strong><span>${animal.taxOrder}</span></li>
			<li><strong>Family : </strong><span>${animal.taxFamily}</span></li>
			<li><strong>Genus : </strong><span>${animal.taxGenus}</span></li>
			<li><strong>Species : </strong><span>${animal.taxSpecies}</span></li>
			<li><strong>Height(ft) : </strong><span>${animal.height}</span></li>
			<li><strong>Weight(lbs) : </strong><span>${animal.weight}</span></li>
			<li><strong>Type : </strong><span>${animal.type}</span></li>
			<li><strong>Health Status : </strong><span>${animal.healthStatus}</span></li>
			</br>
			<button role="submit" class="btn btn-primary">Save Schedule</button>
		</ul>
	</div>
	<div class="col-sm-8 col-xs-12">
	<ul class="text-left">
		<div class="col-sm-6 col-xs-12">
			<h5> Edit Feeding Schedule</h5>
			<form action="updateFeedingSchedule" method="POST">
				<li><strong>Feeding time : </strong></br><input value="${animal.name }"/></li>
				<li><strong>Recurrence : </strong></br><input value="${animal.name }"/></li>
				<li><strong>Food : </strong><span></br><input value="${animal.name }"/></li>
				<li><strong>Notes : </strong><span></br><input value="${animal.name }"/></li>
				</br>
				<button role="submit" class="btn btn-primary">Save Edited Schedule</button>
			</form>
		</div>
			
		<div class="col-sm-6 col-xs-12">
			<h5> Add Feeding Schedule</h5>
			<form action="addFeedingSchedule" method="POST">
				<li><strong>Schedule Id : </strong></br><input name="schedule_id" value=""/></li>
				<li><strong>Feeding time : </strong></br><input name="feeding_time" value=""/></li>
				<li><strong>Recurrence : </strong></br><input name="recurrence" value=""/></li>
				<li><strong>Food : </strong><span></br><input name="food" value=""/></li>
				<li><strong>Notes : </strong><span></br><input name="notes" value=""/></li>
				</br>
				<button type="submit" class="btn btn-primary">Add a new Schedule</button>
			</form>
			
			</br>
			
		</div>
			
		</ul>
	
	</div>
</div>	
						
</body>
</html>