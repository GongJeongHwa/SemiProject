package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.mvc.biz.BizImpl;
import com.mvc.dto.blogDto;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/blog.do")
public class blog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public blog() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		if(command.equals("bloglist")) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			
			ArrayList<blogDto> dtolist = new BizImpl().getBlogList();
			JSONArray jarray = new JSONArray();

			for(int i = 0; i < dtolist.size(); i++) {
				JSONObject json = new JSONObject();
				
				String createDate = format.format(dtolist.get(i).getBlog_create_date());
				json.put("createDate", createDate);
				String mindate = format.format(dtolist.get(i).getMindate());
				json.put("mindate", mindate);
				String maxdate = format.format(dtolist.get(i).getMaxdate());
				json.put("maxdate", maxdate);
				
				json.put("userid", dtolist.get(i).getUser_id());
				json.put("penalty", dtolist.get(i).getUser_penalty());
				json.put("blogseq", dtolist.get(i).getBlog_seq());
				json.put("title", dtolist.get(i).getTitle());
				json.put("content", dtolist.get(i).getContent());
				json.put("area", dtolist.get(i).getAreaname());
				json.put("path", dtolist.get(i).getThumbnailPath());
				json.put("blogheart", dtolist.get(i).getHeart_count());
				json.put("comment", dtolist.get(i).getComment());
				json.put("hits", dtolist.get(i).getHits());
				jarray.add(json);
			}
			System.out.println(jarray);
			PrintWriter out = response.getWriter();
			out.print(jarray.toJSONString());
		}
		
		if(command.equals("blogone")) {
			
		}
		
		
		
	}

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse reponse) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, reponse);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
