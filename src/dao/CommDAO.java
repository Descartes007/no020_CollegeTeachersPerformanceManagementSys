package dao;

import com.jntoo.db.utils.StringUtil;
import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import util.Info;

/**
 * 数据库连接类
 */
public class CommDAO {

    // 你的账号和密码
    // 数据库名称
    public static final String database = "no020_jsjxkhxt";
    // 数据库账号
    public static final String username = "root";
    // 数据库密码
    public static final String pwd = "1025";
    // 是否为 mysql8.0及以上、如果是则把 false 改成 true
    public static final boolean isMysql8 = false; // 是否为mysql8
    public static Connection conn = null;

    /**
     * 创建类时即连接数据库
     */
    public CommDAO() {
        conn = this.getConn();
    }

    /**
     * 数据库链接类
     * @return
     */
    public static Connection getConn() {
        try {
            if (conn == null || conn.isClosed()) {
                String connstr = getConnectString();
                conn = DriverManager.getConnection(connstr, username, pwd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static String getConnectString() {
        try {
            String connstr;
            if (!isMysql8) {
                Class.forName("com.mysql.jdbc.Driver");
                connstr = String.format("jdbc:mysql://localhost:3306/%s?useUnicode=true&characterEncoding=UTF-8&useOldAliasMetadataBehavior=true", database);
            } else {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connstr =
                    String.format(
                        "jdbc:mysql://localhost:3306/%s?useUnicode=true&characterEncoding=UTF-8&useSSL=FALSE&serverTimezone=UTC&useOldAliasMetadataBehavior=true",
                        database
                    );
            }
            return connstr;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 根据表ID 获取数据
     * @param id   数值
     * @param table 表名称
     * @return
     */
    public HashMap getmap(String id, String table) {
        List<HashMap> list = new ArrayList();
        try {
            Statement st = conn.createStatement();
            //System.out.println("select * from "+table+" where id="+id);
            ResultSet rs = st.executeQuery("select * from " + table + " where id=" + id);
            ResultSetMetaData rsmd = rs.getMetaData();
            while (rs.next()) {
                HashMap map = new HashMap();
                int i = rsmd.getColumnCount();
                for (int j = 1; j <= i; j++) {
                    if (!rsmd.getColumnName(j).equals("ID")) {
                        String str = rs.getString(j) == null ? "" : rs.getString(j);
                        if (str.equals("null")) str = "";
                        map.put(rsmd.getColumnName(j), str);
                    } else map.put("id", rs.getString(j));
                }
                list.add(map);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list.get(0);
    }

    /**
     * 根据sql 语句获取一行数据
     * @param sql
     * @return
     */
    public HashMap find(String sql) {
        HashMap map = new HashMap();

        //List<HashMap> list = new ArrayList();
        try {
            Statement st = conn.createStatement();
            System.out.println(sql);
            ResultSet rs = st.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();
            while (rs.next()) {
                //HashMap map = new HashMap();
                int i = rsmd.getColumnCount();
                for (int j = 1; j <= i; j++) {
                    if (!rsmd.getColumnName(j).equals("ID")) {
                        String str = rs.getString(j) == null ? "" : rs.getString(j);
                        if (str.equals("null")) str = "";
                        map.put(rsmd.getColumnName(j), str);
                    } else map.put("id", rs.getString(j));
                }
                //list.add(map);
                break;
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            //e.printStackTrace();
            int code = e.getErrorCode();
            String message = e.getMessage();
            System.err.println("SQL execute Error");
            System.err.println("code:" + code);
            System.err.println("Message:" + message);
        }
        return map;
    }

    /**
     * 根据某字段的值获取一行数据
     * @param nzd  字段名称
     * @param zdz  条件值
     * @param table  表
     * @return
     */
    public HashMap getmaps(String nzd, String zdz, String table) {
        List<HashMap> list = new ArrayList();
        try {
            Statement st = conn.createStatement();
            //System.out.println("select * from "+table+" where "+nzd+"='"+zdz+"'");
            ResultSet rs = st.executeQuery("select * from " + table + " where " + nzd + "='" + zdz + "'");
            ResultSetMetaData rsmd = rs.getMetaData();
            while (rs.next()) {
                HashMap map = new HashMap();
                int i = rsmd.getColumnCount();
                for (int j = 1; j <= i; j++) {
                    if (!rsmd.getColumnName(j).equals("ID")) {
                        String str = rs.getString(j) == null ? "" : rs.getString(j);
                        if (str.equals("null")) str = "";
                        map.put(rsmd.getColumnName(j), str);
                    } else map.put("id", rs.getString(j));
                }
                list.add(map);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list.get(0);
    }

    /**
     * 获取前台提交的数据将数据写成Map<String , String> 形式，方便写入数据库
     * @param request
     * @return 返回值类型为Map<String, String>
     */
    public static HashMap getParameterStringMap(HttpServletRequest request) {
        Map<String, String[]> properties = request.getParameterMap(); //把请求参数封装到Map<String, String[]>中
        HashMap returnMap = new HashMap<String, String>();
        String name = "";
        String value = "";
        for (Map.Entry<String, String[]> entry : properties.entrySet()) {
            name = entry.getKey();
            String[] values = entry.getValue();
            if (null == values) {
                value = "";
            } else {
                value = StringUtil.join(",", values); //用于请求参数中请求参数名唯一
            }
            returnMap.put(name, value);
        }
        return returnMap;
    }

    /**
     * 插入数据库
     * @param request
     * @param tablename
     * @param extmap
     * @return
     */
    public String insert(HttpServletRequest request, String tablename, HashMap extmap) {
        extmap.put("addtime", Info.getDateStr()); // 设置添加时间为当前时间

        Query query = new Query(tablename); // 新建查询模块
        HashMap post = getParameterStringMap(request); // 获取前台提交的数据将数据写成Map对象
        post.putAll(extmap); //  扩展的数据以覆盖方式写到提交的数据中
        return query.add(post); // 将数据生成sql insert语句,并执行,可以查看输出控制台中执行的SQL语句
    }

    /**
     * 删除数据
     * @param request
     * @param tablename 表名称
     */
    public void delete(HttpServletRequest request, String tablename) {
        int i = 0;
        try {
            String did = request.getParameter("did");
            if (did == null) did = request.getParameter("scid");
            if (did == null) did = request.getParameter("id");
            if (did != null) {
                if (did.length() > 0) {
                    Statement st = conn.createStatement();
                    System.out.println("delete from " + tablename + " where id=" + did);
                    st.execute("delete from " + tablename + " where id=" + did);
                    st.close();
                }
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            //e.printStackTrace();
            int code = e.getErrorCode();
            String message = e.getMessage();
            System.err.println("SQL execute Error");
            System.err.println("code:" + code);
            System.err.println("Message:" + message);
        }
    }

    /**
     * 获取某表一列数据
     * @param table
     * @return
     */
    public String getCols(String table) {
        String str = "";
        Connection conn = this.getConn();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from " + table);
            ResultSetMetaData rsmd = rs.getMetaData();

            int i = rsmd.getColumnCount();
            for (int j = 2; j <= i; j++) {
                str += rsmd.getColumnName(j) + ",";
            }
        } catch (SQLException e) {
            int code = e.getErrorCode();
            String message = e.getMessage();
            System.err.println("SQL execute Error");
            System.err.println("code:" + code);
            System.err.println("Message:" + message);
            //e.printStackTrace();
        }
        str = str.substring(0, str.length() - 1);

        return str;
    }

    /**
     * 更新数据
     * @param request
     * @param tablename
     * @param extmap
     * @return
     */
    public String update(HttpServletRequest request, String tablename, HashMap extmap) {
        Query query = new Query(tablename);
        HashMap post = getParameterStringMap(request);
        post.putAll(extmap);
        if (query.save(post)) {
            return String.valueOf(post.get("id"));
        }
        return "";
    }

    /**
     * 执行sql 语句
     * @param sql
     * @return
     */
    public long commOper(String sql) {
        System.out.println(sql);
        long autoInsertId = -1;
        try {
            Statement st = conn.createStatement();
            st.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = st.getGeneratedKeys();

            while (rs.next()) {
                autoInsertId = rs.getLong(1);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            //e.printStackTrace();
            int code = e.getErrorCode();
            String message = e.getMessage();
            System.err.println("SQL execute Error");
            System.err.println("code:" + code);
            System.err.println("Message:" + message);
        }
        return autoInsertId;
    }

    /**
     * 执行多条SQL语句
     * @param sql
     */
    public void commOperSqls(ArrayList<String> sql) {
        try {
            conn.setAutoCommit(false);
            for (int i = 0; i < sql.size(); i++) {
                Statement st = conn.createStatement();
                System.out.println(sql.get(i));
                st.execute(sql.get(i));
                st.close();
            }
            conn.commit();
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                //e1.printStackTrace();
                int code = e1.getErrorCode();
                String message = e1.getMessage();
                System.err.println("SQL execute Error");
                System.err.println("code:" + code);
                System.err.println("Message:" + message);
            }
            e.printStackTrace();
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException e) {
                int code = e.getErrorCode();
                String message = e.getMessage();
                System.err.println("SQL execute Error");
                System.err.println("code:" + code);
                System.err.println("Message:" + message);
                //e.printStackTrace();
            }
        }
    }

    /**
     * 根据SQL语句获取数据行
     * @param sql
     * @return
     */
    public List select(String sql) {
        System.out.println(sql);
        List<HashMap> list = new ArrayList();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();

            while (rs.next()) {
                HashMap map = new HashMap();
                int i = rsmd.getColumnCount();
                for (int j = 1; j <= i; j++) {
                    if (!rsmd.getColumnName(j).equals("ID")) {
                        String str = rs.getString(j) == null ? "" : rs.getString(j);
                        if (str.equals("null")) str = "";
                        map.put(rsmd.getColumnName(j), str);
                    } else map.put("id", rs.getString(j));
                }
                list.add(map);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block

            if (sql.equals("show tables")) list = select("select table_name from   INFORMATION_SCHEMA.tables"); else {
                int code = e.getErrorCode();
                String message = e.getMessage();
                System.err.println("SQL execute Error");
                System.err.println("code:" + code);
                System.err.println("Message:" + message);
            }
            //e.printStackTrace();
        }
        return list;
    }

    public void close() {}

    /**
     * 执行一条查询sql,以 List<hashmap> 的形式返回查询的记录，记录条数，和从第几条开始，由参数决定，主要用于翻页
     * pageno 页码  rowsize 每页的条数
     */
    public List select(String sql, int pageno, int rowsize) {
        List<HashMap> list = new ArrayList();
        List<HashMap> mlist = new ArrayList();
        try {
            list = this.select(sql);
            int min = (pageno - 1) * rowsize;
            int max = pageno * rowsize;

            for (int i = 0; i < list.size(); i++) {
                if (!(i < min || i > (max - 1))) {
                    mlist.add(list.get(i));
                }
            }
        } catch (RuntimeException re) {
            re.printStackTrace();
            throw re;
        }
        return mlist;
    }

    public static void main(String[] args) {}
}
