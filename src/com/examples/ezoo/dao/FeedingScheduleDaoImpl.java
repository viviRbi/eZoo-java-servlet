package com.examples.ezoo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.examples.ezoo.model.FeedingSchedule;

public class FeedingScheduleDaoImpl implements FeedingScheduleDAO{

	@Override
	public List<FeedingSchedule> getAllSchedules() {
		Connection connection = null;
		Statement stmt = null;
		List<FeedingSchedule> schedules = new ArrayList<>();
		
		try {
			connection = DAOUtilities.getConnection();

			stmt = connection.createStatement();

			String sql = "SELECT * FROM feeding_schedules";

			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				FeedingSchedule a = new FeedingSchedule();

				a.setSchedule_ID(rs.getLong("schedule_id"));
				a.setFeeding_time(rs.getString("feeding_time"));
				a.setRecurrence(rs.getString("recurrence"));
				a.setFood(rs.getString("food"));
				a.setNotes(rs.getString("notes"));

				schedules.add(a);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return schedules;
	}

	@Override
	public boolean saveAddedFeedingSchedule(FeedingSchedule a) throws Exception {
		Connection connection = null;
		PreparedStatement stmt = null;
		int success = 0;

		try {
			connection = DAOUtilities.getConnection();
			String sql = "INSERT INTO feeding_schedules VALUES (?,?,?,?,?)";

			// Setup PreparedStatement
			stmt = connection.prepareStatement(sql);

	
			// Add parameters from animal into PreparedStatement
			stmt.setLong(1, a.getSchedule_ID());
			stmt.setString(2, a.getFeeding_time());
			stmt.setString(3,a.getRecurrence());
			stmt.setString(4,a.getFood());
			stmt.setString(5,a.getNotes());

			
			success = stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (success == 0) {
			// then update didn't occur, throw an exception
			throw new Exception("Insert schedule failed: " + a);
			
		} else return true;
	}

	@Override
	public void saveUpdateFeedingSchedule(long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getFeedingScheduleByID(long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUpdateFeedingSchedule(long id) {
		// TODO Auto-generated method stub
		
	}



}
