package com.examples.ezoo.dao;
import java.util.List;

import com.examples.ezoo.model.FeedingSchedule;

public interface FeedingScheduleDAO {
	List<FeedingSchedule> getAllSchedules();
	
	void getFeedingScheduleByID(long id);

	boolean saveAddedFeedingSchedule(FeedingSchedule a) throws Exception;

	void saveUpdateFeedingSchedule(long id);
	
	void deleteUpdateFeedingSchedule(long id);

}
