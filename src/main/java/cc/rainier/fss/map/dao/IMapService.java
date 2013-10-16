package cc.rainier.fss.map.dao;

import java.sql.SQLException;

public interface IMapService {
	byte[] Query(String sql) throws SQLException;
}
