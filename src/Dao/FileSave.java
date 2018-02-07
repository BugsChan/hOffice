package Dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;

public class FileSave {
	private static final int DEFAULT_BUFFER_SIZE = 1024 * 4;
	
	/**
	 * 
	 * @param input 输入流
	 * @param relativePath 相对路径
	 * @param context ServletContext
	 * @param max 最大输入字节
	 * @param append 是否继续写入
	 * @param remove 出现错误时是否删除
	 * @return
	 */
	public static boolean save(
			InputStream input
			,String relativePath
			,ServletContext context
			,int max
			,boolean append
			,boolean remove)
	{
		return save(input,context.getRealPath(relativePath),max,append,remove);
	}
	
	public static boolean save(
			InputStream input
			,String realPath
			,int max
			,boolean append
			,boolean remove)
	{
		File file=new File(realPath);
		try {
			if(!save(input,new FileOutputStream(file,append),max)){
				if(file.exists()&&remove)file.delete();
				return false;
			}
		} catch (IOException e) {
			if(file.exists()&&remove)file.delete();
			return false;
		}
		return true;		
	}
	
	
	
	//Following are base functions 
	public static boolean save(InputStream input,OutputStream output,int max)
	{
		try{
			return copy(input,output,max);
		}catch(IOException e){
			return false;
		}finally{
			IOUtils.closeQuietly(output);
			IOUtils.closeQuietly(input);
		}
	}
	
	private static boolean copy(InputStream input, OutputStream output,int max)
            throws IOException
	{
        byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];
        int count = 0;
        int n = 0;
        while (-1 != (n = input.read(buffer))) {
        	if(count>max) return false;
            output.write(buffer, 0, n);
            count += n;
        }
        return true;
    }
}
