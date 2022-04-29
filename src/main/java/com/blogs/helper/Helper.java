package com.blogs.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper
{
	public static boolean deleteFile(String path)
	{
		boolean status = false;
		try 
		{
			File file = new File(path);
			status = file.delete();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return status;
	}
	public static boolean saveFile(InputStream is,String path)
	{
		boolean status = false;
		try
		{
			byte b[] = new byte[is.available()];
			is.read(b);
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			status = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}

}
