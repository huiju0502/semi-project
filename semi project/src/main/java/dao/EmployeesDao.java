package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBUtil;
import vo.Employees;
import vo.Id;

public class EmployeesDao {
	// 1) 직원 목록 조회(관리자용)
		public ArrayList<Employees> selectEmployeesListByPage(int beginRow, int rowPerPage) throws Exception {
			// db연결
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			// 리스트 불러오기
			String employeesListSql ="SELECT e.id id, e.emp_name empName, e.emp_level empLevel, e.createdate createdate, e.updatedate updatedate, id.active active FROM employees e, id_list id WHERE e.id =id.id ORDER BY id.active, empLevel DESC, empName LIMIT ?, ?";
			PreparedStatement employeesListStmt = conn.prepareStatement(employeesListSql);
			employeesListStmt.setInt(1, beginRow);
			employeesListStmt.setInt(2, rowPerPage);
			ResultSet employeesListRs = employeesListStmt.executeQuery();
			
			ArrayList<Employees> list = new ArrayList<>();
			while(employeesListRs.next()) {
				Employees e = new Employees();
				e.setId(employeesListRs.getString("id"));
				e.setEmpName(employeesListRs.getString("empName"));
				e.setEmpLevel(employeesListRs.getInt("empLevel"));
				e.setCreatedate(employeesListRs.getString("createdate"));
				e.setUpdatedate(employeesListRs.getString("updatedate"));
				e.setActive(employeesListRs.getString("active"));
				
				list.add(e);
			}
			return list;
		}
		
	// 2) 직원 전체row
		public int selectEmployeesCnt() throws Exception {
			// db 연결
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
					
			// 전체 행수 구하기
			int row = 0;
			String totalRowSql ="SELECT count(*) FROM employees";
			PreparedStatement totalRowStmt = conn.prepareStatement(totalRowSql);
			ResultSet totalRowRs = totalRowStmt.executeQuery();
			if(totalRowRs.next()) {
				row = totalRowRs.getInt("count(*)");
			}
			return row;
		}
		
	// 3) 수정 하기위해 직원 정보 상세 불러오기(관리자2: 모두, 관리자1: 본인것만)
		public Employees selectEmployeesOne(String id) throws Exception {
			// db연결
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			// 상세정보 불러오기
			Employees e = null;
			String employeesOneSql = "SELECT e.id id, e.emp_name empName, e.emp_level empLevel, e.createdate createdate, e.updatedate updatedate, id.active active FROM employees e, id_list id WHERE e.id =id.id AND id.id = ?"; 
			PreparedStatement employeesOneStmt = conn.prepareStatement(employeesOneSql);
			employeesOneStmt.setString(1, id);
			ResultSet employeesOneRs = employeesOneStmt.executeQuery();
			
			if(employeesOneRs.next()) {
				e = new Employees();
				e.setId(employeesOneRs.getString("id"));
				e.setEmpName(employeesOneRs.getString("empName"));
				e.setEmpLevel(employeesOneRs.getInt("empLevel"));
				e.setCreatedate(employeesOneRs.getString("createdate"));
				e.setUpdatedate(employeesOneRs.getString("updatedate"));
				e.setActive(employeesOneRs.getString("active"));
			}
			return e;
		}

	// 4) 직원수정(관리자2용)
		public int updateEmployees(Employees employees) throws Exception {
			// db연결
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			// 수정(update) SQL
			String updateSql = "UPDATE employees SET emp_name = ?, emp_level = ?, updatedate = now() WHERE id = ?";
			PreparedStatement updateStmt = conn.prepareStatement(updateSql);
			updateStmt.setString(1, employees.getEmpName());
			updateStmt.setInt(2, employees.getEmpLevel());
			updateStmt.setString(3, employees.getId());
			int row = updateStmt.executeUpdate();
			
			return row;
		}
		
	// 5) 직원 삭제(관리자2용 : 삭제버튼 누르면 활성화가 Y에서 D으로 바꿈) 
		public int updateEmpActive(Id idList) throws Exception {
			// db연결
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
											
			// 수정(update) SQL
			String updateEmpActiveSql = "UPDATE id_list SET active = ? WHERE id = ?";				
			PreparedStatement updateEmpActiveStmt = conn.prepareStatement(updateEmpActiveSql);
			updateEmpActiveStmt.setString(1, idList.getActive());
			updateEmpActiveStmt.setString(2, idList.getId());
			int row = updateEmpActiveStmt.executeUpdate();
											
			return row;
		}
		
	// 6) 직원 추가
		public int insertEmployees(Employees addEmployees) throws Exception {
			// db연결
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			// 입력(insert) SQL
			String insertEmpSql = "INSERT INTO employees(id, emp_name, emp_level, createdate, updatedate) VALUES(?, ?, ?, now(), now())";
			PreparedStatement insertEmpStmt = conn.prepareStatement(insertEmpSql);
			insertEmpStmt.setString(1, addEmployees.id);
			insertEmpStmt.setString(2, addEmployees.empName);
			insertEmpStmt.setInt(3, addEmployees.empLevel);
			int row = insertEmpStmt.executeUpdate();
			 
			return row;
		}
	// 7) 전체관리자조회 // 세션값 분기를위해 관리자 아이디를 가져올 수 있도록하려고 만들어둠
	public ArrayList<Employees> selectEmployeesList() throws Exception {
	    // db연결
	    DBUtil dbUtil = new DBUtil();
	    Connection conn = dbUtil.getConnection();
	    
	    // 리스트 불러오기
	    String employeesListSql = "SELECT id, emp_name, emp_level, createdate, updatedate FROM employees";
	    PreparedStatement employeesListStmt = conn.prepareStatement(employeesListSql);
	    ResultSet employeesListRs = employeesListStmt.executeQuery();
	    
	    ArrayList<Employees> selectEmployeesList = new ArrayList<>();
	    while (employeesListRs.next()) {
	        Employees e = new Employees();
	        e.setId(employeesListRs.getString("id"));
	        e.setEmpName(employeesListRs.getString("emp_name"));
	        e.setEmpLevel(employeesListRs.getInt("emp_level"));
	        e.setCreatedate(employeesListRs.getString("createdate"));
	        e.setUpdatedate(employeesListRs.getString("updatedate"));
	        
	        selectEmployeesList.add(e);
	    }
	    return selectEmployeesList;
	}
	
	// 8) 관리자1 조회 // 세션값 분기를위해 관리자1 아이디를 가져올 수 있도록하려고 만들어둠
	public ArrayList<Employees> oneEmployeesList() throws Exception {
	    // db연결
	    DBUtil dbUtil = new DBUtil();
	    Connection conn = dbUtil.getConnection();
	    
	    // 리스트 불러오기
	    String oneEmployeesListSql = "SELECT id, emp_name, emp_level, createdate, updatedate FROM employees WHERE emp_level = 1";
	    PreparedStatement oneEmployeesListStmt = conn.prepareStatement(oneEmployeesListSql);
	    ResultSet oneEmployeesListRs = oneEmployeesListStmt.executeQuery();
	    
	    ArrayList<Employees> oneEmployeesList = new ArrayList<>();
	    while (oneEmployeesListRs.next()) {
	        Employees e = new Employees();
	        e.setId(oneEmployeesListRs.getString("id"));
	        e.setEmpName(oneEmployeesListRs.getString("emp_name"));
	        e.setEmpLevel(oneEmployeesListRs.getInt("emp_level"));
	        e.setCreatedate(oneEmployeesListRs.getString("createdate"));
	        e.setUpdatedate(oneEmployeesListRs.getString("updatedate"));
	        oneEmployeesList.add(e);
	    }
	    return oneEmployeesList;
	}
	
	// 9) 관리자2 조회 : 권한에 따른 분기를 위해 관리자2(최고위직) 아이디를 가져올 수 있도록
		public ArrayList<Employees> twoEmployeesList() throws Exception {
		    // db연결
		    DBUtil dbUtil = new DBUtil();
		    Connection conn = dbUtil.getConnection();
		    
		    // 리스트 불러오기
		    String twoEmployeesListSql = "SELECT id, emp_name, emp_level, createdate, updatedate FROM employees WHERE emp_level = 2";
		    PreparedStatement twoEmployeesListStmt = conn.prepareStatement(twoEmployeesListSql);
		    ResultSet twoEmployeesListRs = twoEmployeesListStmt.executeQuery();
		    
		    ArrayList<Employees> twoEmployeesList = new ArrayList<>();
		    while (twoEmployeesListRs.next()) {
		        Employees e = new Employees();
		        e.setId(twoEmployeesListRs.getString("id"));
		        e.setEmpName(twoEmployeesListRs.getString("emp_name"));
		        e.setEmpLevel(twoEmployeesListRs.getInt("emp_level"));
		        e.setCreatedate(twoEmployeesListRs.getString("createdate"));
		        e.setUpdatedate(twoEmployeesListRs.getString("updatedate"));
		        twoEmployeesList.add(e);
		    }
		    return twoEmployeesList;
		}
}


