package com.acorn.tour.view;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class ViewRepository {
	
	@Autowired
	DataSource ds;
	
	@Autowired
	private SqlSession sqlsession;
	
	private static String namespace = "com.acorn.tour.ContentMapper.";
	
	// 조회수 증가
	public void updateContentView(String contentid) {
		sqlsession.update(namespace + "updateContentView", contentid);
	}
	
	
}
