package com.market.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * @Auther:jiaxuan
 * @Date: 2019/2/20 0020 16:38
 * @Description:
 */
public class StringUtils {
    public static String renameFileName(String fileName){
        int dotIndex = fileName.lastIndexOf(".");
        String suffix=fileName.substring(dotIndex);
        return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+ new Random().nextInt(100)+suffix;

    }
}
