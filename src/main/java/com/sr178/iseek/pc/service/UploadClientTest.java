package com.sr178.iseek.pc.service;

import java.io.File;
import java.io.IOException;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.sr178.game.framework.log.LogSystem;

public class UploadClientTest {

    public static void main(String[] args) throws ClientProtocolException, IOException {
    	String url="http://localhost:8083/uploadFiles";
        HttpClient httpclient= new DefaultHttpClient();
        HttpPost httpPost= new HttpPost(url);
        MultipartEntity mulentity = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE);
           mulentity.addPart("tokenId", new StringBody("bc0f2c68-0640-45aa-9cfd-c447b7914903"));
           mulentity.addPart("taskId", new StringBody("4"));
           mulentity.addPart("type", new StringBody("2"));
           File image1 = new File("E:\\图片\\58-110R31U14786.jpg");
           File image2 = new File("E:\\图片\\11.jpg");
          //添加图片表单数据       
           FileBody filebody1 = new FileBody(image1);
           FileBody filebody2 = new FileBody(image2);
           mulentity.addPart("images",filebody1);
           mulentity.addPart("images",filebody2);
           httpPost.setEntity(mulentity);
           HttpResponse response =    httpclient.execute(httpPost);
           
           if(response.getStatusLine().getStatusCode()==HttpStatus.SC_OK)
           {
               LogSystem.info("上传返回结果为！！~~result="+EntityUtils.toString(response.getEntity(), "utf-8"));
           }
           else
           {
        	   LogSystem.info("上传失败");
           }
	}
}
