Changes I have made: 
	- Import jstl-1.2.jar to WEB-INF/lib so <taglib> doesn't throw any error that create 500 Server error status
	- Add schedule_id to Animal database and class so we can assign schedule to databases
	- Add feeding schedule list to doGet function (HttlServlet) so it can be pass to AddAnimal + View animal detail so I can use for each and list them out as <option>