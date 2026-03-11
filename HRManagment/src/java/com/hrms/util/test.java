import java.sql.Connection;
import com.hrms.util.DBConnection;

public class test {

    public static void main(String[] args) {

        Connection con = DBConnection.getConnection();

        if(con != null){
            System.out.println("Connection successful!");
        } else {
            System.out.println("Connection failed.");
        }
    }
}