package cc.rainier.fss.map.servlet;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cc.rainier.fss.map.dao.IMapService;
import cc.rainier.fss.map.Factory.*;

/**
 * 功能描述：Google地图(基于SQLite数据库存储)访问接口Java版
 */
public class Map extends HttpServlet {

    private IMapService service = null;

    public Map() {
        super();
    }

    /**
     * Destruction of the servlet. <br>
     */
    public void destroy() {
        super.destroy();
    }

    /***************************************************************************
     * 请求地址：http://ip:port/MapService/servlet/Map?t=street&z={0}&x={1}&y={2}
     * 请求地址：http://ip:port/MapService/servlet/Map?t=street&z=07&x=000022&y=000049
     **************************************************************************/
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取HTTP请求参数
        String x = request.getParameter("x");
        x = String.valueOf(Integer.parseInt(x) + 1);
        int numLen = x.length();
        if(numLen<6){
            for(int i=0;i<6-numLen;i++) { x = "0" + x;}
        }
        String y = request.getParameter("y");
        y = String.valueOf(Integer.parseInt(y) + 1);
        numLen = y.length();
        if(numLen<6){
            for(int i=0;i<6-numLen;i++) { y = "0" + y;}
        }
        String z = request.getParameter("z");
        z = String.valueOf(Integer.parseInt(z) + 1);
        numLen = z.length();
        if(numLen<2){
            for(int i=0;i<2-numLen;i++) { z = "0" + z;}
        }
        String type = request.getParameter("t");

        String name = x + "-" + y;
        String table = "map_" + z + "_" + type;
        String sql = "select map from " + table + " where name='" + name + "'";

        if (type != null && type == "sat") {
            response.setContentType("image/jpg");
        } else if(type != null &&  type == "satmark"){
            response.setContentType("image/png");
        } else if(type != null && type == "street"){
            response.setContentType("image/png");
        }
        ServletOutputStream out = response.getOutputStream();
        try {
            byte[] data = service.Query(sql);
            if(data!=null){
                InputStream stream = new ByteArrayInputStream(data);

                int len;
                byte buf[] = new byte[1024];
                while ((len = stream.read(buf,0,1024))!= -1) {
                    out.write(buf,0,len);
                }
            }
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        out.flush();
        out.close();
    }

    public void init() throws ServletException {
        this.service = MapFactory.CreateInstance();
        System.out.print("地图服务接口初始化成功。\r\n");
    }
}
