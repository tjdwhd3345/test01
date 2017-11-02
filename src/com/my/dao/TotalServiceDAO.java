package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.my.sql.MyConnection;
import com.my.vo.TotalService;

public class TotalServiceDAO {
    public TotalServiceDAO() {
        
    }
    
    public List<TotalService> selectAllService(){
        List<TotalService> tsList=new ArrayList<TotalService>();
        TotalService ts=null;
        
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        String selectSQL="select * from total_service where no like '%01'";
        try {
            con=MyConnection.getConnection();
            pstmt=con.prepareStatement(selectSQL);
            rs=pstmt.executeQuery();
            while(rs.next()) {
                ts=new TotalService(rs.getInt("no"), rs.getString("name"), rs.getString("service"));
                tsList.add(ts);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MyConnection.close(pstmt, con, rs);
        }
        
        return tsList;
    }
}
