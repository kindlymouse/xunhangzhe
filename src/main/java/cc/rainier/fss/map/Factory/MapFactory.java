package cc.rainier.fss.map.Factory;

import cc.rainier.fss.map.dao.IMapService;
import cc.rainier.fss.map.dao.impl.SQLiteMapService;

public class MapFactory {
	public static IMapService CreateInstance(){
		return new SQLiteMapService();
	}
}