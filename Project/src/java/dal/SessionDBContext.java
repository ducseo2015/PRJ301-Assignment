/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Group;
import model.Instructor;
import model.Room;
import model.Session;
import model.TimeSlot;
import java.sql.Date;

/**
 *
 * @author Nguyen Hoang Minh
 */
public class SessionDBContext extends DBContext<Session> {

    @Override
    public void insert(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Session get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Session> getSession(String instuctorId, Date monday, Date sunday) {
        ArrayList<Session> sessions = new ArrayList<>();
        sessions.add(new Session());
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "Select s.sessionId,s.[date],g.groupId,g.groupName,c.courseId,c.courseName,i.instructorId,i.instructorName,t.slotId,t.slotNumber,t.startTime,t.endTime,r.roomId\n"
                    + "From [Session] s inner join Instructor i on s.lecturerId=i.instructorId\n"
                    + "inner join TimeSlot t on s.slotId=t.slotId\n"
                    + "inner join Room r on s.roomId=r.roomId\n"
                    + "inner join [Group] g on s.groupId=g.groupId\n"
                    + "inner join Course c on g.courseId=c.courseId\n"
                    + "where i.instructorId=? and s.[date] between ? and ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, instuctorId);
            stm.setDate(2, monday);
            stm.setDate(3, sunday);
            rs = stm.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setId(rs.getInt("sessionId"));
                s.setDate(rs.getDate("date"));

                Instructor i = new Instructor();
                i.setId(rs.getString("instructorId"));
                i.setId(rs.getString("instructorName"));

                Course c = new Course();
                c.setId(rs.getString("courseId"));
                c.setName(rs.getString("courseName"));

                Group g = new Group();
                g.setId(rs.getInt("groupId"));
                g.setName(rs.getString("groupName"));
                g.setCourse(c);
                g.setInstructor(i);

                TimeSlot t = new TimeSlot();
                t.setId(rs.getInt("slotId"));
                t.setSlotNumber(rs.getInt("slotNumber"));
                t.setStartTime(rs.getTime("startTime"));
                t.setEndTime(rs.getTime("endTime"));

                Room r = new Room();
                r.setId(rs.getString("roomId"));

                s.setGroup(g);
                s.setInstructor(i);
                s.setSlot(t);
                s.setRoom(r);
                sessions.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return sessions;
    }

    @Override
    public ArrayList<Session> all() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
