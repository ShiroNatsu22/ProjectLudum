package dao;

import model.Company;
import model.DataBase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

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

        List<Company> companyList = new ArrayList<Company>();
        String query = "SELECT * FROM companies";

        try {

            PreparedStatement ps = db.getConnection(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                companyList.add(new Company(rs.getInt("company_id_pk"), rs.getString("name"), rs.getDate("founded")));
            }

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return companyList;

    }

    @Override
    public void createCompany(Company company) {

        try {

            String query = "INSERT INTO companies (name, founded) VALUES(?,?)";
            PreparedStatement ps = db.getConnection(query);

            ps.setString(1, company.getName());
            ps.setDate(2, new Date(company.getFounded().getTime()));
            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void deleteCompany(int company_id_pk) {

        try {

            String query = "DELETE FROM companies WHERE companies.company_id_pk = ?";
            PreparedStatement ps = db.getConnection(query);

            ps.setInt(1, company_id_pk);
            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
