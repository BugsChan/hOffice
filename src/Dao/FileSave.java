package Dao;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletContext;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

public class FileSave {
	private static final int DEFAULT_BUFFER_SIZE = 1024 * 4;
	public static boolean save(InputStream input,String relativePath,ServletContext context,int max){
		return save(input,context.getRealPath(relativePath),max);
	}
	public static boolean save(InputStream input,String realPath,int max){
		return save(input,new File(realPath),max);
	}	
	public static boolean save(InputStream input,File file ,int max){		
		try {
			if(!save(input,FileUtils.openOutputStream(file),max)){
				if(file.exists())file.delete();
				return false;
			}
		} catch (IOException e) {
			return false;
		}
		return true;		
	}
	public static boolean save(InputStream input,OutputStream output,int max) throws IOException{
		try{
			return copy(input,output,max);
		}catch(IOException e){}finally{
			IOUtils.closeQuietly(output);
			IOUtils.closeQuietly(input);
		}
		return false;
	}
	
	public static boolean copy(InputStream input, OutputStream output,int max)
            throws IOException{
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
