package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

import dto.MemberDto;
import dto.ReserveDto;
import dto.RoomDto;

public class AdminDao {

	Connection conn;
	PreparedStatement pstmt;
	
	public AdminDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://localhost:3306/pension";
		conn = DriverManager.getConnection(db, "root", "5032");
	}
	
	public void close() throws Exception {
		pstmt.close();
		conn.close();
	}
	
	public void room_view(HttpServletRequest request) throws Exception {
		
		String sql = "select * from room order by price asc";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<RoomDto> list = new ArrayList<RoomDto>();
		
		while(rs.next()) {
			RoomDto dto = new RoomDto();
			dto.setBang(rs.getString("bang"));
			dto.setContent(rs.getString("content"));
			dto.setId(rs.getInt("id"));
			dto.setMax(rs.getInt("max"));
			dto.setMin(rs.getInt("min"));
			dto.setPrice(rs.getInt("price"));
			dto.setState(rs.getInt("state"));
			list.add(dto);
		}
		request.setAttribute("list", list);
		
		rs.close();
	}
	
	public String content_view(HttpServletRequest request) throws Exception {
		
		String id = request.getParameter("id");
		
		String sql = "select content from room where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		return rs.getString("content");
	}
	
	public void reserve_check(HttpServletRequest request) throws Exception {
		
		String sql = "select A.*,bang from reserve A,room B where B.id=A.bangid and A.state<3 order by A.checkin asc";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<ReserveDto> list = new ArrayList<ReserveDto>();
		
		while(rs.next()) {
			ReserveDto dto = new ReserveDto();
			dto.setBang(rs.getString("bang"));
			dto.setBangid(rs.getInt("bangid"));
			dto.setBbq(rs.getInt("bbq"));
			dto.setCharcoal(rs.getInt("charcoal"));
			dto.setCheckin(rs.getString("checkin"));
			dto.setCheckout(rs.getString("checkout"));
			dto.setId(rs.getInt("id"));
			dto.setInwon(rs.getInt("inwon"));
			dto.setState(rs.getInt("state"));
			dto.setTotal(rs.getInt("total"));
			dto.setWriteday(rs.getString("writeday"));
			dto.setUserid(rs.getString("userid"));
			list.add(dto);
		}
		
		request.setAttribute("list", list);
		rs.close();
	}
	
	public void reserve_checkAll(HttpServletRequest request) throws Exception {
		
		String sql = "select A.*,bang from reserve A,room B where B.id=A.bangid order by A.checkin desc";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<ReserveDto> list = new ArrayList<ReserveDto>();
		
		while(rs.next()) {
			ReserveDto dto = new ReserveDto();
			dto.setBang(rs.getString("bang"));
			dto.setBangid(rs.getInt("bangid"));
			dto.setBbq(rs.getInt("bbq"));
			dto.setCharcoal(rs.getInt("charcoal"));
			dto.setCheckin(rs.getString("checkin"));
			dto.setCheckout(rs.getString("checkout"));
			dto.setId(rs.getInt("id"));
			dto.setInwon(rs.getInt("inwon"));
			dto.setState(rs.getInt("state"));
			dto.setTotal(rs.getInt("total"));
			dto.setWriteday(rs.getString("writeday"));
			dto.setUserid(rs.getString("userid"));
			list.add(dto);
		}
		
		request.setAttribute("list", list);
		rs.close();
	}
	
	public void reserve_cancel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String sql = "update reserve set state=2 where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		
		close();
		response.sendRedirect("../manager/reserve.jsp");
	}
	
	public void member_check(HttpServletRequest request) throws Exception {
		
		String sql = "select * from member order by id desc";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		
		while(rs.next()) {
			MemberDto dto = new MemberDto();
			dto.setEmail(rs.getString("email"));
			dto.setId(rs.getInt("id"));
			dto.setName(rs.getString("name"));
			dto.setPhone(rs.getString("phone"));
			dto.setState(rs.getInt("state"));
			dto.setUserid(rs.getString("userid"));
			dto.setWriteday(rs.getString("writeday"));
			list.add(dto);
		}
		request.setAttribute("list", list);
		rs.close();
		
	}
	
	
	
	
	
	
	
	
	
}
