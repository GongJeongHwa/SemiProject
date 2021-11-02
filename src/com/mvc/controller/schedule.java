package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.mvc.biz.BizImpl;
import com.mvc.dto.UserDto;
import com.mvc.dto.blogDto;

/**
 * Servlet implementation class schedule
 */
@WebServlet("/schedule.do")
public class schedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public schedule() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		UserDto dto = (UserDto)session.getAttribute("UserDto");
		String command = request.getParameter("command");
		PrintWriter pw = response.getWriter();
		
		if(command.equals("schedule")) {
			
			dispatch("/schedule/createSchedule_sk.jsp", request, response);
			
		}
		
		
		
		
		
		if(command.equals("addschedule")) {
			
			if(dto != null) {
				System.out.println("여기");
				
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String area = request.getParameter("nation");
				String thumbnail = request.getParameter("thumbnail");
				
				/*
				 * System.out.println(dto.getName()); System.out.println(title);
				 * System.out.println(content); System.out.println(area);
				 * System.out.println(thumbnail);
				 * System.out.println(request.getParameter("value"));
				 */
				
				blogDto bdto = new blogDto();
				bdto.setUser_id(dto.getUser_id());
				bdto.setTitle(title);
				bdto.setContent(content);
				bdto.setAreaname(area);
				bdto.setThumbnailPath(thumbnail);
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				
				JSONParser parser = new JSONParser();
				try {
					JSONArray jsonArr = (JSONArray)parser.parse(request.getParameter("value"));
					
					
					for(int i = 0; i < jsonArr.size(); i++) {
						JSONObject jsonObj = (JSONObject)jsonArr.get(i);
						String date = (String)jsonObj.get("date");
						
						Date formattedDate = null;
						try {
							formattedDate = sdf.parse(date);
						} catch (java.text.ParseException e) {
							e.printStackTrace();
						}
						String place = (String)jsonObj.get("String");
						
						bdto.getMap().put(formattedDate, place);
					}
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				int res = new BizImpl().addSchedule(bdto);
				System.out.println(res); //콘솔은 값이 잘 나옴
				if(res > 0) {
					dispatch("/blog.do?command=selectone&blogseq="+ res +"&user_id="+ bdto.getUser_id(), request, response);
				}else {
					response.sendRedirect(request.getContextPath() + "/schedule/createSchedule_sk.jsp");
				}
			}else {
				
			}
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
