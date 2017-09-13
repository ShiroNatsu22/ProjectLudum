package dao;

import model.Company;
import model.DataBase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CompanyDAOImpl implements CompanyDAO {

    private DataBase db;

    public CompanyDAOImpl() {
        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");
    }

    @Override
    public List<Company> getAllCompanies() {

        String query = "SELECT * FROM companies";
        return getCompanies(query);

    }

    @Override
    public Company getCompanyByID(int company_id_pk) {

        String query = "SELECT * FROM companies WHERE companies.company_id_pk = " + String.valueOf(company_id_pk);
        List<Company> companyList = getCompanies(query);

        if (!(companyList.isEmpty()))
            return companyList.get(0);

        return new Company();

    }

    @Override
    public int createCompany(Company company) {

        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        int resultCompany_id_pk = -1;
        String query = "INSERT INTO companies (name, founded) VALUES(?,?)";

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);

            ps.setString(1, company.getName());
            ps.setDate(2, new Date(company.getFounded().getTime()));
            ps.execute();

            rs = ps.getGeneratedKeys();

            if (rs.next())
                resultCompany_id_pk = rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, rs);
        }

        return resultCompany_id_pk;

    }

    @Override
    public void deleteCompany(int company_id_pk) {

        Connection connection = null;
        PreparedStatement ps = null;

        String query = String.format("DELETE FROM companies WHERE companies.company_id_pk = %d", company_id_pk);

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);

            ps.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, null);
        }

    }

    private List<Company> getCompanies(String query) {

        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Company> companyList = new ArrayList<>();

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                companyList.add(new Company(rs.getInt("company_id_pk"), rs.getString("name"), rs.getDate("founded")));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, rs);
        }

        return companyList;
    }

}
