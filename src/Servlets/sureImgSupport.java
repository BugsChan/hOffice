package Servlets;

import java.io.IOException;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Service.ImgFactory;

public class sureImgSupport extends HttpServlet{
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		res.setHeader("Access-Control-Allow-Origin", "*");
		ImgFactory img=new ImgFactory(80, 40);
		try {
			HttpSession session=req.getSession(false);
			if(session==null){
				System.out.println("session==null");
				return;
			}
			session.setAttribute("suredId", img.getContent());
			ImageIO.write(img.getBufferedImage(), "JPEG", res.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
