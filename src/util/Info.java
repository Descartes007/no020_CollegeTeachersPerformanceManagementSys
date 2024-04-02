package util;

import com.jntoo.db.utils.DownloadRemoteImage;
import javax.servlet.http.HttpServletRequest;

/**
 * Info 工具类
 */
public class Info extends com.jntoo.db.utils.InfoUtil {

    /**
     * 下载内容
     * @param content 待下载的内容
     * @return 返回下载后的内容
     */
    public static String download(String content) {
        HttpServletRequest request = Request.getRequest(); // 获取当前运行的目录
        String savePath = request.getSession().getServletContext().getRealPath("/"); // 保存位置
        return DownloadRemoteImage.run(content, savePath, "./upload"); // 将下载的内容保存在网站中
    }
}
