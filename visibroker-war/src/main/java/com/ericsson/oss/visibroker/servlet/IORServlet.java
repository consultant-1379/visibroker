/*------------------------------------------------------------------------------
 *******************************************************************************
 * COPYRIGHT Ericsson 2012
 *
 * The copyright to the computer program(s) herein is the property of
 * Ericsson Inc. The programs may be used and/or copied only with written
 * permission from Ericsson Inc. or in accordance with the terms and
 * conditions stipulated in the agreement/contract under which the
 * program(s) have been supplied.
 *******************************************************************************
 *----------------------------------------------------------------------------*/
package com.ericsson.oss.visibroker.servlet;

import java.io.*;
import java.net.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/IORServlet")
public class IORServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
		makeRestCall(getURI(req),resp);
		
	}
	
	private void makeRestCall(String uri,HttpServletResponse resp){
		try {
			 
			URL url = new URL(uri);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");
	 
			if (conn.getResponseCode() != 200) {
				/*throw new RuntimeException("Failed : HTTP error code : "
						+ conn.getResponseCode());*/
				
				System.out.println("Failed : HTTP error code :" +conn.getResponseCode());
			}
	 
			BufferedReader br = new BufferedReader(new InputStreamReader(
				(conn.getInputStream())));
			
			String output;
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
				resp.getOutputStream().println(output);
			}
	 
			conn.disconnect();
	 
		  } catch (MalformedURLException e) {
	 
			e.printStackTrace();
	 
		  } catch (IOException e) {
	 
			e.printStackTrace();
	 
		  }
	}
	
	private String getURI(HttpServletRequest req){
		String uri = "";
		
		uri = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+req.getRequestURI().replace(req.getServletPath(), "/iorfile/resource/read");
		System.out.println("URI is" + uri);
		
		return uri;
	}
}
