package io.tech.blog.helper;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.regex.Pattern;

import org.apache.catalina.tribes.util.Arrays;

public class Helper {

	public static boolean deleFile(String path) {
		File file = new File(path);
		return file.delete();
	}

	public static boolean saveFile(InputStream is, String path) {
		boolean flag = false;
		try {
			byte[] data = new byte[is.available()];
			is.read(data);
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.flush();
			fos.close();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public static String getProfileName(String profile, int userID) {
		return profile.replace(".", "_" + userID + ".");
	}
}
