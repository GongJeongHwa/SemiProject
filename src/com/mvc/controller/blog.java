package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
		if(command.equals("getlist")) {
			ArrayList<blogDto> dtolist = new ArrayList<blogDto>();
			dtolist.add(new blogDto("허성태",1,"야이 개xx들아aaaa","cccccccccccccccccccc","img/background/back1.jpg",1,10,3,35000));
			dtolist.add(new blogDto("oilnam",1,"제주도 일정","이러다가 나 혼자가","img/background/back2.jpg",1651,7,0,47700));
			dtolist.add(new blogDto("sunggihoon",1,"영감님","저랑 가실래요?","img/background/back3.jpg",751,10,0,50000));
			dtolist.add(new blogDto("test1",1,"testtitle","testcontent","img/background/back4.jpg",1,3,2,11));
			dtolist.add(new blogDto("test2",1,"testtitle2","testcontent2","img/background/back5.jpg",1,3,2,232));
			dtolist.add(new blogDto("test3",1,"testtitle3","testcontent3","img/background/back6.jpg",1,3,2,4456));
		
			JSONArray jarray = new JSONArray();
			
			for(int i = 0; i < dtolist.size(); i++) {
				JSONObject json = new JSONObject();
				json.put("userid", dtolist.get(i).getUser_id());
				json.put("blogseq", dtolist.get(i).getBlog_seq());
				json.put("title", dtolist.get(i).getTitle());
				json.put("content", dtolist.get(i).getContent());
				json.put("path", dtolist.get(i).getThumbnailPath());
				json.put("blogheart", dtolist.get(i).getHeart_count());
				json.put("comment", dtolist.get(i).getComment());
				json.put("penalty", dtolist.get(i).getUser_penalty());
				json.put("hits", dtolist.get(i).getHits());
				jarray.add(json);
			}
			
			PrintWriter out = response.getWriter();
			out.print(jarray.toJSONString());
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
