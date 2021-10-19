package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.mvc.dao.companion.CompanionDaoImpl;
import com.mvc.dto.AskConnect;
import com.mvc.dto.MessageDto;
import com.mvc.dto.UserDto;

@WebServlet("/message.do")
public class CompanionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		CompanionDaoImpl dao = new CompanionDaoImpl();
		System.out.println("서블릿 실행");
		
//		HttpSession session = request.getSession();
//		UserDto login_id = (UserDto)session.getAttribute("user_id");
		UserDto login_id = new UserDto();
		login_id.setUser_id("ADMIN");
		System.out.println("로그인 아이디 : " + login_id.getUser_id());
		
		String command = request.getParameter("command");
		System.out.println("[command : " + command + "]");
		
		if (command.equals("message")) {
			//로그인 유효성검사
			if (login_id.getUser_id() == null || login_id.getUser_id().trim().equals("")) {
				jsResponse("#","로그인을 해주세요.", response);
			} else {
				//로그인이 되어있음
				//반환받은 리스트는 유저별 최신 메세지임
				List<MessageDto> list = dao.connectionList(login_id.getUser_id());
				
				List<MessageDto> conList = new ArrayList<>();
				for (int i = 0; i < list.size(); i++) {
					MessageDto dto = new MessageDto();
					if (list.get(i).getRec_id().equals(login_id.getUser_id())) {
						dto.setSen_id(list.get(i).getSen_id());
					} else if(list.get(i).getSen_id().equals(login_id.getUser_id())) {
						dto.setSen_id(list.get(i).getRec_id());
					}
					if (list.get(i).getMessage().length() > 27) {
						//25자가 넘어가면...으로 넣어줘야함
						String temp2 = list.get(i).getMessage();
						String temp = list.get(i).getMessage().charAt(25) + "";
						String temp3 = temp2.substring(0, temp2.lastIndexOf(temp)) + ".....";
						dto.setMessage(temp3);
						System.out.println(temp3);
					} else {
						dto.setMessage(list.get(i).getMessage());
					}
					dto.setM_time(list.get(i).getM_time());
					conList.add(dto);
				}
				
				//가공한 conList를 응답해주자
				request.setAttribute("conList", conList);
				dispatch("companion/message.jsp", request, response);
			}
		} else if (command.equals("askConnect")) {
			//ajax 를 이용한 비동기통신 ..
			
		} else if (command.equals("detailMessage")) {
			//sen_id 파라미터로 넘어옴, massengerRoom페이지로 데이터 넘겨서 뿌려줘야함
			String sen_id = request.getParameter("sen_id");
			List<MessageDto> list = dao.getMessage(login_id.getUser_id(), sen_id);
			
			MessageDto dto = new MessageDto();
			dto.setChat_serial(list.get(0).getChat_serial());
			dto.setSen_id(sen_id);
			list.add(dto);
			
			request.setAttribute("detailList", list);
			dispatch("companion/messengerRoom.jsp", request, response);
		} else if (command.equals("sendMessage")) {
			String con_id = request.getParameter("con_id");
			String message = request.getParameter("message");
			String chat_serial = request.getParameter("chat_serial");
			
			dao.sendRecMessage(chat_serial, login_id.getUser_id(), con_id, message);
			
		}
	}
	
	public void jsResponse(String url, String message, HttpServletResponse response) throws IOException {
		String script = "<script type='text/javascript'> "
					  + "alert('" + message + "'); "
					  + "location.href = '" + url + "';"
					  + "</script>";
		PrintWriter writer = response.getWriter();
		writer.print(script);
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
