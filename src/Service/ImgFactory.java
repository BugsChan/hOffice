package Service;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;

public class ImgFactory {
	private BufferedImage bi;
	private String content="";
	public ImgFactory(int width,int height){
		bi=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		Graphics g=bi.createGraphics();
		g.setColor(Color.white);
		g.fillRect(0, 0, width, height);
		
		String[] fontTypes={"宋体","微软雅黑","Courier New"};
		String contents="abdefghijkmnpqrtABDEFGHIJKMNPQRT123456789";
		int[] fontStyles={0,1,2,3};
		Color[] colors={Color.BLACK,Color.BLUE,Color.RED,Color.GREEN,Color.PINK};
		
		String content;
		for(int i=0;i<4;i++){
			content=contents.charAt((int)(Math.random()*contents.length()))+"";
			this.content+=content;
			g.setColor(colors[(int)(Math.random()*colors.length)]);
			g.setFont(new Font(fontTypes[(int)(Math.random()*3)],fontStyles[(int)(Math.random()*4)],30));
			g.drawString(content, width/4*i, height-7);
			g.setColor(colors[(int)(Math.random()*colors.length)]);
			g.drawLine((int)(Math.random()*width), (int)(Math.random()*height),(int)(Math.random()*width), (int)(Math.random()*height));
		}
	}
	public String getContent(){
		return content;
	}
	public BufferedImage getBufferedImage(){
		return bi;
	}
}