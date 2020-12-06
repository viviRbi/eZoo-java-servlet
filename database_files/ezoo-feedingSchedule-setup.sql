-- drop table animals if exists
drop table if exists FEEDING_SCHEDULES;

create table FEEDING_SCHEDULES(
  	schedule_ID integer primary key,
	feeding_time varchar,
	recurrence varchar,
	food varchar,
	notes varchar
);

insert into FEEDING_SCHEDULES (
  	schedule_ID ,
	feeding_time,
	recurrence ,
	food,
	notes
)
values
(
	1,
	'9am, 2pm,7pm',
	'3 times',
	'normal',
	'No note'
),
(
	2,
	'10am-8pm',
	'4 times per day',
	'Special food',
	'With Medicines before meals'
),
(
	3,
	'6am to 5pm',
	'5 times per day',
	'Special food',
	'No notes'
)
