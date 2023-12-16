package com.acorn.tour.hotkok;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@Repository
public class HotkokRepository {

    @Autowired
    private DataSource ds;
    
    public ArrayList<HotkokDTO> getTravelInfo(int sidocode, int index) {
        ArrayList<HotkokDTO> hotkok = new ArrayList<>();
        try {
        	String sql = " SELECT * FROM ( " +
        	        "  SELECT ROWNUM num, SidoCode, nickName, CONTENTID, TITLE, sigungucode, Name, firstimage, SEARCHCOUNT " +
        	        "    FROM ( " +
        	        "      SELECT s.SidoCode, s.nickName, f.CONTENTID, f.TITLE, g.sigungucode, g.Name name, f.firstimage, f.SEARCHCOUNT " +
        	        "        FROM FamousPlaceTbl f " +
        	        "        JOIN SidoTbl s ON s.SidoCode = f.sidoCode " +
        	        "        JOIN SigunguTbl g ON f.SIGUNGUCODE = g.sigungucode " +
        	        "      ORDER BY f.SEARCHCOUNT " +
        	        "    ) g " +
        	        " ) WHERE sidocode = ? and num BETWEEN ? AND ? ";

            Connection con = ds.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, sidocode );
            pst.setInt(2, (index - 1) * 12 + 1);
            pst.setInt(3, index * 12);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                HotkokDTO hotkokDTO = new HotkokDTO();
                hotkokDTO.setSidocode(rs.getInt("SidoCode"));
                hotkokDTO.setNickName(rs.getString("nickName"));
                hotkokDTO.setContentid(rs.getString("CONTENTID"));
                hotkokDTO.setTitle(rs.getString("TITLE"));
                hotkokDTO.setSigunguCode(rs.getString("sigungucode"));
                hotkokDTO.setSigunguName(rs.getString("Name"));
                hotkokDTO.setFirstimage(rs.getString("firstimage"));
                hotkokDTO.setSearchCount(rs.getString("SEARCHCOUNT"));
                hotkok.add(hotkokDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hotkok;
    }

    public ArrayList<HotkokDTO> getFoodInfo(int sidocode, int index) {
        ArrayList<HotkokDTO> hotkok = new ArrayList<>();
        try {
            String sql = " SELECT * FROM ( " +
                    "  SELECT num, SidoCode, nickName, CONTENTID, TITLE, sigungucode, Name, firstimage, SEARCHCOUNT " +
                    "    FROM ( " +
                    "      SELECT ROWNUM num, s.SidoCode, s.nickName, f.CONTENTID, f.TITLE, g.sigungucode, g.Name name, f.firstimage, f.SEARCHCOUNT " +
                    "        FROM FamousRestTbl f " +
                    "        JOIN SidoTbl s ON s.SidoCode = f.sidoCode " +
                    "        JOIN SigunguTbl g ON f.SIGUNGUCODE = g.sigungucode " +
                    "      ORDER BY f.SEARCHCOUNT " +
                    "    ) " +
                    " ) WHERE sidocode = ? and num BETWEEN ? AND ? " +
                    "  order by num ";                  

            Connection con = ds.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, sidocode );
            pst.setInt(2, (index - 1) * 12 + 1);
            pst.setInt(3, index * 12);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                HotkokDTO hotkokDTO = new HotkokDTO();
                hotkokDTO.setSidocode(rs.getInt("SidoCode"));
                hotkokDTO.setNickName(rs.getString("nickName"));
                hotkokDTO.setContentid(rs.getString("CONTENTID"));
                hotkokDTO.setTitle(rs.getString("TITLE"));
                hotkokDTO.setSigunguCode(rs.getString("sigungucode"));
                hotkokDTO.setSigunguName(rs.getString("Name"));
                hotkokDTO.setFirstimage(rs.getString("firstimage"));
                hotkokDTO.setSearchCount(rs.getString("SEARCHCOUNT"));
                hotkok.add(hotkokDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hotkok;
    }
}