package handler.calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calendar.CalendarDBBean;
import calendar.CalendarDataBean;
import handler.CommandHandler;

public class CdDeleteProHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse respose) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		CalendarDataBean cdDto = new CalendarDataBean();
		cdDto.setId((String)request.getSession().getAttribute("memId"));
		cdDto.setCd_year(Integer.parseInt(request.getParameter("year")));
		cdDto.setCd_month(Integer.parseInt(request.getParameter("month")));
		cdDto.setCd_day(Integer.parseInt(request.getParameter("day")));
		
		CalendarDBBean cdDao = CalendarDBBean.getInstance();
		int result = cdDao.deleteSch( cdDto );
		
		request.setAttribute("result", result);
		
		return "/calendar/cdDeletePro.jsp";
	}

}
