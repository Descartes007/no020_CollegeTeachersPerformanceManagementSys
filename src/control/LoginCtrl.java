package control;

import dao.CommDAO;
import dao.Query;
import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import util.Info;

/**
 * 前台、后台、登录。
 * 和修改密码项
 */
public class LoginCtrl extends HttpServlet {

    // 构造函数
    public LoginCtrl() {
        super();
    }

    // 析构函数
    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
        // Put your code here
    }

    // get 访问得时候运行这个方法
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 将get 方法得内容运行到Post 方法中
        this.doPost(request, response);
    }

    // 输出弹出框、并跳转到指定页面
    public void go(String url, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 获取输出流
            PrintWriter out = response.getWriter();
            // 输出到控制台
            System.out.println(request.getAttribute("error"));
            // 判断有没有错误、有得话就输出弹出框
            if (request.getAttribute("error") != null) {
                out.println("<script>alert('" + request.getAttribute("error") + "');location.href='" + url + "'</script>");
                out.close();
                return;
            }
            // 加载指定jsp 页面、
            request.getRequestDispatcher(url).forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 跳转到某个页面
    public void gor(String url, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 执行页面跳转
            response.sendRedirect(url);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    // 执行post 方法
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设定编码为 utf-8
        response.setContentType("text/html;charset=utf-8");
        // 获取输出流
        PrintWriter out = response.getWriter();
        // 判断执行那个 if 判断内容
        String ac = request.getParameter("ac");
        if (ac == null) ac = "";
        // 生成数据库查询对象
        CommDAO dao = new CommDAO();
        // 获取当前时间
        String date = Info.getDateStr();
        // 获取当前日期
        String today = date.substring(0, 10);
        // 获取当前年月
        String tomonth = date.substring(0, 7);

        // 前台登录代码
        if (ac.equals("login")) {
            // 获取前台填写得账号
            String username = request.getParameter("username");
            // 获取前台填写得密码
            String password = request.getParameter("pwd");
            // 判断页面上选择的权限
            String utype = request.getParameter("cx");
            // 获取填写得验证码
            String pagerandom = request.getParameter("pagerandom") == null ? "" : request.getParameter("pagerandom");
            // 获取生成验证码时保存在session 中得验证码
            String random = (String) request.getSession().getAttribute("random");
            // 对比验证码是否正确、不正确则输出验证码错误
            if (!pagerandom.equals(random) && request.getParameter("a") != null) {
                request.setAttribute("error", "验证码错误");
                go("index.jsp", request, response);
            } else {
                String sql1 = "";

                // 查询数据库中得信息判断账号密码得正确性
                Map map = dao.find(sql1);
                // map 不为空则是登录成功
                if (!map.isEmpty()) {
                    // 获取数据循环
                    Iterator iter = map.keySet().iterator();
                    // 设置session
                    request.getSession().setAttribute("username", username);
                    request.getSession().setAttribute("login", utype);
                    request.getSession().setAttribute("cx", utype);

                    while (iter.hasNext()) {
                        // 这个循环设置用户得信息进session 中
                        String key = (String) iter.next();
                        String val = (String) map.get(key);
                        request.getSession().setAttribute(key, val);
                    }
                    // 跳转到index.jsp
                    gor("index.jsp", request, response);
                } else {
                    // 否则提示账号或密码错误
                    request.setAttribute("error", "账号或密码错误");
                    go("index.jsp", request, response);
                }
            }
        }
        // 后台登录
        if (ac.equals("adminlogin")) {
            // 后台管理员登录
            // 获取前台填写得账号
            String username = request.getParameter("username");
            // 获取前台填写得密码
            String password = request.getParameter("pwd");
            // 判断页面上选择的权限
            String utype = request.getParameter("cx");
            // 获取填写得验证码
            String pagerandom = request.getParameter("pagerandom") == null ? "" : request.getParameter("pagerandom");
            // 获取生成验证码时保存在session 中得验证码
            String random = (String) request.getSession().getAttribute("random");
            // 对比验证码是否正确、不正确则输出验证码错误
            if (!pagerandom.equals(random) && request.getParameter("a") != null) {
                request.setAttribute("error", "验证码错误");
                go("login.jsp", request, response);
            } else {
                String sql1 = "";

                if (utype.equals("管理员")) {
                    sql1 = "select * from admins where username='" + username + "' and pwd='" + password + "' ";
                }
                if (utype.equals("教师")) {
                    sql1 = "select * from jiaoshi where username='" + username + "' and pwd='" + password + "' ";
                }

                // 查询数据库中得信息判断账号密码得正确性
                Map map = dao.find(sql1);
                // map 不为空则是登录成功
                if (!map.isEmpty()) {
                    // 获取数据循环
                    Iterator iter = map.keySet().iterator();
                    // 设置session
                    request.getSession().setAttribute("username", username);
                    request.getSession().setAttribute("cx", utype);
                    request.getSession().setAttribute("login", utype);
                    while (iter.hasNext()) {
                        // 这个循环设置用户得信息进session 中
                        String key = (String) iter.next();
                        String val = (String) map.get(key);
                        request.getSession().setAttribute(key, val);
                    }
                    // 跳转到main.jsp
                    gor("main.jsp", request, response);
                } else {
                    // 否则提示账号或密码错误
                    request.setAttribute("error", "账号或密码错误");
                    go("login.jsp", request, response);
                }
            }
        }

        //修改密码
        if (ac.equals("adminuppass")) {
            // 获取前台填写得原密码
            String olduserpass = request.getParameter("ymm");
            // 获取前台填写得新密码
            String userpass = request.getParameter("xmm1");
            // 获取前台填写得确认密码
            String copyuserpass = request.getParameter("xmm2");
            //  println(Info.getUser(request).get("id").toString());
            // 判断当前权限p
            String cx = (String) request.getSession().getAttribute("login");
            //String oldPassword = "";
            // 获取当前登录用户的账号
            String username = request.getSession().getAttribute("username").toString();
            Map m = null;
            String biao = "";
            if (cx.equals("管理员")) {
                biao = "admins";
                m = Query.make(biao).where("username", username).where("pwd", olduserpass).find();
                // dao.getmaps("username", (String) request.getSession().getAttribute("username"), "admins");
            }
            if (cx.equals("教师")) {
                biao = "jiaoshi";
                m = Query.make(biao).where("username", username).where("pwd", olduserpass).find();
                // dao.getmaps("username", (String) request.getSession().getAttribute("username"), "jiaoshi");
            }

            // 尝试登录一下原密码、如果为null  或 空map则提示原密码错误
            if (m == null || m.isEmpty()) {
                // 提示原密码错误
                request.setAttribute("error", "原密码错误");
                go("mod.jsp", request, response);
            } else {
                //String id = (String)user.get("id");
                // 否则更新成新密码
                String sql = "";
                if (cx.equals("管理员")) {
                    sql = "UPDATE admins SET pwd='" + userpass + "' WHERE username='" + username + "'";
                }
                if (cx.equals("教师")) {
                    sql = "UPDATE jiaoshi SET pwd='" + userpass + "' WHERE username='" + username + "'";
                }

                //执行更新密码
                dao.commOper(sql);
                //  提示密码修改成功
                request.setAttribute("error", "密码修改成功");
                go("mod.jsp", request, response);
            }
        }

        dao.close();
        out.flush();
        out.close();
    }

    public void init() throws ServletException {
        //
    }
}
