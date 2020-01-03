/*Ying Zhang
Yujia Qiu
Team3*/
import java.sql.*;
import java.util.Scanner;

public class pf3 {

    public static void main(String[] args) {

        if(args.length == 2){
            System.out.println(
                    "Example usage: java pf3 <username> <password> [option]\n" +
                    "1 -- Report Patient Information \n" +
                    "2 -- Report Primary Care Physician Information \n" +
                    "3 -- Report Operation Information \n" +
                    "4 -- Update Patient Blood Type \n" +
                            "5 -- Exit Program \n" );
        }
        if(args.length <2 || args.length >3){
            System.out.println("Arguments Error");
            System.out.println("Correct arguments format should be : java pf3 <username> <password> [option]");
        }

        String username = args[0];
        String password = args[1];
        System.out.println("-------Oracle JDBC COnnection Testing for pf3---------");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

        } catch (ClassNotFoundException e){
            System.out.println("Where is your Oracle JDBC Driver?");
            e.printStackTrace();
            return;
        }

        System.out.println("Oracle JDBC Driver Registered!");
        Connection connection= null;

        try {
            connection = DriverManager.getConnection(
                    "jdbc:oracle:thin:@csorcl.cs.wpi.edu:1521:orcl",username,password);
        } catch (SQLException e) {
            System.out.println("Connection Failed! Check output console");
            e.printStackTrace();
            return;
        }
        System.out.println("Oracle JDBC Driver Connected!");
        int mode = Integer.parseInt(args[2]);
        Scanner input = new Scanner(System.in);

        switch (mode){
            case 1:
                Rp_Patient_Info(input,connection);
                break;
            case 2:
                Rp_PCP_Info(input,connection);
                break;
            case 3:
                Rp_Operation_Info(input,connection);
                break;
            case 4:
                Up_Patient_BType(input,connection);
                break;
            case 5:
                input.close();
                return;
            default:
                System.out.println("mode can only be 1-5");
                input.close();
                return;


    }
    input.close();

    }

    private static void Up_Patient_BType(Scanner input,Connection connection) {
        System.out.println("Enter the Patient’s Healthcare ID: ");
        String new_PHID = input.nextLine();
        System.out.println("Enter the Updated Blood Type: ");
        String new_BType = input.nextLine();
        try{
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(("update PATIENT set BLOODTYPE = " + "\'" + new_BType + "\'" + " where HEALTHCAREID = \'" + new_PHID + "\'"));

            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private static void Rp_Operation_Info(Scanner input,Connection connection) {
        System.out.println("Enter Operation Invoice Number: ");
        int Operation_IN = input.nextInt();

        try{
            Statement statement = connection.createStatement();
            String str = "SELECT OP.invoiceNumber,OP.operationDate, DO.firstName || DO.lastName as SName, boardCertified, PA.firstName|| PA.lastname as PName,bloodType,city,state\n" +
                    "FROM Operation OP JOIN Patient PA\n" +
                    "    on PA.healthCareID = OP.healthCareID \n" +
                    "    JOIN Surgeon SU\n" +
                    "    on SU.physicianID = OP.physicianID\n" +
                    "    JOIN Doctor DO\n" +
                    "    on DO.physicianID = SU.physicianID\n" +
                    "WHERE OP.invoiceNumber = " +Operation_IN;
            ResultSet resultSet = statement.executeQuery(str);

            int Invoice_Number = 0;
            String Operation_Date = "";
            String Surgeon_Full_Name = "";
            String ISBoardCertified = "";
            String Patient_Full_Name= "";
            String Blood_Type ="";
            String City = "";
            String State = "";

            while ((resultSet.next())){
                Invoice_Number = resultSet.getInt("invoiceNumber");
                Operation_Date = resultSet.getString("operationDate");
                Surgeon_Full_Name = resultSet.getString("SName");
                ISBoardCertified = resultSet.getString("boardCertified");
                Patient_Full_Name= resultSet.getString("PName");
                Blood_Type =resultSet.getString("bloodType");
                City = resultSet.getString("city");
                State = resultSet.getString("state");
            }

            System.out.println("Operation Information");
            System.out.println("Invoice Number: " +Invoice_Number );
            System.out.println("Operation Date: " +Operation_Date);
            System.out.println("Surgeon Full Name: " +Surgeon_Full_Name);
            System.out.println("Board Certified?: " +ISBoardCertified);
            System.out.println("Patient Full Name: "+Patient_Full_Name);
            System.out.println("Blood Type: "+Blood_Type);
            System.out.println("City: "+City);
            System.out.println("State: "+State);

            resultSet.close();
            statement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    private static void Rp_PCP_Info(Scanner input,Connection connection) {
        System.out.println("Enter Primary Care Physician ID:: ");
        int PCPPID = input.nextInt();
        try{
            Statement statement = connection.createStatement();
            String str = "SELECT firstName || lastname as fullName,specialty,PC.physicianID,medicalFacility\n" +
                    "FROM Doctor DO JOIN PCP PC \n" +
                    "    on DO.physicianID = PC.physicianID\n" +
                    "Where PC.physicianID = " + PCPPID;
            ResultSet resultSet = statement.executeQuery(str);

            int Physician_ID = 0;
            String Full_Name = "";
            String Specialty = "";
            String Medical_Facility = "";

            while ((resultSet.next())){
                Physician_ID = resultSet.getInt("physicianID");
                Full_Name = resultSet.getString("fullName");
                Specialty = resultSet.getString("specialty");
                Medical_Facility = resultSet.getString("medicalFacility");
            }
            System.out.println("Primary Care Physician Information");
            System.out.println("Full Name: " +Full_Name);
            System.out.println("Physician ID: " +Physician_ID);
            System.out.println("Specialty: " +Specialty);
            System.out.println("Medical Facility: "+Medical_Facility);

            resultSet.close();
            statement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    private static void Rp_Patient_Info(Scanner input,Connection connection) {
        System.out.println("Enter Patient’s Healthcare ID: ");
        int PHID = input.nextInt();

        try{
            Statement statement = connection.createStatement();
            String str = "SELECT  * FROM PATIENT WHERE HEALTHCAREID = " + PHID;
            ResultSet resultSet = statement.executeQuery(str);

            int Healthcare_ID = 0;
            String First_Name = "";
            String Last_Name = "";
            String City = "";
            String State= "";
            String Birth_Date ="";
            String Blood_Type = "";

            while ((resultSet.next())){
                Healthcare_ID = resultSet.getInt("healthCareID");
                First_Name = resultSet.getString("firstName");
                Last_Name = resultSet.getString("lastName");
                City = resultSet.getString("city");
                State= resultSet.getString("state");
                Birth_Date =resultSet.getString("birthDate");
                Blood_Type = resultSet.getString("bloodType");
            }

            System.out.println("Patient Information");
            System.out.println("Healthcare ID: " +Healthcare_ID );
            System.out.println("First Name: " +First_Name);
            System.out.println("Last Name: " +Last_Name);
            System.out.println("City: " +City);
            System.out.println("State: "+State);
            System.out.println("Birth Date: "+Birth_Date);
            System.out.println("Blood Type: "+Blood_Type);

            resultSet.close();
            statement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}

