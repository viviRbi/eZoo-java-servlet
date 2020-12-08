
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
	<div class="col-sm-6 col-xs-12">
		<ul class="text-left">
			<h5> Animal Info</h5>
			<h6>(Select feeding schedule for ${animal.name })</h6>
			<li><strong>Name : </strong><span>${animal.name }</span></li>
			<li>
				<strong>Feeding time : </strong>
				</br>
				<form action="assignScheduleToAnimal" method="POST" id="assignScheduleToAnimal" name="assignScheduleToAnimal">
					<input type="hidden" name="animal_id" value="${animal.animalID}"/>
					<select name="schedule_id" onchange="pasteThisSchedule(this)">
						<c:forEach var="s" items="${schedules}"> 
							<option value="${s.schedule_ID}" 
							${animal.getScheduleID() == s.getSchedule_ID()?"selected=selected":""}
							data-feeding_time= "${s.feeding_time}"
							data-food= "${s.food}"
							data-feeding_time= "${s.feeding_time}"
							data-notes="${s.notes}"
							data-recurrence = "${s.recurrence}"
							>
								Schedule ${s.getSchedule_ID()}: ${s.feeding_time} ${s.food} 
							</option>
						</c:forEach> 
					</select>
				</form>
				
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
			<button role="submit" class="btn btn-primary" form="assignScheduleToAnimal">Save Schedule</button>
			<button role="submit" class="btn btn-primary">
				<a href="/eZoo/addAnimal">Add an Animal</a>
			</button>
		</ul>
	</div>
	<div class="col-sm-6 col-xs-12">
	<ul class="text-left">
		
			<h5> Edit Feeding Schedule</h5>
			<form action="editFeedingSchedule" method="POST" id="updateFeedingSchedule">
				<input type="hidden" name="schedule_id" value=""/>
				<li><strong>Feeding time : </strong></br><input name="feeding_time" value=""/></li>
				<li><strong>Recurrence : </strong></br><input name="recurrence" value=""/></li>
				<li><strong>Food : </strong><span></br><input name="food" value=""/></li>
				<li><strong>Notes : </strong><span></br><textarea name="notes" value=""></textarea></li>
				</br>
				<button role="submit" class="btn btn-primary">Save Edited Schedule</button>
			</form>
			</br>
			<form action="deleteFeedingSchedule" method="POST">
				<input type="hidden" name="schedule_id" value=""/>
				<button role="submit" class="btn btn-primary">Delete this Schedule</button>
			</form>
	
		</ul>
	
	</div>
</div>	
</div>
</header>
<jsp:include page="footer.jsp" />		
				
