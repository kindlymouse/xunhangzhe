package cc.rainier.fss.map.dao.impl;

import cc.rainier.fss.map.dao.IMapService;

import java.io.File;
import java.io.FileInputStream;
import java.sql.*;
import java.util.Properties;

public class SQLiteMapService implements IMapService {
	
	private static String mapFile;
	
	public SQLiteMapService() {
		mapFile = GetMapPath();
	}
	
	public byte[] Query(String sql) throws SQLException {
        byte[] bytes = null;
		Connection connection = null;
		Statement statement = null;
        ResultSet rs = null;
		try {
			Class.forName("org.sqlite.JDBC");
			
			connection = DriverManager.getConnection("jdbc:sqlite:" + mapFile);
			statement = connection.createStatement();
			rs = statement.executeQuery(sql);
            if(rs.next()){
               bytes = rs.getBytes("map");
            }
		} catch (ClassNotFoundException e) {
			System.out.print("SQLite Driver not Find");
		} catch (SQLException ex){
			throw ex;
		} finally {
            if(rs!=null)rs.close();
			if(statement!=null)statement.close();
			if(connection!=null)connection.close();
		}
		return bytes;
	}
	
	private  String GetMapPath(){
		Properties prop = new Properties();
		ClassLoader loader = SQLiteMapService.class.getClassLoader();
		String path = SQLiteMapService.class.getName();
		path = path.replaceAll("\\.", "\\/");
		path += ".class";
		
		String pagePath = loader.getResource(path).getPath();
		pagePath = pagePath.substring(0, pagePath.indexOf("WEB-INF"));
	
		if (pagePath.indexOf("file:") != -1) {
			pagePath = pagePath.replace("file:", "");
		}
		String filePath = pagePath + "WEB-INF/classes/map_config.properties";
		File file = new File(filePath);
		String result = "";
		if (file.exists()) {
			try {
				prop.load(new FileInputStream(file));
				result = prop.getProperty("MapPath");
				
			} catch(Exception e){e.printStackTrace();}
		}
		return result;
	}
}
