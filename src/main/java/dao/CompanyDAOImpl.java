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

        int resultCompany_id_pk = -1;

        try {

            ResultSet rs;
            String query = "INSERT INTO companies (name, founded) VALUES(?,?)";
            PreparedStatement ps = db.getConnection(query);

            ps.setString(1, company.getName());
            ps.setDate(2, new Date(company.getFounded().getTime()));
            ps.execute();

            rs = ps.getGeneratedKeys();

            if (rs.next())
                resultCompany_id_pk = rs.getInt(1);

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultCompany_id_pk;

    }

    @Override
    public void deleteCompany(int company_id_pk) {

        try {

            // Borramos la relación entre company y developer
            String query = String.format("DELETE FROM gamerlistDB.developers WHERE company_id_fk = %d;", company_id_pk);

            // Borramos la relación entre company y publisher
            query += String.format("DELETE FROM gamerlistDB.publishers WHERE company_id_fk = %d;", company_id_pk);

            // Borramos la empresa
            query += String.format("DELETE FROM companies WHERE companies.company_id_pk = %d", company_id_pk);

            PreparedStatement ps = db.getConnection(query);

            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private List<Company> getCompanies(String query) {

        List<Company> companyList = new ArrayList<Company>();

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

}
