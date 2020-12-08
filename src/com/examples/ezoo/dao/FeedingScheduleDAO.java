package com.examples.ezoo.dao;
import java.util.List;

import com.examples.ezoo.model.FeedingSchedule;

public interface FeedingScheduleDAO {
	List<FeedingSchedule> getAllSchedules();

	boolean saveAddedFeedingSchedule(FeedingSchedule a) throws Exception;
	
	void deleteUpdateFeedingSchedule(long id);

	boolean saveUpdateFeedingSchedule(FeedingSchedule a) throws Exception;

}
