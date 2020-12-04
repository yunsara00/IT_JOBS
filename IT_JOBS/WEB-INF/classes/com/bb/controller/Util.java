package com.bb.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
public class Util {
	
	 
	public static class GetImage {
	
	 
	    public void main(String[] args){
	 
	        GetImage getImage = new GetImage();
	        
	        
	 
	        String strUrl = "http://localhost:8787/IT_JOBS_RS3/resources/images/"; //불러올 URL
	 
	        try {
	 
	            getImage.saveImage(strUrl);
	 
	        } catch (IOException e) {
	 
	            e.printStackTrace();
	 
	        }
	 
	    }
	 
	    private void saveImage(String strUrl) throws IOException {
	 
	        URL url = null;
	        InputStream in = null;
	        OutputStream out = null;
	 
	        try {
	 
	            url = new URL(strUrl);
	 
	            in = url.openStream();
	 
	            out = new FileOutputStream("http://localhost:8787/IT_JOBS_RS3/resources/images/"); //저장경로
	 
	            while(true){
	                //이미지를 읽어온다.
	                int data = in.read();
	                if(data == -1){
	                    break;
	                }
	                //이미지를 쓴다.
	                out.write(data);
	 
	            }
	 
	            in.close();
	            out.close();
	 
	        } catch (Exception e) {
	 
	            e.printStackTrace();
	 
	        }finally{
	 
	            if(in != null){in.close();}
	            if(out != null){out.close();}
	 
	        }
	    }
	 
	}
	public static String imgUrl(String imgName) {
		String rs_img_path = "resources/images/"+imgName;
		
		return rs_img_path;
	}

}
