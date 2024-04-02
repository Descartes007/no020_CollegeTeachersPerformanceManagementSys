package dao;

import com.jntoo.db.Configuration;
import com.jntoo.db.ConnectionConfig;
import com.jntoo.db.QueryConfig;
import com.jntoo.db.QueryWrapperBase;
import com.jntoo.db.utils.CollectUtil;
import java.sql.Connection;
import java.util.List;
import java.util.Map;
import util.Request;

/**
 * 原方式：DB.name()进行增删改查操作
 * 使用方法：Query.make("表名称").where("字段名" , "条件符号","条件值").select()
 * 查看下方的文档链接查看使用方法
 * @see [f.length - 1] https://gitee.com/jntoo/query
 *
 */
public class Query extends QueryWrapperBase<Map, Query> {
    static {
        // 配置数据库访问
        QueryConfig queryConfig = new QueryConfig();
        // 配置数据库访问链接获取
        queryConfig.setConnectionConfig(
            new ConnectionConfig() {
                public Connection getConn() {
                    return CommDAO.getConn();
                }

                public void closeConn(Connection connection) {}
            }
        );
        // 设置为调试模式
        queryConfig.setDebug(true);
        // 设置表前缀访问
        queryConfig.setPrefix("");
        // 写入配置信息
        Configuration.setQueryConfig(queryConfig);
    }

    // 数据库查询
    public Query() {}

    // 构造类

    /**
     * 构造类
     * @param name 表名称，不带前缀
     */
    public Query(String name) {
        super(name);
    }

    //
    public static Query make(String name) {
        return new Query(name);
    }

    /**
     * 添加一行数据
     * @param data Map 数据
     * @return 插入后的自增id值
     */
    public String add(Map data) {
        return String.valueOf(insert(data));
    }

    /**
     * 更新一行数据
     * @param data 待更新的数据
     * @return 结果为真
     */
    public boolean save(Map data) {
        update(data);
        return true;
    }

    // 生成分页信息
    public dao.Collect page(Integer pagesize) {
        int page = Request.getInt("page", 1); // 获取当前为第几页
        page = Math.max(page, 1); //  最小为第一页

        CollectUtil collect = new CollectUtil(page, pagesize); // 创建分页对象
        collect = super.page(collect); // 查询列表并分页

        List list = collect.getLists(); // 获取查询的列表信息
        dao.Collect lists = new dao.Collect(collect.getTotalRows(), pagesize); // 生成分页的html 代码
        lists.addAll(list); // 将数据插入到list 中
        return lists;
    }
}
