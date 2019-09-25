package com.shop.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;

public class UploadUtil {
	// 首先定义一些属性
	//默认存储位置
	private String path = "upload";
	// 上传允许的格式
	private String allowed = "jpg,png,gif,bmp";
	// 文件总大小
	private int totalmax = 10 * 1024 * 1024;
	// 单个文件大小
	private int singlesize = 5 * 1024 * 1024;

	public UploadUtil(String path, String allowed, int totalmax, int singlesize) {
		super();
		this.path = path;
		this.allowed = allowed;
		this.totalmax = totalmax;
		this.singlesize = singlesize;
	}

	public UploadUtil() {
		super();
	}

	// 上传文件
	public List<String> uploadFiles(PageContext pageContext) {
		List<String> list = new ArrayList<String>();

		try {
			SmartUpload su = new SmartUpload();
			// 初始化
			su.initialize(pageContext);
			// 允许上传的文件格式
			su.setAllowedFilesList(allowed);
			// 设置编码集
			su.setCharset("utf-8");
			// 设置总大小
			su.setTotalMaxFileSize(totalmax);
			// 设置单个文件大小
			su.setMaxFileSize(singlesize);

			// 开始上传
			su.upload();

			// 得到上传的文件
			if (su.getFiles() != null && su.getFiles().getCount() > 0) {
				// 有文件
				Files fs = su.getFiles();
				// 循环
				for (int i = 0, len = fs.getCount(); i < len; ++i) {
					String fname = "";
					File f = fs.getFile(i);

					// 文件保存的名字
					fname = path + "/" + new Date().getTime() + new Random().nextInt(100000) + "." + f.getFileExt();
					// 上传
					f.saveAs(fname, SmartUpload.SAVE_VIRTUAL);
					list.add(fname);
					//System.out.println(fname);
				}
			}
		} catch (Exception e) {
			//e.printStackTrace();
			return null;
		}
		return list;
	}

}
