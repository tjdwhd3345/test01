package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.my.sql.MyConnection;
import com.my.vo.HotelService;

public class HotelServiceDAO {
    public HotelServiceDAO() {}
    
    public List<HotelService> selectService(String hotelno) {
        HotelService hs=null;
        List<HotelService> hsList=new ArrayList<HotelService>();
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        String selectSQL="select * from total_service join answer on service_no=no where hotel_no=?";
        String result="";
        try {
            con=MyConnection.getConnection();
            pstmt=con.prepareStatement(selectSQL);
            pstmt.setString(1, hotelno);
            rs=pstmt.executeQuery();
            while(rs.next()) {
                hs=new HotelService(rs.getInt("no"), rs.getString("name"), rs.getString("service"));
                //hs.setItems(rs.getString("items"));
                //result=rs.getString("items");
                hsList.add(hs);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MyConnection.close(pstmt, con, rs);
        }
        return hsList;
        //return result;
    }
}
